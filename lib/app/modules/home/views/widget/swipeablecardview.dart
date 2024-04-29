import 'package:datting_app/app/modules/home/views/widget/cardview.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'dart:async';

class SwipeableCardView extends StatelessWidget {
  final Map<String, dynamic> items; // Data untuk card
  final int index; // Indeks card
  final RxBool isPressed = false.obs; // Untuk melacak tekanan lama

  SwipeableCardView({
    Key? key,
    required this.items,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        isPressed.value = true;

        Timer(Duration(seconds: 2), () {
          isPressed.value = false;
        });
      },
      onHorizontalDragEnd: (details) {
        if (isPressed.value) {
          if (details.primaryVelocity! < 0) {
            print('Digeser ke kiri');
          }
          if (details.primaryVelocity! > 0) {
            print('Digeser ke kanan');
          }
        }
      },
      child: Obx(
        () => AnimatedContainer(
          duration: Duration(milliseconds: 200), // Durasi animasi
          transform: isPressed.value
              ? Matrix4.diagonal3Values(1.1, 1.1, 1.1) // Memperbesar sedikit
              : Matrix4.identity(),
          curve: Curves.easeInOut,
          child: CardView(
            items: items, // Data untuk card
            index: index,
          ),
        ),
      ),
    );
  }
}
