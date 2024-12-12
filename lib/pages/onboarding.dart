import 'package:flutter/material.dart';
import 'package:wish/App_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wish/App_font.dart';
import 'package:wish/widgets/Button/text_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 161.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30.w,),
              Image.asset('assets/images/logo_big.png',width: 338.w,height: 236.h,)
            ],
          ),
          SizedBox(height: 267.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text_Button(text: '로그인',)
            ],
          ),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('계정이 없다면',style: AppFont.Minregular.copyWith(color: Color(0xff595F72),fontSize: 16),),
              SizedBox(width: 8,),
              Text('회원가입',style: AppFont.Minregular.copyWith(color: Color(0xffFF8C00),fontSize: 16))
            ],
          )
        ],
      ),
    );
  }
}