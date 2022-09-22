import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../network/local/sharedPreferns.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
    static SettingsCubit get(BuildContext context) => BlocProvider.of(context);
  void LogOut() {
    CashHelper.ClearData(key: 'token');
    emit(LogOutState());
  }
}
