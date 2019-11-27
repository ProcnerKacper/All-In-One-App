import 'package:flutter/material.dart';

class RoundedCheckbox extends StatefulWidget {
  final bool value;
  final Function onChange;
  final Color color;
  final double size;

  RoundedCheckbox(
      {@required this.value,
      @required this.onChange,
      this.color = Colors.blue,
      this.size = 20.0});

  @override
  _RoundedCheckboxState createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChange(!widget.value),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: widget.color, width: 2),
            color: widget.value ? widget.color : Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: widget.value
              ? Icon(
                  Icons.check,
                  size: widget.size,
                  color: Colors.white,
                )
              : Container(
                  height: widget.size,
                  width: widget.size,
                ),
        ),
      ),
    );
  }
}
