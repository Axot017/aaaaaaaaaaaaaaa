import 'dart:io';

import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CashedLogo extends StatelessWidget {
  final String url;
  final bool showLocalImage;
  final File localImage;
  final double width;
  final double height;

  CashedLogo({this.url, this.width, this.height, this.localImage, this.showLocalImage: false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(16.0),
      child: AnimatedSwitcher(
        duration: AppAnimationInfo.IMAGE_ANIMATION_DURATION,
        switchInCurve: Curves.easeOutQuad,
        switchOutCurve: Curves.easeInQuad,
        child: localImage == null ? _networkImage : Image.file(localImage,
          width: width,
          height: height,
        ),
      ),
    );
  }

  Widget get _networkImage => url != null ? CachedNetworkImage(
    imageUrl: url,
    width: width,
    height: height,
    fadeInDuration: AppAnimationInfo.IMAGE_ANIMATION_DURATION,
    fadeInCurve: AppAnimationInfo.IMAGE_ANIMATION_CURVE,
    placeholder: (_, __) => _placeholder,
    errorWidget: (_, __, ___) => _placeholder,
  ) : _placeholder;

  Widget get _placeholder => Container(
    height: height,
    width: width,
    color: AppColors.ORANGE.withOpacity(0.1),
    child: Icon(Icons.image, color: AppColors.ORANGE,),
  );
}