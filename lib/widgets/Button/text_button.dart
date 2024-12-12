import 'package:flutter/material.dart';
import 'package:wish/App_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wish/App_font.dart';

class text_Button extends StatefulWidget {
  text_Button({required this.text,super.key});
  final String text;
  @override
  State<text_Button> createState() => _text_ButtonState();
}

class _text_ButtonState extends State<text_Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: AppColor.yellow400,
      ),
      width: 361.w,
      height: 43.h,
      child: Center(
        child: Text('${widget.text}',style: AppFont.Minmedium.copyWith(fontSize: 22.sp,color: AppColor.white),),
      ),
    );
  }
}