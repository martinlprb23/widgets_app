import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: "Botones",
      subTitle: "Varios botones en flutter",
      link: "/buttons",
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: "Tarjetas",
      subTitle: "Contenedores estilizados",
      link: "/cards",
      icon: Icons.credit_card),
  MenuItem(
      title: "Counter",
      subTitle: "Counter example",
      link: "/counter",
      icon: Icons.add),
  MenuItem(
      title: "Progress Indicators",
      subTitle: "Generales y controlados",
      link: "/progress",
      icon: Icons.refresh_rounded),
  MenuItem(
      title: "Snackbars",
      subTitle: "Snackbars and dialogs",
      link: "/snackbars",
      icon: Icons.message),
  MenuItem(
      title: "Animated container",
      subTitle: "Stateful widget animated",
      link: "/animated",
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: "Ui Controls + Tiles",
      subTitle: "Ui controls in flutter",
      link: "/ui-controls",
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: "Introduction",
      subTitle: "Tutorial app",
      link: "/tutorial",
      icon: Icons.accessibility),
  MenuItem(
      title: "Infinite Scroll and Pull",
      subTitle: "Infinite list and pull to refresh",
      link: "/infinite",
      icon: Icons.list_alt_rounded),
];
