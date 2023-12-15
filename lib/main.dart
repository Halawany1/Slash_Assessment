import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slash_task/controller/details_item_cubit.dart';
import 'package:slash_task/core/constant/constant.dart';

import 'view/details_screen.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsItemCubit(),
      //Screen util using for responsive
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  const DetailsScreen(),

            // Theme for my App
            theme: ThemeData(
              appBarTheme:const  AppBarTheme(
                  color: ColorConstance.backgroundColor,
                  elevation: 0
              ),
              iconTheme:const IconThemeData(
                  color: Colors.white
              ),
              textTheme: TextTheme(
                bodySmall:GoogleFonts.dmSans(
                    fontSize: 20.sp,

                    color: Colors.white
                ) ,
              ),
              scaffoldBackgroundColor: ColorConstance.backgroundColor,
            ),
          );
        },
      ),
    );
  }
}