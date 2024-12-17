import 'package:flutter/material.dart';
import 'package:wish/App_color.dart';
import 'package:wish/App_font.dart';
import 'package:wish/Provider/AutoProvider.dart';
import 'package:wish/Provider/ListProvider.dart';
import 'package:wish/pages/list.dart';
import 'package:wish/widgets/Header/header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish/model/Lists.dart';
import 'package:wish/model/User.dart';  // 추가

class Main_af extends ConsumerStatefulWidget {
  const Main_af({super.key});

  @override
  ConsumerState<Main_af> createState() => _Main_afState();
}

class _Main_afState extends ConsumerState<Main_af> {
  int happy_state = 0;
  TextEditingController pearController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final listItems = ref.watch(ListProvider); // ListProvider 사용
    final user = ref.watch(userProvider); // userProvider 사용

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(),
          SizedBox(height: 30.h),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '안녕하세요.',
                              style: AppFont.Minregular.copyWith(fontSize: 20.sp),
                            ),
                            // 여기에서 user 객체의 name을 사용하여 출력
                            Text(
                             '${user.first.name}',
                              style: AppFont.Minmedium.copyWith(fontSize: 24.sp),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 62.h),
                    // 리스트 출력
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: listItems.length,
                      itemBuilder: (context, index) {
                        final item = listItems[index];
                        return Column(
                          children: [
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  width: 173.w,
                                  height: 150.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.yellow200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(item.fear,style: AppFont.Minmedium.copyWith(fontSize: 24.sp)), // fear 값 출력
                                  ),
                                ),
                                SizedBox(width: 13.w),
                                Container(
                                  width: 173.w,
                                  height: 150.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.yellow400,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(item.date,style: AppFont.Minmedium.copyWith(fontSize: 24.sp)), // date 값 출력
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: 360.w,
                              height: 240.h,
                              decoration: BoxDecoration(
                                color: AppColor.yellow100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(item.text,style: AppFont.Minmedium.copyWith(fontSize: 24.sp)), // text 값 출력
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 26.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => ListPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return child;
                                },
                              ),
                            );
                          },
                          child: SvgPicture.asset('assets/images/list.svg'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
