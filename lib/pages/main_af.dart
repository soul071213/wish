import 'package:flutter/material.dart';
import 'package:wish/App_color.dart';
import 'package:wish/App_font.dart';
import 'package:wish/pages/list.dart';
import 'package:wish/widgets/Header/header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Main_af extends StatefulWidget {
  const Main_af({super.key});

  @override
  State<Main_af> createState() => _Main_afState();
}

class _Main_afState extends State<Main_af> {
  int happy_state=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(),
          SizedBox(height: 30.h,),
          Expanded(child: Container(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('안녕하세요.',style: AppFont.Minregular.copyWith(fontSize: 20.sp) ,),
                        Text('정소울님',style: AppFont.Minmedium.copyWith(fontSize: 24.sp) )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 62.h,),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38.w),
                        child: SvgPicture.asset('assets/images/yellow_unhappy.svg')
                      ),
                 ],
               ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Container(
                      width: 173.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color:AppColor.yellow200,
                        borderRadius: BorderRadius.circular(10)
                      ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('연골 연화증')
                          ),
                    ),
                    SizedBox(width: 13.w,),
                    Container(
                      width: 173.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color:AppColor.yellow400,
                        borderRadius: BorderRadius.circular(10)
                      ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('07/22')
                          ),
                    )
                  ],
                ),
                SizedBox(height: 16.h,),
                Container(
                      width: 360.w,
                      height: 240.h,
                      decoration: BoxDecoration(
                        color:AppColor.yellow100,
                        borderRadius: BorderRadius.circular(10)
                      ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('호날두')
                          ),
                    ),
                    SizedBox(height: 26.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(onTap: () {
                           Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => list(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return child;
                              },
                            ),
                          );
                        }, child: SvgPicture.asset('assets/images/list.svg'))
                      ],
                    )
              ],
            ),),
          ))
        ],
      ),
    );
  }
}