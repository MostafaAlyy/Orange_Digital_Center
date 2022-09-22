import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangeflutertraing/View/Pages/Home/Home.dart';
import 'package:orangeflutertraing/View/Pages/Home/NewsScr.dart';
import 'package:orangeflutertraing/View/Pages/Home/Settings.dart';
import 'package:orangeflutertraing/ViewModel/AuthCupit/states.dart';
import 'package:orangeflutertraing/ViewModel/network/remote/dio_helper.dart';
import 'package:orangeflutertraing/ViewModel/network/remote/end_points.dart';
import 'package:orangeflutertraing/model/RegsterModel.dart';

import '../../model/UserLoginModel.dart';
import '../network/local/sharedPreferns.dart';

class AuthCupit extends Cubit<ODCStates> {
  AuthCupit() : super(ODCInitialState());

  static AuthCupit get(BuildContext context) => BlocProvider.of(context);

  List<String> GenderList = <String>[
    'Male',
    'Female',
  ];
  List<String> UniversityList = <String>['AUC', 'CIS', 'CIC', 'FCIS'];
  List<String> GradeList = <String>[
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
  ];

  bool isPassowrdShown = false;
  void ShowPass() {
    isPassowrdShown = !isPassowrdShown;
    emit(ShowPassState());
  }

  String Gender = 'm';
  String SelectedGender = "Male";

  void changeGender(String s) {
    SelectedGender = s;
    emit(ODCIChangeSelectedGenderState());
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  UserLoginModel? userLogin;

  void Login() async {
    await DioHelper.postData(url: loginEndPoint, data: {
      'email': '${emailController.text.toString()}',
      'password': '${passController.text.toString()}'
    }).then((value) {
      print(value.data.toString());
      userLogin = UserLoginModel.fromJson(value.data);
      print(userLogin!.message.toString());
      CashHelper.SaveData(key: 'token', value: userLogin!.data!.accessToken);
      emit(ODCILoginSucsessState(userLogin!.message.toString()));
    }).catchError((Error) {
      print(Error.toString());
      emit(ODCILoginEroreState(Error.toString()));
    });
  }

  RegsterModel? userRegster;

  TextEditingController RegsteremailController = TextEditingController();
  TextEditingController RegsterpassController = TextEditingController();
  TextEditingController RegsterConfirmpassController = TextEditingController();
  TextEditingController RegsterNameController = TextEditingController();
  TextEditingController RegsterPhoneController = TextEditingController();
  void Regster() async {
    await DioHelper.postData(url: registerEndPoint, data: {
      'email': '${RegsteremailController.text.toString()}',
      'password': '${RegsterpassController.text.toString()}',
      'name': '${RegsterNameController.text.toString()}',
      'phoneNumber': '${RegsterPhoneController.text.toString()}',
      'gender': Gender,
    }).then((value) {
      print(value.data.toString());
      userRegster = RegsterModel.fromJson(value.data);
      print(userRegster!.message.toString());

      emit(ODCIRegsterSucsessState(userRegster!.message.toString()));
    }).catchError((Error) {
      print(Error.toString());
      emit(ODCIRegsterEroreState(Error.toString()));
    });
  }
}
