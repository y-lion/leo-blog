package cn.cloudleo.biz.controller;

import cn.cloudleo.common.constants.enums.CommonEnum;
import cn.cloudleo.common.exception.GlobalException;
import cn.cloudleo.common.properties.QiniuProperties;
import cn.cloudleo.common.properties.LeoProperties;
import cn.cloudleo.common.utils.R;
import cn.cloudleo.biz.entity.QiNiuEntity;
import cn.cloudleo.common.utils.StringUtil;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.Auth;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

/**
 * 对七牛云对象储存的操作接口
 * 关于七牛云开放的Java-API文档请看：https://developer.qiniu.com/kodo/sdk/1662/java-sdk-6
 * 文件上传的DEMO请看 /test/java/cn/cloudleo/UploadDemo.java 测试类。
 * 请先到七牛云个人控制中心查看Access key 和 Secret Key
 *
 * @auther cloudleo
 * @date 2020/6/28
 */
@Slf4j
@RestController
@RequestMapping("/qiniu")
@Api(value = "QiNiuController", tags = {"七牛云接口"})
public class QiNiuController {

    @Autowired
    private LeoProperties properties;

    private void check(QiniuProperties qiniu) {
        if (StringUtils.isBlank(qiniu.getAk()) || StringUtils.isBlank(qiniu.getSk()) || StringUtils.isBlank(qiniu.getBn()) || StringUtils.isBlank(qiniu.getUrl())) {
            throw new GlobalException("请先完善七牛云服务配置，再进行操作");
        }
    }

    /**
     * 获取七牛云个人储存空间域名地址
     *
     * @return
     */
    @GetMapping("/domain")
    public R domain() {
        QiniuProperties qiniu = properties.getQiniu();
        return new R<>(qiniu.getUrl());
    }

