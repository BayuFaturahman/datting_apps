import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:datting_app/app/component/colors.dart';
import 'package:datting_app/app/component/icons.dart';
import 'package:datting_app/app/modules/home/views/widget/cardview.dart';
import 'package:datting_app/app/modules/home/views/widget/notification_dots.dart';
import 'package:datting_app/app/modules/home/views/widget/swipeablecardview.dart';
import 'package:datting_app/app/modules/home/views/widget/views_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: BaseColor.primary,
          appBar: AppBar(
            backgroundColor: BaseColor.primary,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BaseIcons.location,
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '목이길어슬픈기린님의 새로운 스팟',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    StarPopularity(
                      icon: BaseIcons.star,
                      views: '323,233',
                      width: Get.width / 4,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      backgroundcolor: Colors.transparent,
                      bodercolor: BaseColor.border,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Stack(
                      children: [
                        BaseIcons.notification,
                        const Positioned(
                          left: 12,
                          child: NotificationDots(),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Obx(()=> controller.isLoading.value ==true
              ? const Center(child: CircularProgressIndicator())
            :  controller.dataCard.isEmpty
            ? const Center(
              child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInformation(
                  text: '추천 드릴 친구들을 준비 중이에요',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 12,
                ),
                TextInformation(
                  text: '매일 새로운 친구들을 소개시켜드려요',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ],
                        ),
            )
       : SizedBox(
              width: Get.width,
              height: Get.height - 200,
              child: CarouselSlider.builder(
                itemCount: controller.dataCard[controller.indexCard.value]['data']['images'].length,
                options: CarouselOptions(
                  viewportFraction: 0.91,
                  enableInfiniteScroll: false,
                  height: Get.height - 200,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 16 / 9,
                  onPageChanged: (index, reason) {
                    controller.current.value = index;
                  },
                ),
                itemBuilder: (context, index, _) {
                    return
                          AnimatedContainer(

                        duration: const Duration(milliseconds: 200),
                        transform: controller.isPressed.value
                            ? Matrix4.diagonal3Values(1.1, 1.1, 1.0)
                            : Matrix4.identity(),
                        curve: Curves.easeInOut,
                        child: GestureDetector(onVerticalDragEnd: (val){
                          if(0 > val.velocity.pixelsPerSecond.dy){
                            return;
                          }else{
                            controller.downCard(controller.indexCard.value);
                          }
                        },
                          child: CardView(
                            items: controller.dataCard[controller.indexCard.value]['data'],
                            index: index,
                          ),
                        ),
                      );



                },
              ),
            ),
          ),

        );
      },
    );
  }
}

class TextInformation extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextInformation({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
