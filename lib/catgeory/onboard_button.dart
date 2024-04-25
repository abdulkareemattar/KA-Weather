import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  const Button({super.key,  required this.onpressed, required this.txt, required this.clr});
final void Function ()onpressed;
final String txt;
final Color clr;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation:10,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.purple.shade700,width: 1)),
                backgroundColor: clr,
                shadowColor: Colors.grey),
            onPressed: onpressed,
            child:  Text(txt, style: TextStyle(
              fontFamily: 'palabi',
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),)),
      ),
    );
  }
}
