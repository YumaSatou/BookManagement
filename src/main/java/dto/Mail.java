package dto;

public class Mail {
	public void mail(String mail) {
		MailUtil.sendMail( mail,"返却期限超過", "返却期限が過ぎています。速やかに返却してください");
	}
}
