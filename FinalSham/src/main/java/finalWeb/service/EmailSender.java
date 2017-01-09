package finalWeb.service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
	
    @Autowired
    protected JavaMailSender mailSender;
 
    public void SendEmail(String subject, String text, String recipient) throws Exception {
         
        MimeMessage msg = mailSender.createMimeMessage();
        
        
        msg.setFrom(new InternetAddress("poreutopi@gmail.com"));
        msg.setSubject(subject);
        msg.setText(text);
        msg.setRecipient(Message.RecipientType.TO , new InternetAddress(recipient));
        
        mailSender.send(msg); 
    }
}
