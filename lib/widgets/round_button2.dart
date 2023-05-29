import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundButton2 extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const RoundButton2({Key? key,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 5.92.h,
        width: 79.74.w,
        decoration: BoxDecoration(
            color: Color.fromRGBO(12,25,71,1),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
      ),
    );
  }
}
