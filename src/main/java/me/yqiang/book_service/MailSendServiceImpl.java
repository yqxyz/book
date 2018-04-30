package me.yqiang.book_service;


import me.yqiang.book_interface.MailSendService;

import org.springframework.stereotype.Service;

@Service
public class MailSendServiceImpl implements MailSendService {
//    @Autowired
//    JavaMailSender sender;
//    @Autowired
//    private FreeMarkerConfigurer freemarker;
//    @Override
//    public  void sendMail(String userName,String code,String to) throws IOException, TemplateException, MessagingException {
//
//
//        Template template = freemarker.getConfiguration().getTemplate("active.ftl");
//        Map<String, String> map = new HashMap<>();
//        map.put("userName",userName);
//        map.put("code",code);
//        String content = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
//        MimeMessage mail = sender.createMimeMessage();
//        MimeMessageHelper helper = new MimeMessageHelper(mail,true,"utf-8");
//        helper.setSubject("text");
//        helper.setFrom("active@yq1213.cn");
//        helper.setTo(to);
//        helper.setText(content,true);
//        sender.send(mail);
//    }

}
