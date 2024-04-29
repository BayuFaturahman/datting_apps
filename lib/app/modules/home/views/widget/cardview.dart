import 'package:datting_app/app/component/colors.dart';
import 'package:datting_app/app/component/icons.dart';
import 'package:datting_app/app/modules/home/controllers/home_controller.dart';
import 'package:datting_app/app/modules/home/views/widget/views_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CardView extends StatelessWidget {
  const CardView({
    super.key,
    required this.items,
    required this.index,
  });

  final items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(children: [
            // Text(items['data']['images'].toString()),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                image: DecorationImage(
                  image:NetworkImage(items['images'][index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.dataCard[controller.indexCard.value]['data']['images'].length, (index) {
                        return GestureDetector(
                          onTap: () => controller.carouselController
                              .animateToPage(index), // Klik untuk berpindah
                          child: Obx(
                            () => Container(
                              width: 50.0,
                              height: 5.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100)),
                                  color: controller.current.value == index
                                      ? BaseColor.seccondary
                                      : BaseColor.border),
                            ),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StarPopularity(
                                      icon: BaseIcons.homestar,
                                      views: items['likeCount'].toString(),
                                      width: 80,
                                      height: 30,
                                      backgroundcolor:
                                          const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          items['name'],
                                          style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          items['age'].toString(),
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    if (items['tags'] != null)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // StarPopularity(
                                          //   icon: BaseIcons.emoteHeart,
                                          //   views: '진지한 연애를 찾는 중',
                                          //   width: 157,
                                          //   height: 41,
                                          //   backgroundcolor:
                                          //       BaseColor.pinkTransparent,
                                          //   bodercolor: BaseColor.seccondary,
                                          //   padding: const EdgeInsets.all(2),
                                          // ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              StarPopularity(
                                                icon: BaseIcons.emoteSmoke,
                                                views: items['tags'][0],
                                                height: 41,

                                                backgroundcolor:
                                                    BaseColor.primary,
                                                bodercolor: BaseColor.border,
                                                padding:
                                                    const EdgeInsets.symmetric(horizontal: 6),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              StarPopularity(
                                                icon: const SizedBox(),
                                                views: items['tags'][1],
                                                height: 41,
                                                backgroundcolor:
                                                    BaseColor.primary,
                                                bodercolor: BaseColor.border,
                                                padding:
                                                const EdgeInsets.symmetric(horizontal: 6),

                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),


                                          Row(
                                            children: [
                                              StarPopularity(
                                                icon: BaseIcons.emoteHand,
                                                views:items['tags'][3],
                                                width: 100,
                                                height: 41,
                                                backgroundcolor:
                                                    BaseColor.primary,
                                                bodercolor: BaseColor.border,
                                                padding:
                                                    const EdgeInsets.all(2),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),

                                              StarPopularity(
                                                icon: BaseIcons.emoteMuscle,
                                                views:items['tags'][2],
                                                width: 100,
                                                height: 41,
                                                backgroundcolor: BaseColor.primary,
                                                bodercolor: BaseColor.border,
                                                padding: const EdgeInsets.all(2),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    Text(
                                      items['description'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ],
                                ),
                              ),
                              BaseIcons.heart,
                            ],
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(1),
                      blurRadius: 70,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
