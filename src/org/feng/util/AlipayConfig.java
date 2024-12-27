package org.feng.util;
 
import java.io.FileWriter;
import java.io.IOException;
 
/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
 
public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
 
	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016110200786490";
	
	// 商户私钥(生成工具生成的应用私钥)，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC0aOMC4zsvFt1b4seIK0wEU/Q+Wvn9NDvedMl2c+guuBm6QH4k32p1QqXrgbRdVYDS7nDQry+z48GM+m7F+NXvbsnFmATBjABbCXw81OaaH+XjPpVskEiwQ9UB0neKCysA4WtPmQ9ixaFaHq9WDI4EHy5PYYSyx1k817k5mPnjS1jChT+6Ripto9HJfElg3+Dp2Lyo8hdZAX9mpTAsWKpZs8Ie+4PzN46POv9jYBlKIIZ3CVf7k0x8S6QuTn2evZkplTOecnEUWZ0ei0QohvlhDpLkOFHyr6bqFMCF9hwqMewUzq5eK9Rnmf3atbunDJNwLCLIL305/HIPK7vu1JllAgMBAAECggEBALG+BKp7pXunUz+MFnmZ7rL049XrXBCSvclV1obVexNMXkyZ7a32T7RnjYCRsVmjO+CU+qEfeCgLZE25DhoOJvhWdoQuWcE2ZcNLfRORzgBbHOreZekn3fWLXvkEmrFuf1fGvysU6YuummFnieeFRwXYko+yzEI3FTxUbTDJ/qhnk9FaA6l3WeEuXmyQ9BT910RHrtR2ff7ECNyYj4/XwWvzNyJoJ3VvN74pJo538dNHB5XBhyncETDDkWOVCEv73DNW2D1k+r5wXSnHR7i5XBtHVHEYsO4EY7liKTfOui3F0gjbQHpQAzODqW8bva8mc237jFAJ83nz/ltDYv+geqECgYEA3QspXSdvgF9U9CE7G6AKbLNIGn3mrcJibaSYXnicCWKVriWFsXiFPP95aJu849o+9zTPqsI/S+G4Bw7Q9T2fiEGZCAJvq7Ad2r4NXNFhg3AlxQ3gXn4MzCzP697p8TgYUzBbERewm6oYYXQeAO5Dx/WbvgrXV8rA6/Nt54LyIQsCgYEA0PCuzx3JCzUhajC1xfp9i4yvUxv1Con1J6QqZWG/ScGnR69eX/QOiRRN5JY53tUvxB1M8SbKrk6Paxs28ZXpihsSS7EVOw25imKhjKAgVbp3gbYQxEN7rNn7hNdKpTPiWCkBjKH8vPXwIVqNBXBrBlSqG6198NRqqAS0/LlDlU8CgYEAjyUwR1RHgAG8mVB/37b3qUc89XL9FR+h8FE8H0nJ+sXuGtXPy4s59bOYIydf3sqyJhL8PSAIL5LgQynUJk0e5/VbLfWt7ahi3QpgyvAJTz4sJ32CBI9qqDqI973nEEB8eDsDboFB7LzthwbUe1PRb0fd8OdCZ2c1IlgFn3yMYtsCf3FyPXg3s/Fh58LAr/HPEFu1B30YsPQH9BSSDnL9n99sRmel0JhI65uCasiyyLk1B7p0LlLBvUrnXPfKzwpdW3ChQk3W2LA3w4ZgB1dTmjryA/Fp6bCm83/m26pFO0J36W301eKGEbSH1NpHUEqjv3iwf6yHhto8e6y+4YZXEVsCgYBooUnjDMYXlwXOnHxvf57UqDj2kTPEktHPsuKbfWMKU5FxhAv84IvqjMr6WO7ExSe41snisDGfuojpgushdpgXL0asoLO+kzfARhpqjpKnBuJZB3Rmi+DI2Bdxbf8NBcdw1lX9dMkTLfYtakR0rXP/73hNNpojJj21YwgDQZdFKg==";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtXYhNcbdqYORroZqyKksbIa7rfeEdTn64ETWplRsPufg3FMN4yJIrEcCy+1Sg4JwRokF3ejkTmng1Cg+C1zXAgfouayQca/Z3T4xwkQVD9cpDY0WecVdSUh00de/y+TrWRYzdxaVYzv8LQLXo/eQKlzc+qQQPhQdS8XzC9JA76dAEwsf1czRISjHIYBAzaqVnjqUfaeiE2CZR/0MiW41e+rdLWyaGvEbbxdYnJNGUGCCHo2MWw99lUw5JCiVJxFX2id3HaKHY5rKtnE9Rn06ZVQUxpMILoSRMdkU+cEoKFs+LnRnoj4w/BtzKTw7VY6z++nhxliKtb+27EwWL4lSpwIDAQAB";
 
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://192.168.16.30:8080/bayernfengestoressm/WEB-INF/content/notify_url.jsp";
 
	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问等同于支付成功的页面
	public static String return_url = "http://192.168.16.30:8080/bayernfengestoressm/order/data/ordertail.action";
 
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
//	// 支付宝网关
//	public static String log_path = "/lishan/logs/";
 
 
//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
 
    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
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
 
