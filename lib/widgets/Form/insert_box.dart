import 'package:flutter/material.dart';
import 'package:wish/App_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wish/App_font.dart';

class InsertBox extends StatefulWidget {
  const InsertBox({required this.hint_text,required this.text,required this.controller,super.key});
  final String text;
  final String hint_text;
  final TextEditingController controller;
  @override
  State<InsertBox> createState() => _InsertBoxState();
}

class _InsertBoxState extends State<InsertBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      height: 78.h,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 8,
            color: const Color(0xFF636363).withOpacity(0.2), // 올바른 색상 및 투명도 설정
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w,top: 11.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.text}',style: AppFont.MinsemiBold.copyWith(color: const Color(0xff374151),fontSize: 20.sp),),
            Container(
              width: 308.w,
              height: 37.h,
              child: TextField(
                controller: widget.controller,
              style: AppFont.Minregular.copyWith(fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: '${widget.hint_text}',
                hintStyle: AppFont.Minregular.copyWith(color:const Color(0xffCDCDCD).withOpacity(0.6),fontSize:16.sp ),
                border: InputBorder.none,
                
              ),
            ),
            )
            
          ],
        ),
      ),
    );
  }
}