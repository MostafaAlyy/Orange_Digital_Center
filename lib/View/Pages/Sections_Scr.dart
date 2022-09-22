import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';
import 'package:orangeflutertraing/View/Components/GeneralCompo/SectionCard.dart';
import 'package:orangeflutertraing/ViewModel/SectionsCupit/sections_cubit.dart';

class SectionsScr extends StatelessWidget {
  @override
  String title;
  SectionsScr({
    required this.title,
  });
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionsCubit()..getSections(),
      child: BlocConsumer<SectionsCubit, SectionsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = SectionsCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                foregroundColor: ColorManger.mainColor,
                centerTitle: true,
                title: Text('$title',
                    style: GoogleFonts.acme(fontSize: 20, color: Colors.black)),
                backgroundColor: Colors.white,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz_sharp),
                  )
                ],
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ConditionalBuilder(
                        condition: (cupit.sectionsModel != null),
                        builder: (context) => ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => SectionCard(
                                context,
                                title: cupit.sectionsModel!.data![index]
                                    .sectionSubject!,
                                timeTaken: "2hr",
                                stime: cupit.sectionsModel!.data![index]
                                    .sectionStartTime!,
                                etime: cupit.sectionsModel!.data![index]
                                    .sectionEndTime!,
                                Date: cupit
                                    .sectionsModel!.data![index].sectionDate!),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10),
                            itemCount: cupit.sectionsModel!.data!.length),
                        fallback: (context) => Center(
                              child: CircularProgressIndicator(
                                color: ColorManger.mainColor,
                              ),
                            ))),
              ));
        },
      ),
    );
  }
}
