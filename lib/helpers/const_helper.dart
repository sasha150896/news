import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstHelper {
  static const String urlApi = 'newsapi.org';
  static const String path = 'v2/top-headlines';
  static const String apiKey = "b48f1a4c97124003a43b0dbc31fa791e";
  static const String appBarTitle = "World News";
  static const String drawerHeaderMessage = "Please choose a country";
  static const String dataErrorMessage = "Failed to get data";
  static const String imageErrorMessage = "Failed to get image";
  static const Radius radius = Radius.circular(10);

  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle normalTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.black54,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle drawerActiveStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle drawerNormalStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static const Map cities = {
    "ae" : "United Arab Emirates",
    "ar" : "Argentina",
    "at" : "Austria",
    "au" : "Australia",
    "be" : "Belgium",
    "bg" : "Bulgaria",
    "br" : "Brazil",
    "ca" : "Canada",
    "ch" : "Switzerland",
    "cn" : "China",
    "co" : "Colombia",
    "cu" : "Cuba",
    "cz" : "Czech Republic",
    "de" : "Germany",
    "eg" : "Egypt",
    "fr" : "France",
    "gb" : "United Kingdom",
    "gr" : "Greece",
    "hk" : "Hong Kong",
    "hu" : "Hungary",
    "id" : "Indonesia",
    "ie" : "Ireland",
    "il" : "Israel",
    "in" : "India",
    "it" : "Italy",
    "jp" : "Japan",
    "kr" : "Korea",
    "lt" : "Lithuania",
    "lv" : "Latvia",
    "ma" : "Morocco",
    "mx" : "Mexico",
    "my" : "Malaysia",
    "ng" : "Nigeria",
    "nl" : "Nicaragua",
    "no" : "Norway",
    "nz" : "New Zealand",
    "ph" : "Philippines",
    "pl" : "Poland",
    "pt" : "Portugal",
    "ro" : "Romania",
    "ru" : "Россия",
    "sa" : "Saudi Arabia",
    "se" : "Sweden",
    "sg" : "Singapore",
    "si" : "Slovenia",
    "sk" : "Slovakia",
    "th" : "Thailand",
    "tr" : "Turkey",
    "tw" : "Taiwan",
    "ua" : "Ukraine",
    "us" : "United States",
    "ve" : "Venezuela",
    "za" : "South Africa",
  };
}