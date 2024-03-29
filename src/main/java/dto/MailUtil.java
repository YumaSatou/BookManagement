package dto;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
	// 送信元のユーザの情報等を定数で設定する。
	private static final String FROM = "t.takahashi.sys22@morijyobi.ac.jp";
	private static final String NAME = "takahashi";
	private static final String PW = "aajqbnulicytjzch";
	private static final String CHARSET = "UTF-8";
	
	// 宛先、件名、本文を引数にメールを送信するメソッド
	public static void sendMail(String to, String subject, String body) {
		Properties property = new Properties();

		// 各種プロパティの設定
		property.put("mail.smtp.auth", "true");
		property.put("mail.smtp.starttls.enable", "true");
		property.put("mail.smtp.host", "smtp.gmail.com");
		property.put("mail.smtp.port", "587");
		property.put("mail.smtp.debug", "true");

		// ログイン情報の取得
		Session session = Session.getInstance(property,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(FROM,PW);
			}
		});

		try{
			// 送信するメール本体のインスタンス
			MimeMessage message = new MimeMessage(session);

			// 送信元の設定
			// 第1引数：送信元アドレス
			// 第2引数：送信者名
			message.setFrom(new InternetAddress(FROM, NAME));

			// 送信先の設定
			// 第1引数：TO,CC,BCCの区分
			// 第2引数：送信先アドレス
			Address toAddress = new InternetAddress(to);
			message.setRecipient(Message.RecipientType.TO, toAddress);
			// message.setRecipient(Message.RecipientType.CC, toAddress);
			// message.setRecipient(Message.RecipientType.BCC, toAddress);

			// 件名と本文の設定
			message.setSubject(subject, CHARSET);
			message.setText(body, CHARSET);

			// 送信実行！
			Transport.send(message);

			System.out.println("送信完了！");

		} catch (MessagingException e){
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}

	}
}