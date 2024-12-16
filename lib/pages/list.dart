import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wish/pages/main_af.dart';
import 'package:wish/widgets/Header/header.dart';
import 'package:wish/widgets/List_container.dart';
import 'package:flutter_svg/svg.dart';

class list extends StatelessWidget {
  const list({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(),
          SizedBox(height: 74.h,),
          ListContainer(date: '2024년 12월 11일', image: 1, name: '김치가', title: '호날두'),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: GestureDetector( onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => Main_af(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return child;
                                },
                              ),
                            );
                          }, child: SvgPicture.asset('assets/images/pacel.svg')),
                )
              ],
            )
          ),
        ],
      )
    );
  }
}