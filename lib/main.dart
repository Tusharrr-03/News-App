import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui/API%20Helper/api_helper.dart';
import 'package:news_app_ui/news_bloc/news_bloc.dart';
import 'package:news_app_ui/screens/news_type_page.dart';
import 'package:news_app_ui/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(
    BlocProvider(
        create: (context) => NewsBloc(apiHelper: ApiHelper()),
      child: News_App(),
    )
  );
}
class News_App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: SplashScreen(),
    );
  }
}