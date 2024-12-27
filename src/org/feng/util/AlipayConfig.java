package org.feng.util;
 
import java.io.FileWriter;
import java.io.IOException;
 
/* *
 *������AlipayConfig
 *���ܣ�����������
 *��ϸ�������ʻ��й���Ϣ������·��
 *�޸����ڣ�2017-04-05
 *˵����
 *���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 *�ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���
 */
 
public class AlipayConfig {
	
//�����������������������������������Ļ�����Ϣ������������������������������
 
	// Ӧ��ID,����APPID���տ��˺ż�������APPID��Ӧ֧�����˺�
	public static String app_id = "2016110200786490";
	
	// �̻�˽Կ(���ɹ������ɵ�Ӧ��˽Կ)������PKCS8��ʽRSA2˽Կ
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC0aOMC4zsvFt1b4seIK0wEU/Q+Wvn9NDvedMl2c+guuBm6QH4k32p1QqXrgbRdVYDS7nDQry+z48GM+m7F+NXvbsnFmATBjABbCXw81OaaH+XjPpVskEiwQ9UB0neKCysA4WtPmQ9ixaFaHq9WDI4EHy5PYYSyx1k817k5mPnjS1jChT+6Ripto9HJfElg3+Dp2Lyo8hdZAX9mpTAsWKpZs8Ie+4PzN46POv9jYBlKIIZ3CVf7k0x8S6QuTn2evZkplTOecnEUWZ0ei0QohvlhDpLkOFHyr6bqFMCF9hwqMewUzq5eK9Rnmf3atbunDJNwLCLIL305/HIPK7vu1JllAgMBAAECggEBALG+BKp7pXunUz+MFnmZ7rL049XrXBCSvclV1obVexNMXkyZ7a32T7RnjYCRsVmjO+CU+qEfeCgLZE25DhoOJvhWdoQuWcE2ZcNLfRORzgBbHOreZekn3fWLXvkEmrFuf1fGvysU6YuummFnieeFRwXYko+yzEI3FTxUbTDJ/qhnk9FaA6l3WeEuXmyQ9BT910RHrtR2ff7ECNyYj4/XwWvzNyJoJ3VvN74pJo538dNHB5XBhyncETDDkWOVCEv73DNW2D1k+r5wXSnHR7i5XBtHVHEYsO4EY7liKTfOui3F0gjbQHpQAzODqW8bva8mc237jFAJ83nz/ltDYv+geqECgYEA3QspXSdvgF9U9CE7G6AKbLNIGn3mrcJibaSYXnicCWKVriWFsXiFPP95aJu849o+9zTPqsI/S+G4Bw7Q9T2fiEGZCAJvq7Ad2r4NXNFhg3AlxQ3gXn4MzCzP697p8TgYUzBbERewm6oYYXQeAO5Dx/WbvgrXV8rA6/Nt54LyIQsCgYEA0PCuzx3JCzUhajC1xfp9i4yvUxv1Con1J6QqZWG/ScGnR69eX/QOiRRN5JY53tUvxB1M8SbKrk6Paxs28ZXpihsSS7EVOw25imKhjKAgVbp3gbYQxEN7rNn7hNdKpTPiWCkBjKH8vPXwIVqNBXBrBlSqG6198NRqqAS0/LlDlU8CgYEAjyUwR1RHgAG8mVB/37b3qUc89XL9FR+h8FE8H0nJ+sXuGtXPy4s59bOYIydf3sqyJhL8PSAIL5LgQynUJk0e5/VbLfWt7ahi3QpgyvAJTz4sJ32CBI9qqDqI973nEEB8eDsDboFB7LzthwbUe1PRb0fd8OdCZ2c1IlgFn3yMYtsCf3FyPXg3s/Fh58LAr/HPEFu1B30YsPQH9BSSDnL9n99sRmel0JhI65uCasiyyLk1B7p0LlLBvUrnXPfKzwpdW3ChQk3W2LA3w4ZgB1dTmjryA/Fp6bCm83/m26pFO0J36W301eKGEbSH1NpHUEqjv3iwf6yHhto8e6y+4YZXEVsCgYBooUnjDMYXlwXOnHxvf57UqDj2kTPEktHPsuKbfWMKU5FxhAv84IvqjMr6WO7ExSe41snisDGfuojpgushdpgXL0asoLO+kzfARhpqjpKnBuJZB3Rmi+DI2Bdxbf8NBcdw1lX9dMkTLfYtakR0rXP/73hNNpojJj21YwgDQZdFKg==";
	// ֧������Կ,�鿴��ַ��https://openhome.alipay.com/platform/keyManage.htm ��ӦAPPID�µ�֧������Կ��
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtXYhNcbdqYORroZqyKksbIa7rfeEdTn64ETWplRsPufg3FMN4yJIrEcCy+1Sg4JwRokF3ejkTmng1Cg+C1zXAgfouayQca/Z3T4xwkQVD9cpDY0WecVdSUh00de/y+TrWRYzdxaVYzv8LQLXo/eQKlzc+qQQPhQdS8XzC9JA76dAEwsf1czRISjHIYBAzaqVnjqUfaeiE2CZR/0MiW41e+rdLWyaGvEbbxdYnJNGUGCCHo2MWw99lUw5JCiVJxFX2id3HaKHY5rKtnE9Rn06ZVQUxpMILoSRMdkU+cEoKFs+LnRnoj4w/BtzKTw7VY6z++nhxliKtb+27EwWL4lSpwIDAQAB";
 
	// �������첽֪ͨҳ��·��  ��http://��ʽ������·�������ܼ�?id=123�����Զ����������������������������
	public static String notify_url = "http://192.168.16.30:8080/bayernfengestoressm/WEB-INF/content/notify_url.jsp";
 
	// ҳ����תͬ��֪ͨҳ��·�� ��http://��ʽ������·�������ܼ�?id=123�����Զ���������������������������ʵ�ͬ��֧���ɹ���ҳ��
	public static String return_url = "http://192.168.16.30:8080/bayernfengestoressm/order/data/ordertail.action";
 
	// ǩ����ʽ
	public static String sign_type = "RSA2";
	
	// �ַ������ʽ
	public static String charset = "utf-8";
	
	// ֧��������
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
//	// ֧��������
//	public static String log_path = "/lishan/logs/";
 
 
//�����������������������������������Ļ�����Ϣ������������������������������
 
    /** 
     * д��־��������ԣ�����վ����Ҳ���ԸĳɰѼ�¼�������ݿ⣩
     * @param sWord Ҫд����־����ı�����
     */
//    public static void logResult(String sWord) {
//        FileWriter writer = null;
//        try {
//            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
//            writer.write(sWord);
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (writer != null) {
//                try {
//                    writer.close();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//    }
}
 
