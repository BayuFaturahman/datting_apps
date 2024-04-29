

import 'package:datting_app/app/component/colors.dart';
import 'package:datting_app/app/component/icons.dart';
import 'package:datting_app/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(
            () => IndexedStack(
          index: tabIndex.value,
          children: const [
            HomeView(),
            HomeView(),
            HomeView(),
            HomeView(),
            HomeView(),
          ],
        ),
      ),
      bottomNavigationBar: Stack(children: [
        Obx(
              () => Container(
            decoration: const BoxDecoration(
                color: BaseColor.primary

            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    border: Border(top:  BorderSide(color: Color(0Xff595959)))
                ),


                child: BottomNavigationBar(
                    onTap: (index) {
                      changeTabIndex(index);
                    },
                    backgroundColor: Colors.transparent,
                    currentIndex: tabIndex.value,
                    showUnselectedLabels: true,
                    showSelectedLabels: true,
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: BaseColor.seccondary,
                    selectedLabelStyle: const TextStyle(
                        color: BaseColor.seccondary,
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                    unselectedLabelStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    type: BottomNavigationBarType.fixed,
                    items: [
                      bottomNavigationBarItem(
                          icon: Container(
                            child: Image.asset('assets/icons/Bottom_GNB.png'),
                          ),
                          label: ''),
                      bottomNavigationBarItem(
                          icon: Container(
                            child: Image.asset('assets/icons/Bottom_GNB (1).png'),
                          ),
                          label: ''),
                      bottomNavigationBarItem(
                        icon: Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          height: 55,
                          decoration: const BoxDecoration(

                          ),

                        ),
                        label: '',
                      ),
                      bottomNavigationBarItem(
                          icon: Container(
                            child: Image.asset('assets/icons/Bottom_GNB (2).png'),
                          ),
                          label: ''),
                      bottomNavigationBarItem(
                          icon: Container(
                            child: Image.asset('assets/icons/Bottom_GNB (3).png'),
                          ),
                          label: ''),
                    ]),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: MediaQuery.of(context).size.width / 2 - 36 ,
          child: Container(

            width: 75,
            height: 75,

            decoration: const BoxDecoration(
              color: BaseColor.primary,
              shape: BoxShape.circle,
              image: DecorationImage(

                  fit: BoxFit.cover,
                  image: AssetImage('assets/icons/ic_start_menu.png')),
              border: Border(top: BorderSide(color: Color(0Xff595959))),

            ),
          ),
        ),
      ]),
    );
  }

  final TextStyle unselectedLabelStyle = const TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: BaseColor.seccondary, fontWeight: FontWeight.w700, fontSize: 18);

  bottomNavigationBarItem({required Widget icon, String? label}) {
    return BottomNavigationBarItem(icon: icon, label: label);
  }

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}

