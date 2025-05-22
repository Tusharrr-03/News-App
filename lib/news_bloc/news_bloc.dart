import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:news_app_ui/API%20Helper/api_helper.dart';
import 'package:news_app_ui/model/news_model.dart';
part 'news_event.dart';
part 'news_state.dart';


class NewsBloc extends Bloc<NewsEvent, NewsState> {
  ApiHelper apiHelper;

  NewsBloc({required this.apiHelper}) : super(NewsInitialState()) {
    on<GetNewsEvent>((event, emit) async{
      emit(NewsLoadingState());

      var resJson = await apiHelper.getAPI(url: ApiHelper.getNewsTopHeadlinesApi);
      if(resJson!=null){
        var mResJson = DataModelNews.fromJson(resJson);
        emit(NewsLoadedState(resData: mResJson));
      } else {
        emit(NewsErrorState(errorMsg: "Something went wrong"));
      }
    });

    on<GetNewsByCategoriesEvent>((event, emit) async{
      emit(NewsLoadingState());

      var resJson = await apiHelper.getAPI(url: "https://newsapi.org/v2/top-headlines?country=us&category=${event.categories}&apiKey=ebddf45ea6174b1ab06eb79529b34223");
      if(resJson!=null){
        var mResJson = DataModelNews.fromJson(resJson);
        emit(NewsLoadedState(resData: mResJson));
      } else {
        emit(NewsErrorState(errorMsg: "Something went wrong"));
      }
    });

    on<GetNewsBySearchControllerEvent>((event, emit) async{
      emit(NewsLoadingState());

      var resJson = await apiHelper.getAPI(url: "https://newsapi.org/v2/top-headlines?country=us&q=${event.queryController}&apiKey=ebddf45ea6174b1ab06eb79529b34223");
      if(resJson!=null){
        var mResJson = DataModelNews.fromJson(resJson);
        emit(NewsLoadedState(resData: mResJson));
      } else{
        emit(NewsErrorState(errorMsg: "Something went wrong"));
      }
    });

    on<GetTopHeadlinesEvent>((event, emit) async{
      emit(NewsLoadingState());

      var resJson = await apiHelper.getAPI(url: ApiHelper.getNewsTopHeadlinesApi);
      if(resJson!=null){
        var mResJson = DataModelNews.fromJson(resJson);
        emit(NewsLoadedState(resData: mResJson));
      } else{
        emit(NewsErrorState(errorMsg: "Top Headlines are not getting"));
      }
    });

    on<GetTodaysNewsEvent>((event, emit) async{
      emit(NewsLoadingState());

      var resJson = await apiHelper.getAPI(url: ApiHelper.getNewsApi);
      if(resJson!=null){
        var mResJson = DataModelNews.fromJson(resJson);
        emit(NewsLoadedState(resData: mResJson));
      } else{
        emit(NewsErrorState(errorMsg: "Today's News are not getting"));
      }
    });

    /*on<GetTodaysNewsByCategoriesEvent>((event, emit) async{
      emit(NewsLoadingState());

      var resJson = await apiHelper.getAPI(url: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=ebddf45ea6174b1ab06eb79529b34223");
      if(resJson!=null){
        var mResJson = DataModelNews.fromJson(resJson);
        emit(NewsLoadedState(resData: mResJson));
      } else {
        emit(NewsErrorState(errorMsg: "Something went wrong"));
      }
    });*/

    /*on<GetNewsBySearchControllerEvent>((event, emit) async{
      emit(NewsLoadingState());

      var resJson = await apiHelper.getAPI(url: "https://newsapi.org/v2/everything?q=${event.queryController}&apiKey=ebddf45ea6174b1ab06eb79529b34223");
      if(resJson!=null){
        var mResJson = DataModelNews.fromJson(resJson);
        emit(NewsLoadedState(resData: mResJson));
      } else{
        emit(NewsErrorState(errorMsg: "Something went wrong"));
      }
    });*/

  }
}
