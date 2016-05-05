package top.casso.cas.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class SendMailTool {
	
	private JavaMailSenderImpl mailSender;
	
	private SimpleMailMessage mailMessage;
	
	private String preLink;
	
	public JavaMailSenderImpl getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	public SimpleMailMessage getMailMessage() {
		return mailMessage;
	}

	public void setMailMessage(SimpleMailMessage mailMessage) {
		this.mailMessage = mailMessage;
	}

	public String getPreLink() {
		return preLink;
	}

	public void setPreLink(String preLink) {
		this.preLink = preLink;
	}

	public void send(String to, String content) {
		//String nickName = javax.mail.internet.MimeUtility.encodeText("企事业单位中央认证服务系统");
		String nickName = "=?UTF-8?B?5LyB5LqL5Lia5Y2V5L2N5Lit5aSu6K6k6K+B5pyN5Yqh57O757uf?=";
		mailMessage.setFrom(nickName + "<account@casso.top>");
		mailMessage.setTo(to);
		content = preLink + content;
		content += "\r\n\r\n请尽快修改,该链接48小时内有效.切勿透露给他人,注意账户安全.\r\n\r\n"; 
		content += new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()).toString(); 
		mailMessage.setText(content);
		//该发送邮件的方法有时候执行的时间太长(>10s),可能是不是网络的原因,新建线程执行发送
		new Thread(new Runnable() {
			public void run() {
				mailSender.send(mailMessage);
			}
		}).start();
	}

}
