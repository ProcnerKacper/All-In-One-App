import 'package:flutter/material.dart';

import '../models/days.dart';

class DaySwitcher extends StatelessWidget {
  final String? day;
  final Function? changeDay;
  DaySwitcher({this.day, this.changeDay});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => changeDay!('back'),
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            child: Text(
              Day[day!]!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            color: Colors.red,
            onPressed: () => changeDay!('forward'),
          ),
        ],
      ),
    );
  }
}
