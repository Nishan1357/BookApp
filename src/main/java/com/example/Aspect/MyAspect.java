package com.example.Aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.example.mail.MailConstants;

import jakarta.mail.internet.MimeMessage;


@Component
@Aspect
public class MyAspect {
	
	@Autowired
	JavaMailSender mailSender;
	
	
	//advice
	@After("execution(public String *Book(..))") //pointcut expression
	public void m1() {
		System.out.println("Book Operation!");
	}
	//advice
	//@AfterReturning(pointcut = "execution(public String com.incapp.repo.BookRepo.*Book(..))",returning = "r") //pointcut expression
	@AfterReturning(pointcut = "execution(public String com.incapp.repo.*.*Book(..))",returning = "r") //pointcut expression
	public void m2(String r) {
		//MailSend Code
		try {
			MimeMessage mailMessage=mailSender.createMimeMessage();
			boolean multiPart=true;
			MimeMessageHelper helper=new MimeMessageHelper(mailMessage,multiPart);
			helper.setTo(MailConstants.RECEIVER_EMAIL);
			helper.setSubject("Book App- ALERT");
			String htmlMSG="<h1>Book App</h1> <p style='background-color:yellow; padding:10px'>Message: "+r+"</p>";
			helper.setText("text/html", htmlMSG);
			mailSender.send(mailMessage);
			System.out.println("Mail Sent!");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//advice
	@AfterReturning(pointcut = "execution(public boolean deleteBook(String))",returning = "r") //pointcut expression
	public void m2(Boolean r) {
		//MailSend Code
		try {
			MimeMessage mailMessage=mailSender.createMimeMessage();
			boolean multiPart=true;
			MimeMessageHelper helper=new MimeMessageHelper(mailMessage,multiPart);
			helper.setTo(MailConstants.RECEIVER_EMAIL);
			helper.setSubject("Book App- ALERT");
			String result;
			if(r) {
				result="Book Deleted Successfully!";
			}else {
				result="Book Not Found!";
			}
			String htmlMSG="<h1>Book App</h1> <p style='background-color:yellow; padding:10px'>Message: "+result+"</p>";
			helper.setText("text/html", htmlMSG);
			mailSender.send(mailMessage);
			System.out.println("Mail Sent!");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
