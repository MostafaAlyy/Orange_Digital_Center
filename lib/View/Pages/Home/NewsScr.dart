import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';
import 'package:orangeflutertraing/View/Components/NewsCompo/CardCompo.dart';
import 'package:orangeflutertraing/ViewModel/NewsCupit/news_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Auth/SignUp.dart';

class NewsScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNews(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = NewsCubit.get(context);

          return Padding(
              padding: const EdgeInsets.all(14.0),
              child: ConditionalBuilder(
                  condition: (cupit.News != null),
                  builder: (context) => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsCardCompo(
                          image: cupit.News!.data![index].imageUrl.toString(),
                          title: cupit.News!.data![index].title.toString(),
                          body: cupit.News!.data![index].body.toString(),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                      itemCount: cupit.News!.data!.length),
                  fallback: (context) => Center(
                        child: CircularProgressIndicator(
                          color: ColorManger.mainColor,
                        ),
                      )));
        },
      ),
    );
  }
}
