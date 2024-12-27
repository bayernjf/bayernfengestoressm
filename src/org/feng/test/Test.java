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
 * @author 姜峰
 *
 */
public class Test {
	
	public static void main(String[] args) {
		
		// 创建
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		// post请求
		// ****************************************************************
		// 设置post请求参数
		List<NameValuePair> params = new ArrayList<>();
		params.add(new BasicNameValuePair("name", "feng"));
		params.add(new BasicNameValuePair("pass", "123"));
		// 构建一个form表单实体
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
			// 如果响应成功
			if (response.getStatusLine().getStatusCode() == 200) {
				String content = EntityUtils.toString(response.getEntity(), "utf-8");
				System.out.println("============获取的内容：" + content);
				System.out.println("============内容的长度：" + content.length());
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
			
			// 相当于关闭浏览器
			try {
				httpClient.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
