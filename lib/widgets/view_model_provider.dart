import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends ChangeNotifier?> extends StatelessWidget {
  const ViewModelProvider({
    required this.child,
    required this.create,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Create<T> create;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: create,
      child: child,
    );
  }
}
