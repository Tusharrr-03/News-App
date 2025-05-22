part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

final class NewsInitialState extends NewsState {}
final class NewsLoadingState extends NewsState {}
final class NewsLoadedState extends NewsState {
  DataModelNews resData;
  NewsLoadedState({required this.resData});
}
final class NewsErrorState extends NewsState {
  String errorMsg;
  NewsErrorState({required this.errorMsg});
}
