import 'package:flutter/material.dart';

class MultiplayerWidget extends StatefulWidget {
  final bool initialData;
  final void Function(bool) onChange;

  MultiplayerWidget({this.onChange, this.initialData: false});

  @override
  State<StatefulWidget> createState() => MultiplayerWidgetState();
}

class MultiplayerWidgetState extends State<MultiplayerWidget> {
  bool _isMultiplayer;

  @override
  void initState() {
    super.initState();
    _isMultiplayer = widget.initialData;
    widget.onChange(widget.initialData);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<bool>(
          title: const Text('Singleplayer'),
          value: false,
          groupValue: _isMultiplayer,
          onChanged: _onChange,
        ),
        RadioListTile<bool>(
          title: const Text('Multiplayer'),
          value: true,
          groupValue: _isMultiplayer,
          onChanged: _onChange,
        )
      ],
    );
  }

  void _onChange(bool isMultiplayer) {
    setState(() {
      _isMultiplayer = isMultiplayer;
    });
    widget.onChange(isMultiplayer);
  }

}