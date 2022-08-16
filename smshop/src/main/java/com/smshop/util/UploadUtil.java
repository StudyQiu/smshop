package com.smshop.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
import java.util.UUID;

/**
 * 上传工具类
 * spring mvn支持
 */
public class UploadUtil {
	@Autowired
	public ApplicationContext applicationContext;
	/**
	 * 图片上传
	 * @param file
	 * @return 返回相对路径
	 * @throws Exception
	 */
	public static String upload(MultipartFile file, HttpServletRequest request) throws IOException {
		//第一步：判断文件是否为空
		if (file.isEmpty() || Objects.isNull(file)) {
			return null;
		}
		//第二步：获取文件名
		String fileName = file.getOriginalFilename();
		//第三步：获取文件后缀,当前文件类型
		String fileType = fileName.substring(fileName.lastIndexOf("."));
		//第四步：通过UUID生成新的文件名
		String newFileName = UUID.randomUUID() + fileType;
		//第五步：获取文件存储地址
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		//第六步：文件保存
		File saveFile = new File(realPath, newFileName);
		//第七步：判断父目录是否存在，如果不存在就创建
		if (!saveFile.getParentFile().exists()) {
			saveFile.getParentFile().mkdir();
		}
		file.transferTo(saveFile);
		return "/upload/" + newFileName;
	}

}
