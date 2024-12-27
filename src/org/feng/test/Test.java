/**
 * 
 */
package org.feng.test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

/**
 * @author ����
 *
 */
public class Test {
	
	public static void main(String[] args) {
		
		// ����
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		// post����
		// ****************************************************************
		// ����post�������
		List<NameValuePair> params = new ArrayList<>();
		params.add(new BasicNameValuePair("name", "feng"));
		params.add(new BasicNameValuePair("pass", "123"));
		// ����һ��form��ʵ��
		UrlEncodedFormEntity form = null;
		try {
			form = new UrlEncodedFormEntity(params);
		} catch (UnsupportedEncodingException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		// ****************************************************************
		
		URI uri = null;
		try {
			uri = new URIBuilder("http://localhost:8080/bayernfengestoressm/httpclient.do").setParameter("name", "jiangfeng").build();
		} catch (URISyntaxException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		//
//		HttpGet httpGet = new HttpGet("http://www.baidu.com");
//		HttpGet httpGet = new HttpGet("http://localhost:8080/bayernfengestoressm/httpclient.do");
		HttpGet httpGet = new HttpGet(uri);
		
		CloseableHttpResponse response = null;
		try {
			response = httpClient.execute(httpGet);
			// �����Ӧ�ɹ�
			if (response.getStatusLine().getStatusCode() == 200) {
				String content = EntityUtils.toString(response.getEntity(), "utf-8");
				System.out.println("============��ȡ�����ݣ�" + content);
				System.out.println("============���ݵĳ��ȣ�" + content.length());
			}
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			// �൱�ڹر������
			try {
				httpClient.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
