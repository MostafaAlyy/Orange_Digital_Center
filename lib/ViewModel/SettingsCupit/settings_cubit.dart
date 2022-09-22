import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orangeflutertraing/ViewModel/network/remote/end_points.dart';
import 'package:orangeflutertraing/model/TermsModel.dart';

import '../network/local/sharedPreferns.dart';
import '../network/remote/dio_helper.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(BuildContext context) => BlocProvider.of(context);
  void LogOut() {
    CashHelper.ClearData(key: 'token');
    emit(LogOutState());
  }

  termsOfCondition? terms;

  void getTerms() async {
    await DioHelper.getData(
      url: termsEndPoint,
      token: CashHelper.getData(key: 'token'),
    ).then((value) {
      terms = termsOfCondition.fromJson(value.data);
      emit(TermsSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(TermsErrorState());
    });
  }
}