    /**
     * 七牛云开放API接口：获取空间文件列表接口，详细的文档请看：https://developer.qiniu.com/kodo/sdk/1239/java#rs-list
     *
     * @return
     */
    @GetMapping("/list")
    public R list() {
        QiniuProperties qiniu = properties.getQiniu();
        this.check(qiniu);
        try {
            //构造一个带指定Zone对象的配置类
            Configuration cfg = new Configuration(Zone.zone0());
            //...其他参数参考类注释
            Auth auth = Auth.create(qiniu.getAk(), qiniu.getSk());
            BucketManager bucketManager = new BucketManager(auth, cfg);
            //文件名前缀
            String prefix = "";
            //每次迭代的长度限制，最大1000，推荐值 1000
            int limit = 1000;
            //指定目录分隔符，列出所有公共前缀（模拟列出目录效果）。缺省值为空字符串
            String delimiter = "";
            //列举空间文件列表
            BucketManager.FileListIterator fileListIterator = bucketManager.createFileListIterator(qiniu.getBn(), prefix, limit, delimiter);
            List<QiNiuEntity> list = new ArrayList<>();
            while (fileListIterator.hasNext()) {
                //处理获取的file list结果
                FileInfo[] items = fileListIterator.next();
                for (FileInfo item : items) {
                    QiNiuEntity qiNiuEntity = new QiNiuEntity(item.hash, item.key, item.mimeType, item.fsize, qiniu.getUrl().trim() + item.key);
                    list.add(qiNiuEntity);
                }
            }
            return new R<>(list);
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @RequestMapping("/upload")
    public Map<String,String> upload(@RequestParam("file") MultipartFile file) {
        QiniuProperties qiniu = properties.getQiniu();
        this.check(qiniu);
        if (!file.isEmpty()) {
            String randomName = StringUtil.getRandomName(file.getOriginalFilename());
            try {
                //密钥配置
                Auth auth = Auth.create(qiniu.getAk(), qiniu.getSk());
                String upToken = auth.uploadToken(qiniu.getBn());
                Configuration cfg = new Configuration(Region.region0());
                //创建上传对象
                UploadManager uploadManager = new UploadManager(cfg);
                //调用put方法上传
                Response res = uploadManager.put(file.getBytes(), randomName,upToken);
                Map map = new HashMap<>();
                map.put("link", qiniu.getUrl() +"/"+ randomName);
                return map;
            } catch (Exception e) {
                e.printStackTrace();
                log.error("文件上传失败============>" + e.getMessage());
                throw new GlobalException(e.getMessage());
            }
        }
        return null;
    }

    /**
     * 文件下载
     *
     * @param name 文件名称
     * @return 返回文件在七牛云储存的地址：外链/文件名  前端处理下载
     */
    @RequestMapping(value = "/download")
    public ResponseEntity<byte[]> download(@RequestParam("name") String name, HttpServletResponse response) {
        QiniuProperties qiniu = properties.getQiniu();
        this.check(qiniu);
        try {
            String encodedFileName = URLEncoder.encode(name, "utf-8"); //获取文件名，防止乱码
            String fileUrl = String.format("%s%s", qiniu.getUrl(), encodedFileName); //拼接得到文件的连接地址
            //获取外部文件流
            URL url = new URL(fileUrl);
            //打开一个连接
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setConnectTimeout(3 * 1000);

            //获取输入流
            InputStream inputStream = connection.getInputStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream(); //创建一个字节数组缓冲区对象
            byte[] buffer = new byte[1024];

            int len = 0;
            while ((len = inputStream.read(buffer)) != -1) {
                //三个参数：b:字节数组 off:起始位置 len:写入字节长度
                outputStream.write(buffer, 0, len); //将文件输入流中的字节一次read读取并写入到字节缓冲区对象ByteArrayOutputStream中
            }

            //设置请求头格式
            HttpHeaders headers = new HttpHeaders();
            //告诉浏览器以"attachment"方式打开文件
            headers.setContentDispositionFormData("attachment", fileUrl);
            //设置请求头的媒体格式类型为 application/octet-stream(二进制流数据)
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            System.out.println(fileUrl);
            return new ResponseEntity<byte[]>(outputStream.toByteArray(), headers, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    /**
     * 七牛云开放API接口: 文件删除
     *
     * @param name 删除的文件名称，在七牛云API中，对应：key
     * @return
     */
    @DeleteMapping("/delete")
    public R delete(@RequestParam("name") String name) {
        QiniuProperties qiniu = properties.getQiniu();
        this.check(qiniu);
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone0());
        Auth auth = Auth.create(qiniu.getAk(), qiniu.getSk());
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(qiniu.getBn(), name);
            return new R();
        } catch (QiniuException e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    /**
     * 七牛云开放API接口：文件名称更新
     *
     * @param oldname 文件原始名称
     * @param newname 文件新名称
     * @return
     */
    @PutMapping("/update")
    public R update(@RequestParam("oldname") String oldname, @RequestParam("newname") String newname) {
        QiniuProperties qiniu = properties.getQiniu();
        this.check(qiniu);
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone0());
        Auth auth = Auth.create(qiniu.getAk(), qiniu.getSk());
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.move(qiniu.getBn(), oldname, qiniu.getBn(), newname);
            return new R();
        } catch (QiniuException e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    /**
     * 七牛云开放API接口：单个文件查询
     *
     * @param name 要查询的文件名称
     * @return
     */
    @GetMapping("/find")
    public R find(@RequestParam("name") String name) {
        QiniuProperties qiniu = properties.getQiniu();
        this.check(qiniu);
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone0());
        Auth auth = Auth.create(qiniu.getAk(), qiniu.getSk());
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            FileInfo fileInfo = bucketManager.stat(qiniu.getBn(), name);
            QiNiuEntity qiNiuEntity = new QiNiuEntity(fileInfo.hash, name, fileInfo.mimeType, fileInfo.fsize, qiniu.getUrl() + name);
            List<QiNiuEntity> list = new ArrayList<>();
            list.add(qiNiuEntity);
            return new R<>(list);
        } catch (QiniuException e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

}
