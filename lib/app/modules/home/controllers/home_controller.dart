import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CarouselController carouselController = CarouselController();

  RxInt current = 0.obs;
  RxInt indexCard = 0.obs;
  RxList dataCard = [].obs;

   RxBool isPressed = false.obs;
   RxBool isLike = false.obs;
   RxBool isLoading = false.obs;


  @override
  void onInit() async {
    readData();
    super.onInit();
  }

  void readData() async {
    isLoading.value =true;
    List<dynamic> dataList = [];

    final DatabaseReference dbRef = FirebaseDatabase.instance.ref('');
    DataSnapshot snapshot = await dbRef.get();
    if (snapshot.exists) {
      for (DataSnapshot child in snapshot.children) {
        dataList.add(child.value);
      }
      dataCard.value.add({"name:":"banana","data":dataList[0]['banana']});
      dataCard.value.add({"name:":"apple","data":dataList[0]['apple']});
    }

    isLoading.value =false;

  }


  void downCard(value)async{
    isLoading.value = true;
    dataCard.removeAt(value);
    isLoading.value = false;
  }

  List dataDummy = [
    {
      'image': 'assets/img/person1.png',
      'name': '잭과분홍콩나물',
      'age': '25',
      'desc': '서울 . 2km 거리에 있음',
    },
    {
      'image': 'assets/img/person2.png',
      'name': '잭과분홍콩나물',
      'age': '25',
      'desc':
          '서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다',
    },
    {
      'image': 'assets/img/person3.png',
      'name': '잭과분홍콩나물',
      'age': '25',
      'desc': '',
    },
    {
      'image': 'assets/img/person4.png',
      'name': '잭과분홍콩나물',
      'age': '25',
      'desc': '',
    },
    {
      'image': 'assets/img/person5.png',
      'name': '잭과분홍콩나물',
      'age': '25',
      'desc': '',
    },
  ];
}

