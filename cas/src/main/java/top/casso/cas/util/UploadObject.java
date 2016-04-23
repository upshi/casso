package top.casso.cas.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.web.multipart.MultipartFile;

public class UploadObject {
	
	public static final String DOMAIN;
	public static final String USER_PHOTO_BASE_PATH;
	
	static {
		Properties props = new Properties();
		String path ="/config.properties";
		try {
			props.load(UploadObject.class.getResourceAsStream(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		DOMAIN = props.getProperty("DOMAIN");
		USER_PHOTO_BASE_PATH = props.getProperty("USER_PHOTO_BASE_PATH");
	}
	
	private String fileName;
	private String remoteBasePath;
	private MultipartFile multipartFile;
	
	public UploadObject(String fileName, String remoteBasePath, MultipartFile multipartFile) {
		this.remoteBasePath = remoteBasePath;
		this.multipartFile = multipartFile;
		String originalFilename = multipartFile.getOriginalFilename();
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length()).toLowerCase();
		this.fileName = fileName + ext;
	}
	
	public String getRemotePath() {
		return remoteBasePath + fileName;
	}

	public InputStream getInputStream() throws IOException {
		return multipartFile.getInputStream();
	}

}
