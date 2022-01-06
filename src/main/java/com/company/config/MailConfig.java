package com.company.config;

import org.apache.commons.mail.HtmlEmail;

public class MailConfig {
	public static void sendMail(String email, String subject, String msg) throws Exception {
		
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "jaelimly";
		String hostSMTPpwd = "pqyspjsbresasaza";
		
		// 보내는 사람
		String fromEmail = "stockadmin@stock.com";
		String fromName = "재고관리프로그램";
		
		// email 전송
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
