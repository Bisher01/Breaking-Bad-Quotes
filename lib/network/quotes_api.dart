import 'dart:convert';
import 'dart:developer';

import '../util/api_url.dart';
import '../model/quotes_model.dart';
import 'package:http/http.dart' as http;

class QuotesApi {
  Future<QuotesModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.quotes}';
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      log("Response:: QuotesResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("QuotesStatusCode:: ${response.statusCode}  QuotesBody:: ${response.body}");
      final jsonResponse = json.decode(response.body);
      QuotesModel quotesModel =
          QuotesModel.fromJson(jsonResponse[0]);
      if (response.statusCode == 200) {
        return quotesModel;
      } else {
        throw "Quotes Error";
      }
    } catch (e) {
      log("Quotes Error $e");
      return null;
    }
  }
}
