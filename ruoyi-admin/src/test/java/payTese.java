import com.google.common.net.MediaType;
import com.ruoyi.common.utils.http.HttpUtils;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

import java.io.IOException;
import java.util.*;

public class payTese {


    public static void main(String[] args) throws IOException {


/**
 payment_code: alipay_wap
 address_id: undefined
 remark:
 goods: [
 {
 "cart_id":"936_0",
 "id":936,
 "spec_id":0,
 "name":"定制科技方案",
 "price":1,
 "number":50,
 "image":"https://api.yunyinpay.com/uploads/image/2023/03/29/f81e5a618aa8fcee.jpg",
 "type_id":0,
 "sku_str":"",
 "sku_ids":"",
 "promotion_id":0,
 "promotion_price":0,
 "promotion_type":0,
 "key":"5079e64d35458008c8114693dbf3e4d6",
 "is_virtual":1
 }
 ]

 coupon_id: 0
 openid:
 code:
 is_weixin: false
 keys: 5079e64d35458008c8114693dbf3e4d6
 user_id: 0
 is_virtual: 1
 temp_address:
 temp_name:
 temp_mobile:
 */


        Map map = new HashMap();
        map.put("payment_code", "payment_code");
        map.put("address_id", "undefined");
        map.put("remark", "");
        List list = new ArrayList();
            Map mappara = new HashMap();
            mappara.put("cart_id", "936_0");
            mappara.put("id", "936");
            mappara.put("spec_id", "0");
            mappara.put("name", "定制科技方案");
            mappara.put("price", "1");
            mappara.put("number", 50);
            mappara.put("image", "https://api.yunyinpay.com/uploads/image/2023/03/29/f81e5a618aa8fcee.jpg");
            mappara.put("type_id", "1");
            mappara.put("sku_str", "");
            mappara.put("sku_ids", "");
            mappara.put("promotion_id", "0");
            mappara.put("promotion_price", "0");
            mappara.put("promotion_type", "0");
            mappara.put("key", "5079e64d35458008c8114693dbf3e4d6");
            mappara.put("is_virtual", "1");
        list.add(mappara);
        map.put("goods", list);
        map.put("coupon_id", "1");
        map.put("openid", "");
        map.put("code", "");
        map.put("is_weixin", "false");
        map.put("keys", "5079e64d35458008c8114693dbf3e4d6");
        map.put("user_id", "0");
        map.put("is_virtual", "1");
        map.put("temp_address", "");
        map.put("temp_name", "");
        map.put("temp_mobile", "");
        String param = createParam(map);

        System.out.println("-----------    "+param);
        String s = HttpUtils.sendPost("https://api.yunyinpay.com:9506/m/Payment/createOrder", param);

        System.out.println("2222222        ---------     "+s);





        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
      //  MediaType mediaType = MediaType.parse(" application/x-www-form-urlencoded");
       // RequestBody body = RequestBody.create(mediaType, "");
        Request request = new Request.Builder()
                .url("https://api.yunyinpay.com:9506/m/Payment/createOrder?payment_code=alipay_wap&address_id=undefined&remark=&goods=%5B%7B%22cart_id%22%3A%22936_0%22%2C%22id%22%3A936%2C%22spec_id%22%3A0%2C%22name%22%3A%22%E5%AE%9A%E5%88%B6%E7%A7%91%E6%8A%80%E6%96%B9%E6%A1%88%22%2C%22price%22%3A1%2C%22number%22%3A20%2C%22image%22%3A%22https%3A%2F%2Fapi.yunyinpay.com%2Fuploads%2Fimage%2F2023%2F03%2F29%2Ff81e5a618aa8fcee.jpg%22%2C%22type_id%22%3A0%2C%22sku_str%22%3A%22%22%2C%22sku_ids%22%3A%22%22%2C%22promotion_id%22%3A0%2C%22promotion_price%22%3A0%2C%22promotion_type%22%3A0%2C%22key%22%3A%225079e64d35458008c8114693dbf3e4d6%22%2C%22is_virtual%22%3A1%7D%5D&coupon_id=0&openid=&code=&is_weixin=false&keys=5079e64d35458008c8114693dbf3e4d6&user_id=0&is_virtual=1&temp_address=&temp_name=&temp_mobile=")
         //       .method("POST", body)
                .addHeader("Accept", " */*")
                .addHeader("Accept-Encoding", " gzip, deflate, br")
                .addHeader("Accept-Language", " zh-CN,zh;q=0.9")
                .addHeader("anti", " @#fdd")
                .addHeader("brand", " undefined")
                .addHeader("Connection", " keep-alive")
                .addHeader("Content-Length", " 728")
                .addHeader("content-type", " application/x-www-form-urlencoded")
                .addHeader("Host", " api.yunyinpay.com:9506")
                .addHeader("model", " PC")
                .addHeader("Origin", " https://wap.yunyinpay.com")
                .addHeader("platform", " macos")
                .addHeader("Referer", " https://wap.yunyinpay.com/")
                .addHeader("sec-ch-ua", " \"Chromium\";v=\"112\", \"Google Chrome\";v=\"112\", \"Not:A-Brand\";v=\"99\"")
                .addHeader("sec-ch-ua-mobile", " ?1")
                .addHeader("sec-ch-ua-platform", " \"Android\"")
                .addHeader("Sec-Fetch-Dest", " empty")
                .addHeader("Sec-Fetch-Mode", " cors")
                .addHeader("Sec-Fetch-Site", " same-site")
                .addHeader("shop_id", " 5079e64d35458008c8114693dbf3e4d6")
                .addHeader("token", " 0")
                .addHeader("User-Agent", " Mozilla/5.0 (Linux; U; Android 4.0; en-us; GT-I9300 Build/IMM76D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30")
                .build();
        Response response = client.newCall(request).execute();
        System.out.println(response.body().toString());
        System.out.println("333333333        ---------     "+response.body().toString());

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
