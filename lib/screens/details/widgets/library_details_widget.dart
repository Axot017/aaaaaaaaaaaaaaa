import 'package:aaaaaaaaaaaaaaa/datasources/firebase.dart';
import 'package:aaaaaaaaaaaaaaa/injection/app_module.dart';
import 'package:aaaaaaaaaaaaaaa/models/library_record.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/widgets/detail_row.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/widgets/rate_widget.dart';
import 'package:aaaaaaaaaaaaaaa/styles/text_styles.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/buttons/gradient_raised_button.dart';
import 'package:flutter/material.dart';

class LibraryDetailsWidget extends StatefulWidget {
  final String recordKey;
  final LibraryRecord item;

  LibraryDetailsWidget({this.item, this.recordKey});

  @override
  State<StatefulWidget> createState() => LibraryDetailsWidgetState();
}

class LibraryDetailsWidgetState extends State<LibraryDetailsWidget> {
  int _currentScore;
  bool _enableRating;
  FirebaseUtil _firebaseUtil;

  @override
  void initState() {
    super.initState();
    _enableRating = widget.item.score == null;
    _currentScore = widget.item.score;
    _firebaseUtil = AppModule.injector.get();
  }

  @override
  void didUpdateWidget(LibraryDetailsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentScore = widget.item.score;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientRaisedButton(
          text: widget.item.viewed ? "Przywróć z historii" : "Dodaj do historii",
          onClick: () {
            _firebaseUtil.updateItem(widget.recordKey, widget.item
              ..viewed = !widget.item.viewed
              ..score = 0
            );
          },
        ),
        SizedBox(height: 16,),
        _title,
        SizedBox(height: 16,),
        _type,
        _rate,
        DetailRow('${widget.item.authorLabel}:', widget.item.author),
        DetailRow('Single/Multi:', widget.item.multiplayerLabel),
        DetailRow('Length:', widget.item.length),
        DetailRow('Seasons:', widget.item.seasons?.toString()),
        DetailRow('Pages:', widget.item.numberOfPages?.toString()),
        DetailRow('Platform:', widget.item.platform?.toString()),
      ],
    );
  }

  Widget get _title => Text(widget.item.title,
    style: AppTextStyles.TITLE_STYLE,
  );

  Widget get _type => widget.item.type != null ? Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Text(widget.item.type,
      style: AppTextStyles.SUBTITLE_STYLE,
    ),
  ) : Container();

  Widget get _rate {
    if (widget.item.viewed) {
      return RateWidget(
        enableRating: _enableRating,
        score: _currentScore,
        onEdit: onEdit,
        onScoreChange: onScoreChange,
        onScoreSubmit: onScoreSubmit,
      );
    } else {
      return Container();
    }
  }

  void onScoreChange(double score) {
    setState(() {
      _currentScore = score.floor();
    });
  }

  void onScoreSubmit(int score) {
    _firebaseUtil.updateItem(widget.recordKey, widget.item..score = _currentScore);
    setState(() {
      _enableRating = false;
    });
  }

  void onEdit() {
    setState(() {
      _enableRating = true;
    });
  }

}