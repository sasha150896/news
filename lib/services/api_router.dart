import 'dart:convert';
import 'package:http/http.dart' as https;
import '../helpers/const_helper.dart';

class ApiRouter {
  static Future sendRequest({required Map<String, String> requestParams}) async {
    https.Client client = https.Client();
    https.Response response;

    Uri uri = Uri.https(ConstHelper.urlApi, ConstHelper.path, requestParams);
    Map<String, String> _headers = {'Authorization': ConstHelper.apiKey};

    response = await client.get(uri, headers: _headers);

    return jsonDecode(response.body);
  }
}
