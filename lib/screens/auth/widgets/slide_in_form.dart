import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:aaaaaaaaaaaaaaa/styles/shadows.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/buttons/floating_gradient_icon_button.dart';
import 'package:flutter/material.dart';

class SlideInForm extends StatelessWidget {
  final List<Widget> textFields;
  final IconData buttonIcon;
  final void Function() onClick;

  SlideInForm({this.textFields, this.onClick, this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: MediaQuery.of(context).size.width,
      child: Stack(
      alignment: Alignment.centerLeft,
        children: <Widget>[
          _card,
          _button
        ],
      ),
    );
  }

  Widget get _button => Positioned(
    top: 0,
    bottom: 0,
    right: 32,
    child: SizedBox(
      height: 52,
      width: 52,
      child: FloatingGradientIconButton(
        onClick: onClick,
        icon: buttonIcon,
      ),
    ),
  );

  Widget get _card => Positioned(
    left: 0,
    right: 64,
    child: Container(
      decoration: _shadowDecoration,
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: Container(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          color: AppColors.WHITE,
          child: Column(
            children: _cardContent,
          ),
        ),
      ),
    ),
  );
  
  BorderRadius get _borderRadius => BorderRadius.only(
    topRight: const Radius.circular(2137),
    bottomRight: const Radius.circular(2137),
  );

  BoxDecoration get _shadowDecoration => BoxDecoration(
    borderRadius: _borderRadius,
    boxShadow: AppShadows.CARD_SHADOW
  );

  List<Widget> get _cardContent => List<Widget>.generate((textFields.length * 2) - 1, (index) {
    if (index % 2 == 0) {
      return textFields[(index / 2).floor()];
    } else {
      return Divider(
        color: AppColors.BACKGROUND_COLOR,
        thickness: 2.0,
      );
    }
  });

}