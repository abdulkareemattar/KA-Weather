import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/pages/home_screen.dart';

class ContactChip extends StatelessWidget {
  const ContactChip ({super.key, required this.txt, required this.icon, required this.fun});
final String txt;
final Widget icon;
final void Function () fun;

  @override
  Widget build(BuildContext context) {
    return               Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    child: ActionChip(elevation: 5,
    backgroundColor: darkorange,
    labelStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'palabi',
    fontSize: 20.sp),
    label: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text(
    txt,
    style: TextStyle(color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'palabi',
    fontStyle: FontStyle.italic,
    fontSize: 15.sp),
),
icon,
],
),
onPressed: fun ,
),
)
;
  }
}
