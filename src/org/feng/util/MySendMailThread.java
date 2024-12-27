package org.feng.util;
import java.security.GeneralSecurityException;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.feng.bean.User;

import com.sun.mail.util.MailSSLSocketFactory;

public class MySendMailThread extends Thread {

	private User user = null;

	public MySendMailThread(User user) {
		this.user = user;
	}

	@Override
	public void run() {

		// ��smtp����������һ������
		Properties p = new Properties();
		// �����ʼ�������������
		//���õĵ����ʼ�Э����SMTP��POP3��IMAP4�����Ƕ�������TCP/IPЭ��أ�Ĭ��״̬�£��ֱ�ͨ��TCP�˿�25��110��143��������
		p.setProperty("mail.host", "smtp.163.com");// ָ���ʼ���������Ĭ�϶˿� 25
		// ���ͷ�������Ҫ�����֤
		p.setProperty("mail.smtp.auth", "true");// Ҫ����ָ���û�������ķ�ʽȥ��֤
		// �����ʼ�Э������
		p.setProperty("mail.transport.protocol", "smtp");

		// ����SSL���ܣ������ʧ��
		MailSSLSocketFactory sf = null;
		try {
			sf = new MailSSLSocketFactory();
		} catch (GeneralSecurityException e1) {
			e1.printStackTrace();
		}
		sf.setTrustAllHosts(true);
		p.put("mail.smtp.ssl.enable", "true");
		p.put("mail.smtp.ssl.socketFactory", sf);

		// ����session
		Session session = Session.getDefaultInstance(p, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// �û���������QQ�˺�Ҳ����������ı���
				PasswordAuthentication pa = new PasswordAuthentication("bayernfeng@163.com", "YEOHQCXIDWYXRUVV");
				// ������ַ�����Ȩ�룬��qq���벻�У���
				return pa;
			}
		});

		session.setDebug(true);// ���ô򿪵���״̬

		try {
			// ����һ��Message����(����һ���ʼ�),��session�д���
			MimeMessage msg = new MimeMessage(session);
			// �ʼ���Ϣ��װ
			// 1������
			msg.setFrom(new InternetAddress("bayernfeng@163.com"));
			// 2�ռ���
			msg.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
			// 3�ʼ�����:���⡢����
			msg.setSubject(user.getName() + ",��ӭע��ȫ���˺�,�������Ӽ����˺�");

			// StringBuilder���̲߳���ȫ��,�����ٶȿ죬������Ϊֻ��������߳������ʣ����Կ��������
			StringBuilder sbd = new StringBuilder();
			sbd.append(user.getName() + "<br/>��ӭ����ȷ�ϴ��ʼ���ַ�Լ��������˺š�<br/>");
			sbd.append("Ĭ���˺ţ�" + user.getUsername() + "<br/>������룺"+user.getPassword()+"��Ϊ�������˺Ű�ȫ�����ڸ�������������������<br/>");
			sbd.append("<font color='red'><a href='http://192.168.16.30:8080/bayernfengestoressm/user/data/activeUser.do?uuCode="
					+ user.getUucode() + "' target='_blank'");
			sbd.append(">��������</a></font><br/>");
			sbd.append("���ߵ����������:<br/>");
			sbd.append("http://192.168.16.30:8080/bayernfengestoressm/user/data/activeUser.do?uuCode="
					+ user.getUucode() + "<br/>");
			sbd.append("����һ���Զ����͵��ʼ����������δҪ���յ�����ż���������Ҫ�����κβ�����");

			msg.setContent(sbd.toString(), "text/html;charset=utf-8");// ��html��ʽ���ı�

			// ���Ͷ���
			Transport.send(msg);
			
			System.out.println("��" + user.getEmail() + "�����ʼ��ɹ���");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}

