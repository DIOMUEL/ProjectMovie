package com.kh.projectMovie01.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.vo.EmailDto;



@Controller
@RequestMapping("/email")
public class EmailController {
	@Inject
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping(value="/sendMailForm", method=RequestMethod.GET)
	public void sendMailForm() throws Exception {
		
	}
	
	@RequestMapping(value="/sendMail", method=RequestMethod.GET)
	public String sendMail(EmailDto emailDto, HttpSession session) throws Exception {
		System.out.println("emailDto:" + emailDto);
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		for(int i=0;i<6;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10)));
		    }
		}
		System.out.println("buf : " + buf);
		String code = String.valueOf(buf);
		MimeMessagePreparator preparator = new MimeMessagePreparator() {		
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				helper.setFrom(emailDto.getFrom());
				helper.setTo(emailDto.getTo());
				helper.setSubject(emailDto.getSubject());
				helper.setText(code);
			}
		};
		mailSender.send(preparator);
		return code;
	}
}

