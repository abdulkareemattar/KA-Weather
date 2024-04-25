import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/models/onboard_model.dart';

int pageIndex = 0;
PageController pageController = PageController();

Widget onboardcatgeory(
  BuildContext context,
  Onboardmodel onboardmodel,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
          height: 150.h,
          width: 150.w,
          child: Lottie.asset(onboardmodel.lottie!)),
      Text(
        onboardmodel.text!,
        maxLines: 5,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontFamily: 'palabi',
          fontStyle: FontStyle.italic,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
      ),
    ],
  );
}
