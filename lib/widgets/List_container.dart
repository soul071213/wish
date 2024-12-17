import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wish/App_color.dart';
import 'package:wish/App_font.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({required this.date,required this.image,required this.name,required this.title , super.key});
  final String date;
  final String title;
  final String name;
  final int image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.yellow100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 4,
                color: Color(0xff000000).withOpacity(0.16),
              ),
            ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 16.w,right: 23.w,top: 13.h),
            child: image==1? SvgPicture.asset('assets/images/yellow_unhappy.svg'):image==2? SvgPicture.asset('assets/images/yellow_smile.svg'):SvgPicture.asset('assets/images/yellow_soso.svg'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h,),
              Text('${date}',style: AppFont.Minregular.copyWith(fontSize: 16.sp) ),
              SizedBox(height: 6.h,),
              Text('${title}',style: AppFont.Minregular.copyWith(fontSize: 16.sp) )
            ],
          ),
          SizedBox(width: 52.w,),
          Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Text('${name}',style: AppFont.Minregular.copyWith(fontSize: 16.sp) ),
          )
        ],
      ),
    );
  }
}