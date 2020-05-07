import 'package:aaaaaaaaaaaaaaa/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  DetailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return value != null ? Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(label,
              style: AppTextStyles.DETAILS_LABEL_STYLE,
            ),
          ),
          Expanded(
            child: Text(value,
              style: AppTextStyles.DETAILS_VALUE_STYLE,
            ),
          ),
        ],
      ),
    ) : Container();
  }
}