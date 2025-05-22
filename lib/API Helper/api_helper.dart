import 'dart:convert';
import 'package:news_app_ui/Constants/appConst.dart';
import 'package:http/http.dart' as http;

class ApiHelper{
  static final getNewsApi = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=ebddf45ea6174b1ab06eb79529b34223";
  static final getNewsTopHeadlinesApi = "https://newsapi.org/v2/top-headlines?country=us&apiKey=ebddf45ea6174b1ab06eb79529b34223";

  Future<dynamic> getAPI({required String url}) async{
    var uri = Uri.parse(url);
    var res = await http.get(uri);

    if(res.statusCode == 200){
      var mData = jsonDecode(res.body);
      return mData;
    } else {
      return null;
    }

  }


  Future<dynamic> postAPI({required String url, Map<String, dynamic>? bodyParams}) async{
    var uri = Uri.parse(url);
    var res = await http.post(uri, body: bodyParams ?? {});

    if(res.statusCode == 200){
      var mData = jsonDecode(res.body);
      return mData;
    } else {
      return null;
    }
  }
}