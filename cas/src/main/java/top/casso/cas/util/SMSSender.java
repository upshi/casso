package top.casso.cas.util;

import java.io.IOException;
import java.util.Properties;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.BizResult;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

public class SMSSender {

	private static final String URL;
	private static final String APP_KEY;
	private static final String APP_SECRET;
	private static TaobaoClient client = null;
	
	static {
		Properties props = new Properties();
		String path ="/config.properties";
		try {
			props.load(SMSSender.class.getResourceAsStream(path));
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("读取config.properties文件出错");
		}
		
		URL = props.getProperty("URL");
		APP_KEY = props.getProperty("APP_KEY");
		APP_SECRET =  props.getProperty("APP_SECRET");
		client = new DefaultTaobaoClient(URL, APP_KEY, APP_SECRET);
	}
	
	public static String send(String tel) {
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		int code = RandomCodeUtil.number6();
		req.setSmsType("normal");
		req.setSmsFreeSignName("变更验证");
		req.setSmsParam("{'code':'" + code + "','product':'【企事业单位中央认证服务系统】'}");
		req.setRecNum(tel);
		req.setSmsTemplateCode("SMS_3975329");
		AlibabaAliqinFcSmsNumSendResponse response = null;
		try {
			response = client.execute(req);
			if(response.getResult().getSuccess()) {
				return String.valueOf(code);
			}
		} catch (ApiException e) {
			printInfo(response);
			System.out.println("验证码发送失败");
			e.printStackTrace();
		}
		return "-1";
	}
	
	public static void printInfo(AlibabaAliqinFcSmsNumSendResponse response) {
		System.out.println("body:" + response.getBody());
		System.out.println("msg:" + response.getMsg());
		System.out.println("subcode:" + response.getSubCode());
		System.out.println("submsg:" + response.getSubMsg());
		System.out.println("errorcode:" + response.getErrorCode());
		BizResult result = response.getResult();
		System.out.println("--result--");
		System.out.println("success:" + result.getSuccess());
		System.out.println("errorcode:" + result.getErrCode());
		System.out.println("msg:" + result.getMsg());
		System.out.println("model:" + result.getModel());
	}
	
	public static void main(String[] args) {
		send("18652950107");
	}
}
