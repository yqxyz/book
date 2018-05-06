package me.yqiang.book_service;

import org.springframework.stereotype.Component;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
@Component
public class Validate {
    public void getYZM(HttpServletRequest request, HttpServletResponse response){
        //验证码图片宽度
        final int IMG_WIDTH = 116;
        //验证码图片高度
        final int IMG_HEIGHT = 36;
        //验证码位数
        final int CODE_LEN = 5;
        // 验证码干扰线数
        int lineCount = 20;
        Random random = new Random();
        //用于绘制图片，设置图片的长宽和图片类型
        BufferedImage bi = new BufferedImage(IMG_WIDTH,IMG_HEIGHT,BufferedImage.TYPE_INT_RGB);
        //获取绘图工具
        Graphics graphics = bi.getGraphics();
        //设置背景颜色
        graphics.setColor(getRandColor(200, 250));
        //填充矩形区域
        graphics.fillRect(0,0,IMG_WIDTH,IMG_HEIGHT);
        //设置字体
        Font font = new Font("Fixedsys", Font.BOLD, 30);
        graphics.setFont(font);

        // 设置干扰线
        for (int i = 0; i < lineCount; i++) {
            int xs = random.nextInt(IMG_WIDTH);
            int ys = random.nextInt(IMG_HEIGHT);
            int xe = xs + random.nextInt(IMG_WIDTH);
            int ye = ys + random.nextInt(IMG_HEIGHT);
            graphics.setColor(getRandColor(1, 255));
            graphics.drawLine(xs, ys, xe, ye);
        }

        // 添加噪点
        float yawpRate = 0.01f;// 噪声率
        int area = (int) (yawpRate * IMG_WIDTH * IMG_HEIGHT);
        for (int i = 0; i < area; i++) {
            int x = random.nextInt(IMG_WIDTH);
            int y = random.nextInt(IMG_HEIGHT);

            bi.setRGB(x, y, random.nextInt(255));
        }

        //验证码使用到的字符
        char[] codeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456".toCharArray();
        //存放生产的验证码
        String captcha = "";

        //循环绘制验证码
        for(int i=0;i<CODE_LEN;i++){
            int index = random.nextInt(codeChars.length);
            //s随机生生成验证码颜色
            graphics.setColor(getRandColor(1, 255));
            //将字符绘制到图片
            graphics.drawString(codeChars[index]+"",(i*20)+15,20);
            captcha += codeChars[index];
        }

        //将生辰的验证码放入session
        request.getSession().setAttribute("code",captcha.toLowerCase());
        //输出图片
        try {
            ImageIO.write(bi,"JPG",response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 产生随机字体
     */
    private Font getFont(int size) {
        Random random = new Random();
        Font font[] = new Font[5];
        font[0] = new Font("Ravie", Font.PLAIN, size);
        font[1] = new Font("Antique Olive Compact", Font.PLAIN, size);
        font[2] = new Font("Fixedsys", Font.PLAIN, size);
        font[3] = new Font("Wide Latin", Font.PLAIN, size);
        font[4] = new Font("Gill Sans Ultra Bold", Font.PLAIN, size);
        return font[random.nextInt(5)];
    }

    // 得到随机颜色
    private Color getRandColor(int fc, int bc) {// 给定范围获得随机颜色
        Random random = new Random();
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
}
