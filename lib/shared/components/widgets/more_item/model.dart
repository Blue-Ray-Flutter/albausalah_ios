import 'package:flutter/material.dart';

class MoreModel {
  MoreItems moreItems;
  String title;
  IconData icon;
  void Function() onTap;

  MoreModel({
    required this.moreItems,
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

enum MoreItems {
  language,
  aboutUs,
  howToRegister,
  contactUs,
  fqa,
  purchaseMethod,
  termsConditions,
  privacyPolicy,
  logout
}
