package org.feng.test;

import java.util.Date;  
import java.util.Properties;  
 
import javax.activation.DataHandler;  
import javax.activation.FileDataSource;  
import javax.mail.Authenticator;  
import javax.mail.Multipart;  
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;  
import javax.mail.internet.MimeUtility;

public class JavaMailSendUtil {
	
	public void sendEmail(String subject, String from, String[] to,  
            String text, String[] filenames, String mimeType) {
        try {
        	Properties props = new Properties();  

            String smtp = "smtp.163.com"; // ���÷����ʼ����õ���smtp  
            String servername = "bayernfeng@163.com"; // �����˺���
            String serverpaswd = "YEOHQCXIDWYXRUVV"; // ��������

            Session mailSession = null; // �ʼ��Ự����  
            MimeMessage mimeMsg = null; // MIME �ʼ�����  

            props = System.getProperties(); // ���ϵͳ���Զ���  
            props.put("mail.smtp.host", smtp); // ����SMTP����  
            props.put("mail.smtp.auth", "true"); // �Ƿ񵽷������û�����������֤  
            // ����������֤���͵��û����������Ƿ���ȷ  
            SmtpAuthenticator myEmailAuther = new SmtpAuthenticator(servername, serverpaswd);  
            // �����ʼ��Ự ע�����ｫ��֤��Ϣ�Ž���Session�Ĵ���������  
            mailSession = Session.getInstance(props, (Authenticator) myEmailAuther);  
            // ���ô���Э��  
            Transport transport = mailSession.getTransport("smtp");  
            // ����from��to����Ϣ  
           mimeMsg = new MimeMessage(mailSession);  
           if (null != from && !"".equals(from)) {  
               InternetAddress sentFrom = new InternetAddress(from);  
               mimeMsg.setFrom(sentFrom); // ���÷����˵�ַ  
           }  

           InternetAddress[] sendTo = new InternetAddress[to.length];  
           for (int i = 0; i < to.length; i++) {  
               System.out.println("���͵�:" + to[i]);  
               sendTo[i] = new InternetAddress(to[i]);  
           }  

           mimeMsg.setRecipients(MimeMessage.RecipientType.TO, sendTo);  
           mimeMsg.setSubject(subject, "gb2312");  

           MimeBodyPart messageBodyPart1 = new MimeBodyPart();  
           // messageBodyPart.setText(UnicodeToChinese(text));  
           messageBodyPart1.setContent(text, mimeType);  
 
           // ���������ʽ  
           Multipart multipart = new MimeMultipart();  
           multipart.addBodyPart(messageBodyPart1);  

           for (int i = 0; i < filenames.length; i++) {  
                MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
 
                String filename = filenames[i].split(";")[0];  
                String displayname = filenames[i].split(";")[1];  
                // �õ�����Դ  
                FileDataSource fds = new FileDataSource(filename);  
                // BodyPart��Ӹ�������  
                messageBodyPart2.setDataHandler(new DataHandler(fds));  
                // BodyPart��Ӹ����ļ���  
                messageBodyPart2.setFileName(MimeUtility.encodeText(displayname));  
                multipart.addBodyPart(messageBodyPart2);  
           	}
           	mimeMsg.setContent(multipart);  
           	// �����ż�ͷ�ķ�������  
           	mimeMsg.setSentDate(new Date());  
           	mimeMsg.saveChanges();  
           	// �����ʼ�  
           	Transport.send(mimeMsg);  
           	transport.close();  
            System.out.println("���͵��ɹ�!!!");  
        } catch (Exception e) {  
           	e.printStackTrace();  
       	}
	}  
 
    
    public static void main(String[] args) throws Exception {  
        String title = "�����ʼ�";// �������ʼ��ı���  
        String from = "bayernfeng@163.com";// �����﷢��  
        String sendTo[] = { "2467055074@qq.com" };// ���͵�����  
        // �ʼ����ı����ݣ����԰���html�������ʾΪhtmlҳ��  
        String content = "test java send mail !!!!!!";  
        // �������ĸ���������������������  
        String fileNames[] = { };  

        JavaMailSendUtil test = new JavaMailSendUtil();  
        try {  
        	// MailSender mailsender = new MailSender();  
        	test.sendEmail(title, from, sendTo, content, fileNames, "text/html;charset=gb2312");  
        } catch (Exception ex) {  
        	ex.printStackTrace();  
        }  
    }  

   
	class SmtpAuthenticator extends Authenticator {  
		
		String username = null;  
	    String password = null;  
	      
	    public SmtpAuthenticator(String username, String password) {  
	        super();  
	        this.username = username;  
	        this.password = password;  
	    }  
	
	    public PasswordAuthentication getPasswordAuthentication() {  
	        return new PasswordAuthentication(this.username, this.password);  
	    }
    }
} 
