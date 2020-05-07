import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:aaaaaaaaaaaaaaa/styles/text_styles.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/buttons/gradient_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RateWidget extends StatelessWidget {
  final bool enableRating;
  final int score;
  final void Function(double) onScoreChange;
  final void Function(int) onScoreSubmit;
  final void Function() onEdit;

  RateWidget({
    this.enableRating,
    this.score: 0,
    this.onScoreChange,
    this.onEdit,
    this.onScoreSubmit
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppAnimationInfo.LIST_ANIMATION_DURATION,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: Container(
              height: 94,
              child: child,
            ),
          ),
        );
      },
      switchInCurve: Curves.easeInOutBack,
      switchOutCurve: Curves.easeInOutBack,
      child: enableRating ? _toRate : _alreadyRated,
    );
  }

  Widget get _alreadyRated => Column(
    key: ValueKey<bool>(enableRating),
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$score / 10',
            style: AppTextStyles.SCORE_STYLE,
          ),
          Icon(Icons.star,
            color: AppColors.RED,
            size: 30,
          )
        ],
      ),
      SizedBox(height: 12,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GradientRaisedButton(
            onClick: onEdit,
            text: 'Rate',
          ),
        ],
      )
    ],
  );

  Widget get _toRate => Column(
    children: <Widget>[
      SmoothStarRating(
        starCount: 10,
        rating: score?.toDouble() ?? 0,
        size: 30,
        color: AppColors.RED,
        borderColor: AppColors.RED,
        onRatingChanged: onScoreChange
      ),
      SizedBox(height: 12,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GradientRaisedButton(
            onClick: () => onScoreSubmit(score),
            text: 'Submit',
          ),
        ],
      )
    ],
  );
}