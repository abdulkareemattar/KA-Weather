import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherItems extends StatelessWidget {
  final String txt;
  final Color colorOfContainerOfTxt;
  final Color colorOfContainerOfData;
  final Color colorOfTxt;
  final Color colorOfData;
  final String data;
  final IconData iconOfText;
  final Color colorOfIcon;
  final double paddingToRow;

  const WeatherItems({super.key, 
    required this.txt,
    required this.colorOfContainerOfTxt,
    required this.colorOfContainerOfData,
    required this.data,
    required this.iconOfText,
    required this.colorOfIcon,
    required this.paddingToRow,
    required this.colorOfTxt ,
    required this.colorOfData ,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Chip(
          backgroundColor: colorOfContainerOfTxt,
          label: SizedBox(width: paddingToRow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(iconOfText, color: colorOfIcon),
                Text(
                  txt,
                ),
              ],
            ),
          ),
          labelStyle: TextStyle(
              fontSize: 10.sp,
              fontFamily: 'palabi',
              color:colorOfTxt,
              fontWeight: FontWeight.bold),
        ),
        Chip(
          backgroundColor: colorOfContainerOfData,
          label: Text(
            data,
            style: TextStyle(color: colorOfData,
              fontSize: 10.sp,
              fontFamily: 'palabi',
            ),
          ),
        ),
      ],
    );
  }
}
