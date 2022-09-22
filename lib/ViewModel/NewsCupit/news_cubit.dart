import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangeflutertraing/ViewModel/network/local/sharedPreferns.dart';
import 'package:orangeflutertraing/model/NewsModel.dart';
import '../network/remote/dio_helper.dart';
import '../network/remote/end_points.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  NewsModel? News;

  void getNews() async {
    await DioHelper.getData(
      url: newsEndPoint,
      token: CashHelper.getData(key: 'token'),
    ).then((value) {
      News = NewsModel.fromJson(value.data);
      emit(NewsGetSussesState());
    }).catchError((onError) {
      print(onError);
      emit(NewsGetErrorsState());
    });
  }
}
