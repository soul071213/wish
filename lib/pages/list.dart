import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wish/pages/main_af.dart';
import 'package:wish/widgets/Header/header.dart';
import 'package:wish/widgets/List_container.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wish/Provider/ListProvider.dart';  // Assuming you are using this provider to get the list data
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listItems = ref.watch(ListProvider); // Assuming you have ListProvider to get the list data

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(),
          SizedBox(height: 74.h),
          // Iterate over listItems and display each ListContainer widget for each item
          Expanded(
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                final item = listItems[index];
                return ListContainer(
                  date: item.date,  // Assuming item has a date field
                  image: item.number,  // Assuming item has an image field (could be an int or path to image)
                  name: item.text,  // Assuming item has a name field
                  title: item.fear,  // Assuming item has a title field
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Main_af(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  ),
                );
              },
              child: SvgPicture.asset('assets/images/pacel.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
