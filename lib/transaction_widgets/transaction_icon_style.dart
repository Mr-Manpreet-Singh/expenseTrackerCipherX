import 'package:flutter/material.dart';

// Transaction Card Icon Decoration

Map<String, Object> decorateMyIcon(String category) {
  final Map<String, Object> iconDecoration;

  if (category == 'Subscriptions') {
    iconDecoration = {
      'icon': Icons.receipt_long,
      'bgColor': const Color.fromARGB(197, 200, 182, 233),
      'iconColor': const Color.fromARGB(255, 164, 117, 252)
    };
  } else if (category == 'Shopping') {
    iconDecoration = {
      'icon': Icons.card_travel,
      'bgColor': const Color(0xFFFCEED3),
      'iconColor': const Color.fromARGB(255, 220, 171, 73)
    };
  } else if (category == 'Food') {
    iconDecoration = {
      'icon': Icons.restaurant,
      'bgColor': const Color(0xFFFDD4D7),
      'iconColor': const Color.fromARGB(255, 203, 100, 107)
    };
  } else if (category == 'Travel') {
    iconDecoration = {
      'icon': Icons.commute_rounded,
      'bgColor': const Color(0xFFF1F1FA),
      'iconColor': const Color.fromARGB(255, 93, 93, 234)
    };
  } else {
    iconDecoration = {
      'icon': Icons.error,
      'bgColor': const Color.fromARGB(255, 242, 242, 244),
      'iconColor': const Color.fromARGB(255, 229, 15, 25)
    };
  }
  return iconDecoration;
}
