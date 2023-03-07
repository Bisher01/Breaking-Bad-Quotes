import 'package:breaking_bad/model/quotes_model.dart';
import 'package:breaking_bad/network/quotes_api.dart';
import 'package:flutter/material.dart';

class QuotesProvider extends ChangeNotifier {

  Future<QuotesModel?> getQuote() async {
    QuotesApi quotesApi = QuotesApi();
    QuotesModel? quotesModel = await quotesApi.data();
    return quotesModel;
  }

  void refresh(){
    notifyListeners();
  }

}
