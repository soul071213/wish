import 'package:flutter/material.dart';
import 'package:wish/App_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wish/App_font.dart';
import 'package:wish/pages/login.dart';
import 'package:wish/widgets/Button/text_button.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30.w,),
              Image.asset('assets/images/logo_medium.png',width: 240.w,height: 168.h,)
            ],
          ),
          SizedBox(height: 32.h,),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppColor.yellow50,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(100))
              ),
            ),
          )
        ],
      ),
    );
  }
}