import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/model/news_listing_pojo.dart';

class News_listing_controller extends GetxController{
  TextEditingController searchcontroller= TextEditingController() ;
  // NewsListingPojo? newslisting;
  var newslistings = <Articles>[].obs;
  @override
  void onInit() {
    super.onInit();
    getnews_listing();
  }

  void getnews_listing() async {
    print("news api ");
    // var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    // http.Response response = await http.get(url);
    final response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2024-06-11&sortBy=publishedAt&apiKey=41c7b5b9bb074e3e9e6c57e955a307fa"));
    var responseData = json.decode(response.body);
    print("Reponse:-"+responseData.toString());
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        final newslisting=NewsListingPojo.fromJson(decodedData);
        newslistings.value=newslisting.articles!;
        update();
      } else {
        print("Error:-something wrong");
      }
    } catch (e) {
    print("Error:-"+e.toString());
    }
  }
}