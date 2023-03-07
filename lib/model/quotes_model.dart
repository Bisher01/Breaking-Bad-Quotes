import 'dart:convert';

class QuotesModel {
  QuotesModel({
    this.quote,
    this.author,
  });

  String? quote;
  String? author;

  factory QuotesModel.fromRawJson(String str) => QuotesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
    quote: json["quote"],
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "quote": quote,
    "author": author,
  };
}
