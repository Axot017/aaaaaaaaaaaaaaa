import 'package:aaaaaaaaaaaaaaa/models/library_record.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/library_item_details_screen.dart';
import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:aaaaaaaaaaaaaaa/styles/text_styles.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/cashed_logo.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/icons/fade_icon.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class LibraryItemCard extends StatelessWidget {
  final String recordKey;
  final LibraryRecord item;

  LibraryItemCard({this.recordKey, this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LibraryItemDetailsScreen(item: item, recordKey: recordKey,))),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              right: 8,
              child: Hero(
                tag: '${recordKey}icon',
                child: FadeIcon(
                  icon: item.icon,
                  iconSize: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: Hero(
                      tag: '${recordKey}image',
                      child: CashedLogo(
                        height: 70,
                        width: 50,
                        url: item.imageUrl,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(width: 16,),
                  ),
                  Expanded(
                    flex: 1,
                    child: _titleColumn,
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget get _titleColumn => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(item.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.CARD_TITLE,
      ),
      SizedBox(
        height: 12,
      ),
      _subtitleBasedOnType
    ],
  );

  Widget get _subtitleBasedOnType => item.viewed ? SmoothStarRating(
    starCount: 10,
    color: AppColors.RED,
    borderColor: AppColors.RED,
    size: 14,
    rating: item.score?.toDouble() ?? 0,
  ) : Text(item.type ?? '',
    style: AppTextStyles.CARD_SUBTITLE,
  );
}