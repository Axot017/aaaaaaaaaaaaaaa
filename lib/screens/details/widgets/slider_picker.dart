import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:aaaaaaaaaaaaaaa/styles/text_styles.dart';
import 'package:flutter/material.dart';

class SliderPicker extends StatefulWidget {
  final double initValue;
  final void Function(String) onChange;
  final String title;
  final String Function(double) valueParser;

  SliderPicker({
    this.onChange,
    this.initValue: 0.0,
    this.title,
    this.valueParser,
    Key key
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => SliderPickerState();
}

class SliderPickerState extends State<SliderPicker> {
  double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(widget.title,
                style: AppTextStyles.DETAILS_LABEL_STYLE,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(widget.valueParser(_currentValue),
                style: AppTextStyles.DETAILS_VALUE_STYLE,
              ),
            )
          ],
        ),
        Slider(
          value: _currentValue,
          activeColor: AppColors.RED,
          onChanged: (value) {
            setState(() {
              _currentValue = value;
            });
            widget.onChange(widget.valueParser(_currentValue));
          },
        )
      ],
    );
  }

}