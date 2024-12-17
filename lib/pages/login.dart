import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish/App_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wish/App_font.dart';
import 'package:wish/model/User.dart';
import 'package:wish/pages/main_be.dart';
import 'package:wish/pages/signup.dart';
import 'package:wish/widgets/Button/text_button.dart';
import 'package:wish/widgets/Form/insert_box.dart';
import 'package:wish/Provider/AutoProvider.dart'; // userProvider 임포트

class Login extends ConsumerWidget {
  Login({super.key});
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 69.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30.w),
              Image.asset(
                'assets/images/logo_medium.png',
                width: 240.w,
                height: 168.h,
              )
            ],
          ),
          SizedBox(height: 68.h),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColor.yellow50,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(80)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 33.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '로그인',
                        style: AppFont.MinsemiBold.copyWith(fontSize: 36.sp, color: const Color(0xff111827)),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InsertBox(
                        text: '아이디',
                        hint_text: '아이디를 입력해주세요.',
                        controller: idController,
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InsertBox(
                        text: '비밀번호',
                        hint_text: '비밀번호를 입력해주세요.',
                        controller: passwordController,
                      )
                    ],
                  ),
                  SizedBox(height: 57.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // 로그인 로직: 입력된 아이디와 비밀번호 확인
                          final enteredId = idController.text;
                          final enteredPassword = passwordController.text;

                          // 사용자 목록에서 입력된 아이디와 비밀번호가 일치하는 사용자 찾기
                          final user = users.firstWhere(
                            (user) => user.id == enteredId && user.password == enteredPassword,
                            orElse: () => User(id: '', name: '', password: ''),
                          );

                          // 사용자 찾기 성공하면 Main_be로 이동
                          if (user.id.isNotEmpty) {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => Main_be(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return child;
                                },
                              ),
                            );
                          } else {
                            // 로그인 실패 시 처리
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('아이디 또는 비밀번호가 일치하지 않습니다.')),
                            );
                          }
                        },
                        child: text_Button(text: '로그인'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '계정이 없다면',
                        style: AppFont.Minregular.copyWith(fontSize: 16.sp, color: const Color(0xff595F72)),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => Signup(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return child;
                            },
                          ),
                        ),
                        child: Text(
                          '회원가입',
                          style: AppFont.Minregular.copyWith(fontSize: 16.sp, color: const Color(0xffFF8C00)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
