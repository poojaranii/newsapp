import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:sizer/sizer.dart';

class News_detail_screen extends StatelessWidget {
  String news_title;
  String news_desc;
  String news_image;
  String news_pub_date;
   News_detail_screen({Key? key,required this.news_title,required this.news_desc,required this.news_image,required this.news_pub_date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
              onTap: (){
                Share.text(news_desc, news_title, 'text/plain');
                // Share.share(news_desc, subject: news_title);

              },
              child: Icon(Icons.share,color: Colors.black,)),
          SizedBox(
            width: 3.w,
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                newsimage_view(),
                SizedBox(
                  height: 2.h,
                ),
                desc_view()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget desc_view() {
    return Container(
      margin: EdgeInsets.only(left: 3.w, right: 3.w),
      child: Text(
        news_desc,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }

  Widget newsimage_view() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          width: double.infinity,
          height: 30.h,
          child: Image.network(
            news_image,errorBuilder:
              (context, error, stackTrace) {
            return Image.asset(
                'assets/images/placeholder.png',
                fit: BoxFit.fill);
          },
            width: double.infinity,
            height: 30.h,
          ),
        ),
        title_view()
      ],
    );
  }

  Widget title_view() {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            news_title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Text(
            news_pub_date,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    );
  }


}
