/**
 * 
 */
package org.feng.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.feng.util.BayernFengUtils;

import com.alibaba.fastjson.JSONObject;

/**
 * @author ����
 *
 */
public class Test2 {
	
	public static void main(String[] args) {
//		String sendCode = "{\"code\":200,\"msg\":\"2\",\"obj\":\"1344\"}";
//		String[] strs = sendCode.split("\"");
//		for (int i = 0; i < strs.length; i++) {
//			System.out.println(i + " -> " + strs[i]);
//		}
//		System.out.println("code -> " + strs[9]);
		
		
//		// �����ĸ
////		String data = "ABCDEFGHIJKLMNOPQISTUVWXYZ0123456789" + "ABCDEFGHIJKLMNOPQISTUVWXYZ".toLowerCase();
//		String c = "ABCDEFGHIJKLMNOPQISTUVWXYZ" + "ABCDEFGHIJKLMNOPQISTUVWXYZ".toLowerCase();
//		String n = "0123456789";
//		Random ran = new Random();
//		StringBuilder sb = new StringBuilder();
//		sb.append(c.charAt(ran.nextInt(c.length())));
//		sb.append(n.charAt(ran.nextInt(n.length())));
//		
//		StringBuilder sb2 = new StringBuilder(UUID.randomUUID().toString());
//		sb2.setLength(6);
//		String uuid = sb2.toString();
//		String code = sb.toString() + uuid;
//		System.out.println(code);
			
//		Pattern p = Pattern.compile("^1[3|4|5|7|8][0-9]{9}$");
//		Matcher m = p.matcher("1889576081");
//		boolean b = m.matches();
//		System.out.println(b);
		
//		String type = BayernFengUtils.getTypeOfLogin("f11");
//		System.out.println(type);
		
		
//		Pattern p = Pattern.compile("^[1-9]\\d*$");
//		Matcher m = p.matcher("1");
//		boolean b = m.matches();
//		System.out.println(b);
//		
//		System.out.println(BayernFengUtils.isPositiveInteger("12"));
		
//		String givenStr = "���� ���� ���Ӻ��� �λ�·��ΰ����Ժ����Ԫ ���� 18297318405";
//		String[] strs = BayernFengUtils.getFromSplitedStringExcept(givenStr, " ");
//		System.out.println(Arrays.toString(strs));
//		System.out.println(Arrays.toString(givenStr.split(" ")));
		
//		String goods = "{'1':{'category_id':2,'description':'���ܲ�','estoreprice':10,'expiry_date':1562769653000,'id':1,'marketprice':108,'name':'���ܲ�','num':99,'production_date':1605451237000,'titleimage':'9.jpg','buyNum':'1'},'2':{'category_id':4,'description':'��ײ�','estoreprice':10,'expiry_date':1562769653000,'id':2,'marketprice':108,'name':'��ײ�','num':99,'production_date':1549032037000,'titleimage':'14.jpg','buyNum':'1'},'3':{'category_id':71,'description':'����Ӯ����ȫ�����Ա�Ĺ㷺��������ʹ�����ɬ�ĸ����BruceEckel�������׺�����С��ֱ�ӵı��ʾ����ǰҲ�ữ�������Ρ���Java�Ļ����﷨����߼����ԣ������������������̡߳��Զ���Ŀ��������Ԫ���Ժ͵��Եȣ������鶼����ָ�����������ա�','estoreprice':'10','expiry_date':1562769653000,'hot':1,'id':3,'marketprice':108,'name':'Java���˼�루��4�棩','num':999,'production_date':1549032037000,'titleimage':'java.jpg','buyNum':2}}";
//		JSONObject obj = JSONObject.parseObject(goods);
//		Set<Entry<String, Object>> entries =  obj.entrySet();
//		Map<String, Object> map = new HashMap<>();
//		for (Entry<String, Object> entry : entries) {
//			map.put(entry.getKey(), entry.getValue());
//		}
//		
//		System.out.println(map);
//		Collection<Object> coll = map.values();
//		List<Object> result = new ArrayList<>();
//		for (Object o : coll) {
//			System.out.println("======= "+o);
//			JSONObject j = JSONObject.parseObject(o.toString());
//			Map<String, Object> m = new HashMap<>();
//			for (Entry<String, Object> entry : j.entrySet()) {
//				m.put(entry.getKey(), entry.getValue());
//			}
//			result.add(m.get("id"));
//		}
//		
//		System.out.println("result -> " + result);
		
		String goods = "{'1':{'category_id':2,'description':'���ܲ�','estoreprice':10,'expiry_date':1562769653000,'id':1,'marketprice':108,'name':'���ܲ�','num':99,'production_date':1605451237000,'titleimage':'9.jpg','buyNum':'1'},'2':{'category_id':4,'description':'��ײ�','estoreprice':'10','expiry_date':1562769653000,'id':2,'marketprice':108,'name':'��ײ�','num':99,'production_date':1549032037000,'titleimage':'14.jpg','buyNum':2},'13':{'category_id':2,'description':'�����۵Ķ���','estoreprice':85,'expiry_date':1562769653000,'id':13,'marketprice':108,'name':'����','num':99,'production_date':1549032037000,'titleimage':'6.jpg','buyNum':'3'}}";
		
//		JSONObject jobj = JSONObject.parseObject(goods);
//		Map<String, Object> map = new HashMap<>();
//		for (Entry<String, Object> entry : jobj.entrySet()) {
//			map.put(entry.getKey(), entry.getValue());
//		}
//		Collection<Object> coll = map.values();
//		List<Object> result = new ArrayList<>();
//		for (Object obj : coll) {
//			JSONObject jobj2 = JSONObject.parseObject(obj.toString());
//			Map<String, Object> map2 = new HashMap<>();
//			for (Entry<String, Object> entry : jobj2.entrySet()) {
//				map2.put(entry.getKey(), entry.getValue());
//			}
//			result.add(map2.get("id"));
//		}
		
//		List<Object> result = BayernFengUtils.getValuesOfJSONObjectByKey(goods, "id");
//		System.out.println("result -> " + result);
//		
//		List<Object> result2 = BayernFengUtils.getValuesOfJSONObjectByKey(goods, "buyNum");
//		System.out.println("result2 -> " + result2);
		
		System.out.println("�Ϻ�        �Ϻ���Ͻ ������ �ֽ��ǻ�԰29�� �¹�ս�� 18212345678");
		String[] strs = "�Ϻ�        �Ϻ���Ͻ ������ �ֽ��ǻ�԰29�� �¹�ս�� 18212345678".split(" ");
		List<String> list = new ArrayList<>();
		for (int i = 0; i < strs.length; i++) {
			System.out.println(i + " -> " + strs[i] + " <-");
			if (!strs[i].equals(" ")) {
				list.add(strs[i]);
			}
		}
		
		for (String str : list) {
			System.out.println("========== -> " + str + " <-");
		}
	}

}
