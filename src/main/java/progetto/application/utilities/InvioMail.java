package progetto.application.utilities;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class InvioMail {
	
	private String email;
	private String testoMail;
	private String oggettoMail;
	
	public InvioMail(String email,String testoMail,String oggettoMail) {
			this.email=email;
			this.testoMail=testoMail;
			this.oggettoMail=oggettoMail;
	}
	
	public void invia() {
		String from="videovision2021@gmail.com";
        String to=email;
        String host="smtp.gmail.com";
        Properties properties=System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", true);
        Session session= Session.getInstance(properties,new javax.mail.Authenticator() {
        	protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("videovision2021@gmail.com", "vvision2021");
			}
        });
        //la prossima istruzione serve per stampare il msg
        //session.setDebug(true);
        
    	try {
    		
          	MimeMessage message=new MimeMessage(session);
    		message.setFrom(new InternetAddress(from));
    		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
    		message.setSubject(oggettoMail);
    		message.setText(testoMail);
    		Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
