import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app_ui/API%20Helper/api_helper.dart';
import 'package:news_app_ui/Constants/appConst.dart';
import 'package:news_app_ui/model/news_model.dart';
import 'package:http/http.dart' as httpClient;
import 'package:news_app_ui/news_bloc/news_bloc.dart';

class NavHomePage extends StatefulWidget {
  const NavHomePage({super.key});

  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  int selectedIndex = 0;
  var queryTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
  }

  Future<DataModelNews>getAllNews()async{
    String url = ApiHelper.getNewsTopHeadlinesApi;
    var res = await httpClient.get(Uri.parse(url));
    Map<String, dynamic> mData = jsonDecode(res.body);
    print(mData);
    DataModelNews allNews = DataModelNews.fromJson(mData);
    return allNews;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              /// Profile Structure of the app
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset("assets/images/tusharprofile.jpg",
                            fit: BoxFit.cover,),
                        ),
                      ), SizedBox(width: 7,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome", style: TextStyle(
                                fontSize: 16, color: Colors.black54),),
                            Text("Tushar Goyal!", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ), Expanded(child: SizedBox(width: 10,)),
                      Container(
                        child: Icon(Iconsax.notification, color: Colors.black,),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),

              /// TextField Area for search
              Container(
                height: 55,
                child: TextField(
                  controller: queryTextController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      suffix: TextButton(onPressed: (){
                        context.read<NewsBloc>().add(GetNewsBySearchControllerEvent(queryController: queryTextController.text));
                        setState(() {});
                      }, style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          foregroundColor: Colors.white,
                        backgroundColor: Colors.blue
                      ), child: Text("Search")),
                      prefixIcon: Icon(
                        Iconsax.search_normal, color: Colors.black54,),
                      hintText: "Let's see what happend today",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white),
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),

              /// Heading Before news section
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Breaking News !", style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),),
                    Text("See all", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              /// News Cards Sections
              Container(
                width: 450,
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: AppConstants.mNews.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Stack(
                          children: [

                            /// BackGround Image
                            Container(
                              height: 220,
                              width: 320,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(21),
                                child: Image.asset(
                                  AppConstants.mNews[index]['bg_image'], fit: BoxFit.cover,),
                              ),
                            ),

                            /// Hot Text
                            Positioned(
                                top: 20,
                                left: 20,
                                child: Container(
                                  width: 70,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10)
                                  ), child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(AppConstants.mNews[index]['hot_text'],
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                    textAlign: TextAlign.center,),
                                ),
                                )
                            ),

                            /// Nature Text
                            Positioned(
                                right: 80,
                                top: 20,
                                child: Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 3, right: 3),
                                    child: Text(AppConstants.mNews[index]['nature_text'],
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,),
                                  ),
                                )
                            ),

                            /// Animal Text
                            Positioned(
                                right: 10,
                                top: 20,
                                child: Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 3, right: 3),
                                    child: Text(AppConstants.mNews[index]['animal_text'],
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,),
                                  ),
                                )
                            ),

                            /// CNBC news logo
                            Positioned(
                                bottom: 80,
                                left: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    AppConstants.mNews[index]['cnbc_logo'], width: 30,
                                    height: 30,
                                    fit: BoxFit.cover,),
                                )
                            ),

                            /// CNBC news Title
                            Positioned(
                              bottom: 85,
                              left: 60,
                              child: Text(AppConstants.mNews[index]['cnbc_text'],
                                style: TextStyle(color: Colors.white),),
                            ),

                            /// Dot
                            Positioned(
                              bottom: 91,
                              left: 140,
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Color(0XFFFFFFFFFF),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),

                            /// Text Position
                            Positioned(
                              bottom: 85,
                              left: 150,
                              child: Text(AppConstants.mNews[index]['time_text'],
                                style: TextStyle(color: Colors.white),),
                            ),

                            /// Icon and Text
                            Positioned(
                                bottom: 85,
                                right: 80,
                                child: Row(
                                  children: [
                                    Icon(AppConstants.mNews[index]['heart_icon'],
                                      color: Color(0XFFFFFFFFFF), size: 16,),
                                    SizedBox(width: 5,),
                                    Text(AppConstants.mNews[index]['heart_text'],
                                      style: TextStyle(color: Colors.white),),
                                  ],
                                )
                            ),

                            /// Icon and Text
                            Positioned(
                                bottom: 85,
                                right: 20,
                                child: Row(
                                  children: [
                                    Icon(AppConstants.mNews[index]['message_icon'],
                                      color: Color(0XFFFFFFFFFF), size: 16,),
                                    SizedBox(width: 5,),
                                    Text(AppConstants.mNews[index]['message_text'],
                                      style: TextStyle(color: Colors.white),),
                                  ],
                                )
                            ),

                            /// News Desc
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: Text(AppConstants.mNews[index]['news_desc'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                                textAlign: TextAlign.justify,),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),
              SizedBox(height: 20,),

              /// Trending Right Now Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending Right Now", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("See all", style: TextStyle(color: Colors.blue),)
                ],
              ),
              SizedBox(height: 20,),

              /// categories Button Container
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(AppConstants.mButtons.length, (index) =>
                      InkWell(
                        onTap: () {
                          selectedIndex = index;
                          context.read<NewsBloc>().add(GetNewsByCategoriesEvent(categories: AppConstants.mButtons[index]['category']));
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ), child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 12),
                              child: Text(AppConstants.mButtons[index]['text']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black),),
                          ),
                          ),
                        ),
                      ),),
                ),
              ),
              SizedBox(height: 20,),

              /// Container News List Tile
              BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state){
                    if(state is NewsLoadingState){
                      return Center(child: CircularProgressIndicator(),);
                    }

                    if(state is NewsErrorState){
                      return Center(child: Text(state.errorMsg),);
                    }

                    if(state is NewsLoadedState){
                      List<ArticlesModel>? allArticles = state.resData.articles;

                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: allArticles?.length,
                          itemBuilder: (_, index){

                            ArticlesModel eachArticle = allArticles![index];

                            return Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: eachArticle.urlToImage != null
                                            ? Image.network(eachArticle.urlToImage!, fit: BoxFit.cover)
                                            : Container(),
                                      ),
                                    ), SizedBox(width: 6,),
                                    Container(
                                      width: 250,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${eachArticle.title}",
                                            style: TextStyle(color: Colors.grey),),
                                          SizedBox(height: 5,),
                                          Text(
                                            "${eachArticle.description}",textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 14, fontWeight: FontWeight.bold),),
                                          SizedBox(height: 5,),
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  width: 240,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(width: 5,),
                                                      Container(
                                                        width: 100,
                                                        child: Text("${eachArticle.author}",overflow: TextOverflow.ellipsis ,style: TextStyle(
                                                            color: Colors.black54),),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Container(
                                                        width: 3,
                                                        height: 3,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(
                                                              5),
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Container(
                                                        width: 100,
                                                        child: Text("${eachArticle.source?.name}", overflow: TextOverflow.ellipsis ,style: TextStyle(
                                                            color: Colors.black54),),
                                                      )
                                                    ],
                                                  )
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Container();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
