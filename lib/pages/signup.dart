import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish/App_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wish/App_font.dart';
import 'package:wish/Provider/AutoProvider.dart';
import 'package:wish/model/User.dart';
import 'package:wish/pages/onboarding.dart';
import 'package:wish/widgets/Button/text_button.dart';
import 'package:wish/widgets/Form/insert_box.dart';

class Signup extends ConsumerWidget {
  Signup({super.key});
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
          SizedBox(height: 20.h),
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
          SizedBox(height: 32.h),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppColor.yellow50,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 23.h),
                  Text(
                    '회원가입',
                    style: AppFont.Minbold.copyWith(fontSize: 36.sp, color: AppColor.gray800),
                  ),
                  SizedBox(height: 30.h),
                  InsertBox(
                    hint_text: '아이디를 입력해주세요.',
                    text: '아이디',
                    controller: idController,
                  ),
                  SizedBox(height: 30.h),
                  InsertBox(
                    hint_text: '이름을 입력해주세요.',
                    text: '이름',
                    controller: nameController,
                  ),
                  SizedBox(height: 30.h),
                  InsertBox(
                    hint_text: '비밀번호를 입력해주세요.',
                    text: '비밀번호',
                    controller: passwordController,
                  ),
                  SizedBox(height: 56.h),
                  GestureDetector(
                    onTap: () {
                      if (idController.text.isNotEmpty &&
                          nameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        // User 객체 생성
                        final newUser = User(
                          id: idController.text,
                          name: nameController.text,
                          password: passwordController.text,
                        );

                        // 사용자 정보를 userProvider에 추가
                        ref.read(userProvider.notifier).state = [...users, newUser];

                        // 회원가입 성공 후 Onboarding 페이지로 이동
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => Onboarding(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return child;
                            },
                          ),
                        );
                      } else {
                        // 입력값이 비어있을 경우 처리
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('모든 필드를 입력해주세요.')),
                        );
                      }
                    },
                    child: text_Button(text: '회원가입'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
