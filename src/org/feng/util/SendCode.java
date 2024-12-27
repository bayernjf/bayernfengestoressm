package org.feng.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.feng.test.CheckSumBuilder;

/**
 * ������֤��
 * @author liuxuanlin
 *
 */
public class SendCode {
    //������֤�������·��URL
    private static final String
            SERVER_URL="https://api.netease.im/sms/sendcode.action";
    //�������ŷ�����˺ţ����滻���ڹ����̨Ӧ���������Appkey
    private static final String
            APP_KEY="f98778e6b13ba8aa2ed257d6acc2c160";
    //�������ŷ������Կ�����滻���ڹ����̨Ӧ���������appSecret
    private static final String APP_SECRET="cdab6955c9a6";
    //�����
    private static final String NONCE="123456";
    //����ģ��ID
    private static final String TEMPLATEID="14892677";
    //�ֻ���
//    private static final String MOBILE="18895760831";
    private static String MOBILE="18895760831";
    //��֤�볤�ȣ���Χ4��10��Ĭ��Ϊ4
    private static final String CODELEN="4";

    public static String getCode(String phone) throws Exception {

    	MOBILE = phone;
    	
//        DefaultHttpClient httpClient = new DefaultHttpClient();
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(SERVER_URL);
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        /*
         * �ο�����CheckSum��java���룬�������ĵ��Ĳ����б��У���CheckSum�ļ����ĵ�ʾ��
         */
        String checkSum = CheckSumBuilder.getCheckSum(APP_SECRET, NONCE, curTime);

        // ���������header
        httpPost.addHeader("AppKey", APP_KEY);
        httpPost.addHeader("Nonce", NONCE);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // ��������ĵĲ�����requestBody����
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        /*
         * 1.�����ģ����ţ���ע�����mobile����s�ģ���ϸ����������ο�������ģ������ĵ���
         * 2.������ʽ��jsonArray�ĸ�ʽ������ "['13888888888','13666666666']"
         * 3.params�Ǹ�����ģ�������м���������������Ĳ���Ҳ��jsonArray��ʽ
         */
        nvps.add(new BasicNameValuePair("templateid", TEMPLATEID));
        nvps.add(new BasicNameValuePair("mobile", MOBILE));
        nvps.add(new BasicNameValuePair("codeLen", CODELEN));

        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // ִ������
        HttpResponse response = httpClient.execute(httpPost);
        /*
         * 1.��ӡִ�н������ӡ���һ���200��315��403��404��413��414��500
         * 2.�����code������Ŀ��Բο�������Code״̬��
         */
//        System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));
        return EntityUtils.toString(response.getEntity(), "utf-8");
    }
}
