part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetNewsEvent extends NewsEvent{}

class GetNewsByCategoriesEvent extends NewsEvent{
  String? categories;
  GetNewsByCategoriesEvent({required this.categories});
}

class GetNewsBySearchControllerEvent extends NewsEvent{
  String? queryController;
  GetNewsBySearchControllerEvent({required this.queryController});
}

class GetTopHeadlinesEvent extends NewsEvent{
  String? selectedCategory;
  GetTopHeadlinesEvent({required this.selectedCategory});
}

class GetTodaysNewsEvent extends NewsEvent{
  String? selectedCategory;
  GetTodaysNewsEvent({required this.selectedCategory});
}

/*
class GetTodaysNewsByCategoriesEvent extends NewsEvent{
  String categories;
  GetTodaysNewsByCategoriesEvent({required this.categories});
}

class GetTodaysNewsBysearchControllerEvent extends NewsEvent{
  String queryController;
  GetTodaysNewsBysearchControllerEvent({required this.queryController});
}*/
