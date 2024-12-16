import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wish/pages/main_be.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 44.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            SizedBox(width: 16.w,),
            Image.asset(
                'assets/images/logo_small.png', 
                width: 50.w, 
                height: 34.h,
            )
        ],
      ),
    );
  }
}