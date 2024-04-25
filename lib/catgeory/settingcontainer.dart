import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weather_provider.dart';
class settingcontainer extends StatelessWidget {
  const settingcontainer({super.key, 
    required this.text,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Color color;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10.0.sp),
          height: 80.h,
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(8.0),color: Provider.of<WeatherProvider>(context).tapped?Colors.purpleAccent:Colors.amberAccent
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: TextStyle(
                fontFamily: 'palabi',
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),),
              Icon(icon,size: 30.sp),
            ],
          ),
        ),
      ),
    );
  }
}
