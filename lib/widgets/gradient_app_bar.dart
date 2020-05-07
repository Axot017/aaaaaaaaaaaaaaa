import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget getGradientAppBar({
  Gradient gradient: AppColors.TOP_BAR_GRADIENT,
  String title: '',
  TabBar tabBar,
  List<Widget> actions
}) => AppBar(
  title: tabBar ?? Text(title),
  centerTitle: true,
  actions: actions,
  flexibleSpace: Container(
    decoration: BoxDecoration(
        gradient: gradient
    ),
  ),
);