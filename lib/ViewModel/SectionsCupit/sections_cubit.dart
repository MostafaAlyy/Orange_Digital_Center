import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangeflutertraing/ViewModel/network/remote/end_points.dart';
import 'package:orangeflutertraing/model/SectionsModel.dart';

import '../network/local/sharedPreferns.dart';
import '../network/remote/dio_helper.dart';
part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());
  static SectionsCubit get(BuildContext context) => BlocProvider.of(context);

  SectionsModel? sectionsModel;
  void getSections() async {
    await DioHelper.getData(
      url: sectionEndPoint,
      token: CashHelper.getData(key: 'token'),
    ).then((value) {
      sectionsModel = SectionsModel.fromJson(value.data);
      print(sectionsModel!.message);
      emit(SectionsGetSusses());
    }).catchError((onError) {
      print(onError);
      emit(SectionsGetError());
    });
  }

  String? SelectedMoreItem;

  List<String> more = ['All', 'Finished', 'Remaining'];
}
