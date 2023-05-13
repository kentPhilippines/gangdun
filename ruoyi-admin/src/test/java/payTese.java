import com.alibaba.nacos.client.utils.JSONUtils;
import com.google.common.net.MediaType;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.ruoyi.common.utils.http.HttpUtils;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import springfox.documentation.spring.web.json.Json;

import java.io.IOException;
import java.util.*;

public class payTese {


    public static void main(String[] args) throws IOException, UnirestException {

        Unirest.setTimeouts(0, 0);
        HttpResponse<String> response = Unirest.post("https://api.yunyinpay.com:9506/m/Payment/createOrder")
                .header("Accept", "*/*")
                .header("Accept-Language", "zh-CN,zh;q=0.9")
                .header("Connection", "keep-alive")
                .header("Origin", "https://wap.yunyinpay.com")
                .header("Referer", "https://wap.yunyinpay.com/")
                .header("Sec-Fetch-Dest", "empty")
                .header("Sec-Fetch-Mode", "cors")
                .header("Sec-Fetch-Site", "same-site")
                .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36")
                .header("anti", "@#fdd")
                .header("brand", "undefined")
                .header("content-type", "application/x-www-form-urlencoded")
                .header("model", "PC")
                .header("platform", "windows")
                .header("sec-ch-ua", "\"Chromium\";v=\"106\", \"Google Chrome\";v=\"106\", \"Not;A=Brand\";v=\"99\"")
                .header("sec-ch-ua-mobile", "?0")
                .header("sec-ch-ua-platform", "\"Windows\"")
                .header("shop_id", "5079e64d35458008c8114693dbf3e4d6")
                .header("token", "0")
                .field("payment_code", "alipay_wap")
                .field("address_id", "undefined")
                .field("remark", "")
                .field("goods", "[{\"cart_id\":\"936_0\",\"id\":936,\"spec_id\":0,\"name\":\"定制科技方案\",\"price\":1,\"number\":1,\"image\":\"https://api.yunyinpay.com/uploads/image/2023/03/29/f81e5a618aa8fcee.jpg\",\"type_id\":0,\"sku_str\":\"\",\"sku_ids\":\"\",\"promotion_id\":0,\"promotion_price\":0,\"promotion_type\":0,\"key\":\"5079e64d35458008c8114693dbf3e4d6\",\"is_virtual\":1}]")
                .field("coupon_id", "0")
                .field("openid", "")
                .field("code", "")
                .field("is_weixin", "false")
                .field("keys", "5079e64d35458008c8114693dbf3e4d6")
                .field("user_id", "0")
                .field("is_virtual", "1")
                .field("temp_address", "")
                .field("temp_name", "")
                .field("temp_mobile", "")
                .asString();
        System.out.println(response.getBody().toString());
///{"code":200,"result":{"order_sn":"GA1683021755387000006400","payment_code":"alipay_scan"},"msg":"ok"}


        String orderId = "";
        /**
         *


        Unirest.setTimeouts(0, 0);
        HttpResponse<String> response1 = Unirest.get("https://api.yunyinpay.com:9506/m/Payment/orderPay?order_sn="+orderId+"&payment_code=alipay_scan&open_id=")

                .header("Accept-Language", "zh-CN,zh;q=0.9")
                .header("Connection", "keep-alive")
                .header("Origin", "https://wap.yunyinpay.com")
                .header("Referer", "https://wap.yunyinpay.com/")
                .header("Sec-Fetch-Dest", "empty")
                .header("Sec-Fetch-Mode", "cors")
                .header("Sec-Fetch-Site", "same-site")
                .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36")
                .header("anti", "@#fdd")
                .header("brand", "undefined")
                .header("content-type", "application/x-www-form-urlencoded")
                .header("model", "PC")
                .header("platform", "windows")
                .header("sec-ch-ua", "\"Chromium\";v=\"106\", \"Google Chrome\";v=\"106\", \"Not;A=Brand\";v=\"99\"")
                .header("sec-ch-ua-mobile", "?0")
                .header("sec-ch-ua-platform", "\"Windows\"")
                .header("shop_id", "5079e64d35458008c8114693dbf3e4d6")
                .header("token", "0")
                .asString();

   */





    }


    public static String createParam(Map<String, Object> map) {
        try {
            if (map == null || map.isEmpty())
                return null;
            Object[] key = map.keySet().toArray();
            Arrays.sort(key);
            StringBuffer res = new StringBuffer(128);
            for (int i = 0; i < key.length; i++)
                if (!Objects.isNull(map.get(key[i])))
                    res.append(key[i] + "=" + map.get(key[i]) + "&");
            String rStr = res.substring(0, res.length() - 1);
            return rStr;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
