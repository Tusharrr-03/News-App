import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ui/API%20Helper/api_helper.dart';
import 'package:news_app_ui/news_bloc/news_bloc.dart';
import 'package:news_app_ui/screens/home_page.dart';
import 'package:news_app_ui/utils/utils_helper.dart';

class NewsTypePage extends StatefulWidget {
  @override
  State<NewsTypePage> createState() => _NewsTypePageState();
}

class _NewsTypePageState extends State<NewsTypePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(GetTopHeadlinesEvent(
        selectedCategory: ApiHelper.getNewsTopHeadlinesApi));
    BlocProvider.of<NewsBloc>(context)
        .add(GetTodaysNewsEvent(selectedCategory: ApiHelper.getNewsApi));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state is NewsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NewsErrorState) {
            return Center(
              child: Text(state.errorMsg),
            );
          }

          if (state is NewsLoadedState) {
            return Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    context.read<NewsBloc>().add(GetTopHeadlinesEvent(
                        selectedCategory: ApiHelper.getNewsTopHeadlinesApi));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.orange.shade100,
                              offset: Offset(0, 5),
                              spreadRadius: 2,
                              blurRadius: 9)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Top Headlines",
                            style: mTextStyle32(
                                mFontWeight: FontWeight.bold,
                                mColor: Colors.blue),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffE0FFFF),
                            ),
                            child: Icon(Icons.arrow_forward_ios_outlined),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    context.read<NewsBloc>().add(GetTodaysNewsEvent(selectedCategory: ApiHelper.getNewsApi));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Color(0xff7393B3),
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffA3BFD9),
                              offset: Offset(0, 5),
                              spreadRadius: 2,
                              blurRadius: 9)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Today's News",
                            style: mTextStyle32(
                                mFontWeight: FontWeight.bold,
                                mColor: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffE0FFFF),
                            ),
                            child: Icon(Icons.arrow_forward_ios_outlined),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }
}
