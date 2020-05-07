import 'dart:io';
import 'dart:ui';

import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/icons/animated_icons_switcher.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/cashed_logo.dart';
import 'package:flutter/material.dart';

class ItemDetailsHeader extends StatelessWidget {
  final File imageFile;
  final String imageUrl;
  final void Function() onImageClick;
  final IconData icon;
  final String imageHeroTag;
  final String iconHeroTag;
  final bool isInEditMode;

  ItemDetailsHeader({
    this.imageUrl,
    this.imageFile,
    this.onImageClick,
    this.icon,
    this.iconHeroTag,
    this.imageHeroTag,
    this.isInEditMode
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: imageHeroTag ?? 'image',
                child: CashedLogo(
                  width: 150,
                  height: 220,
                  url: imageUrl,
                  localImage: imageFile,
                ),
              ),
              Visibility(
                visible: isInEditMode,
                child: Positioned(
                  top: 1,
                  bottom: 1,
                  left: 1,
                  right: 1,
                  child: GestureDetector(
                    onTap: onImageClick,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Icon(Icons.edit,
                        size: 45,
                        color: AppColors.RED,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          Hero(
            tag: iconHeroTag ?? 'icon',
            child: AnimatedIconsSwitcher(
              icon: icon,
              iconSize: 175,
            ),
          )
        ],
      ),
    );
  }
}