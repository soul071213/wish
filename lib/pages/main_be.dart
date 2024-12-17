import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish/Provider/AutoProvider.dart';
import 'package:wish/Provider/ListProvider.dart';
import 'package:wish/model/Lists.dart';
import 'package:wish/App_color.dart';
import 'package:wish/App_font.dart';
import 'package:wish/pages/main_af.dart';
import 'package:wish/widgets/Header/header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Main_be extends ConsumerStatefulWidget {
  const Main_be({super.key});

  @override
  ConsumerState<Main_be> createState() => _Main_beState();
}

class _Main_beState extends ConsumerState<Main_be> {
  int happy_state = 0;
  TextEditingController pearController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final lists = ref.watch(ListProvider); // Watch the list from the provider
    final userName = ref.watch(userProvider); 
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
                            Text(
                              '${userName.first.name}님',
                              style: AppFont.Minmedium.copyWith(fontSize: 24.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 62.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: AppColor.yellow50,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    happy_state = 1;
                                  });
                                },
                                child: happy_state == 1
                                    ? SvgPicture.asset('assets/images/yellow_unhappy.svg')
                                    : SvgPicture.asset('assets/images/unhappy.svg')),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  happy_state = 2;
                                });
                              },
                              child: happy_state == 2
                                  ? SvgPicture.asset('assets/images/yellow_smile.svg')
                                  : SvgPicture.asset('assets/images/smile.svg'),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  happy_state = 3;
                                });
                              },
                              child: happy_state == 3
                                  ? SvgPicture.asset('assets/images/yellow_soso.svg')
                                  : SvgPicture.asset('assets/images/soso.svg'),
                            )
                          ],
                        ),
                      ),
                    ),
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
                            child: TextField(
                              controller: dateController,
                              style: AppFont.Minregular.copyWith(fontSize: 32.sp),
                              decoration: InputDecoration(
                                hintText: '병명',
                                hintStyle: AppFont.Minregular.copyWith(
                                  color: const Color(0xffCDCDCD).withOpacity(0.6),
                                  fontSize: 32.sp,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
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
                            child: TextField(
                              controller: pearController,
                              style: AppFont.Minregular.copyWith(fontSize: 24.sp),
                              decoration: InputDecoration(
                                hintText: '날짜',
                                hintStyle: AppFont.Minregular.copyWith(
                                  color: const Color(0xffCDCDCD).withOpacity(0.6),
                                  fontSize: 24.sp,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        )
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
                        child: TextField(
                          controller: commentController,
                          style: AppFont.Minregular.copyWith(fontSize: 20.sp),
                          decoration: InputDecoration(
                            hintText: '오늘의 일기를 작성해주세요.',
                            hintStyle: AppFont.Minregular.copyWith(
                                color: const Color(0xffCDCDCD).withOpacity(0.6),
                                fontSize: 20.sp),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 26.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Add a new entry to the list
                            final newList = Lists(
                              number: happy_state,
                              fear: pearController.text,
                              date: dateController.text,
                              text: commentController.text,
                            );

                            // Update the list using Riverpod provider
                            ref.read(ListProvider.notifier).state = [
                              ...lists,
                              newList
                            ];

                            // Clear the controllers after saving
                            pearController.clear();
                            dateController.clear();
                            commentController.clear();

                            // Navigate to the next page
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    Main_af(),
                                transitionsBuilder:
                                    (context, animation, secondaryAnimation, child) {
                                  return child;
                                },
                              ),
                            );
                          },
                          child: SvgPicture.asset('assets/images/pacel.svg'),
                        ),
                      ],
                    )
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
