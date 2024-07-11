import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/controller/news_listing_controller.dart';
import 'package:news_app/ui/news_detail_screen.dart';
import 'package:sizer/sizer.dart';

import '../constants/StringConstants.dart';
import '../constants/TextstyleConstants.dart';

class News_listing_screen extends StatelessWidget {
   News_listing_screen({Key? key}) : super(key: key);
   News_listing_controller controller=Get.put(News_listing_controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:  ,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/100*3,right: MediaQuery.of(context).size.width/100*3,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(discover,style:TextStyle(fontWeight: FontWeight.w700,fontSize: 35)),
              Text("News from all around the world",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.grey)),
              SizedBox(
                height: 1.h,
              ),
              searchview(),
              SizedBox(
                height: 2.h,
              ),
              news_listing_view()
            ],
          ),
        ),
      )
    );
  }
  Widget searchview(){
    return Container(
      child: Container(
        child: TextFormField(
          onChanged: (value){
          },
          controller: controller.searchcontroller,
          decoration: InputDecoration(
            hintText: "Search"

          ),
        ),
      ),
    );
  }
  Widget news_element(index){
    return GestureDetector(
      onTap: (){
        Get.to(News_detail_screen(news_title: controller.newslistings.elementAt(index).title??"",news_desc: controller.newslistings.elementAt(index).description??"",news_image: controller.newslistings.elementAt(index).urlToImage??"",news_pub_date: controller.newslistings!.elementAt(index).publishedAt??"",));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Container(
            width: 15.h,height: 15.h,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(controller.newslistings!.elementAt(index).urlToImage.toString(),),fit: BoxFit.fill,
                )
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width:60.w,
                      child: Text(controller.newslistings!.elementAt(index).title??"",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Container(
                      width:60.w,
                      child: Text(controller.newslistings!.elementAt(index).description??"",style: TextStyle(fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,),maxLines: 3,)),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Container(
                      width:60.w,
                      child: Text(controller.newslistings!.elementAt(index).publishedAt??"",style: TextStyle(fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,fontSize: 12,color: Colors.grey),maxLines: 2,)),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
  Widget news_listing_view(){
    return Expanded(
      child:
      Obx(()=> controller.newslistings.isNotEmpty?
      ListView.builder(itemCount: controller.newslistings.length,itemBuilder: (context,index){
        return news_element(index);
      }):
      Center(child: CircularProgressIndicator()))
    );
  }
}
