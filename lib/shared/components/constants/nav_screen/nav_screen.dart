import 'package:albausalah_app/view/guest/home_guest/home_guest.dart';
import 'package:albausalah_app/view/home/view/home_page.dart';
import 'package:albausalah_app/view/stores/view/stores_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../view/account/view/account.dart';
import '../../../../view/chat/chat.dart';
import '../../../../view/guest/guest_store_page/stores/guest_stores_page.dart';

class BottomNavBarModel {
  NavBarItem navBarItem;
  IconData icon;
  String name;
  Widget widget;

  BottomNavBarModel({
    required this.widget,
    required this.navBarItem,
    required this.name,
    required this.icon,
  });
}

enum NavBarItem {
  home,
  chat,
  stores,
  account,
}

List navScreensEnglish = <BottomNavBarModel>[
  BottomNavBarModel(
    name: 'Home'.tr,
    icon: Icons.home,
    navBarItem: NavBarItem.home,
    widget: const HomePage(),
  ),
  BottomNavBarModel(
    name: 'Chat'.tr,
    icon: CupertinoIcons.chat_bubble_text_fill,
    navBarItem: NavBarItem.chat,
    widget: const Chat(),
  ),
  BottomNavBarModel(
    name: 'Stores'.tr,
    icon: Icons.storefront,
    navBarItem: NavBarItem.stores,
    widget: const Stores(),
  ),
  BottomNavBarModel(
    name: 'Account'.tr,
    icon: Icons.person,
    navBarItem: NavBarItem.account,
    widget: const AccountPage(),
  ),
];

List navScreensArabic = <BottomNavBarModel>[
  BottomNavBarModel(
    name: 'الرئيسية'.tr,
    icon: Icons.home,
    navBarItem: NavBarItem.home,
    widget: const HomePage(),
  ),
  BottomNavBarModel(
    name: 'الدردشات'.tr,
    icon: CupertinoIcons.chat_bubble_text_fill,
    navBarItem: NavBarItem.chat,
    widget: const Chat(),
  ),
  BottomNavBarModel(
    name: 'المتاجر'.tr,
    icon: Icons.storefront,
    navBarItem: NavBarItem.stores,
    widget: const Stores(),
  ),
  BottomNavBarModel(
    name: 'حسابي'.tr,
    icon: Icons.person,
    navBarItem: NavBarItem.account,
    widget: const AccountPage(),
  ),
];

List guestNavScreens = <BottomNavBarModel>[
  BottomNavBarModel(
    name: 'Home'.tr,
    icon: Icons.home,
    navBarItem: NavBarItem.home,
    widget: const GuestHomePage(),
  ),
  BottomNavBarModel(
    name: 'Stores'.tr,
    icon: Icons.storefront,
    navBarItem: NavBarItem.stores,
    widget: const GuestStoresPage(),
  ),
];
