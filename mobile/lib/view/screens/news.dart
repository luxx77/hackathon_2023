import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/futures/auth/futures.dart';
import 'package:new_one_v1/main.dart';
import 'package:new_one_v1/models/news_model.dart';
import 'package:new_one_v1/view/widgets/builders/news_builder.dart';
import 'package:new_one_v1/view/widgets/screens_title.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  static final notifier = ValueNotifier<bool>(false);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final futures = getIt<AuthFutures>(instanceName: 'futures');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = futures.getNews();
  }

  Future? future;
  @override
  Widget build(BuildContext context) {
    log('REBUild');
    return Column(
      children: [
        const ScreenTitle(title: 'News'),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              futures.getNews();
            },
            child: FutureBuilder(
              future: future,
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: mainColor,
                  ));
                }
                if (snap.hasError || futures.news == null) {
                  return Center(
                    child: Text(
                      'Some thing went wrong',
                      style: GoogleFonts.urbanist(
                        decorationThickness: 2.sp,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  );
                }

                return ValueListenableBuilder(
                    valueListenable: NewsScreen.notifier,
                    builder: (context, value, child) {
                      return NewsBuilder(news: futures.news!);
                    });
              },
            ),
          ),
        )
      ],
    );
  }
}
