import 'package:allinone/widgets/base_widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    required this.title,
    required this.child,
    this.enableDrawer = true,
    this.padding = const EdgeInsets.all(16.0),
    this.enableScroll = true,
    this.floatingIcon,
    this.floatingAction,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget child;
  final EdgeInsets padding;
  final bool enableDrawer;
  final IconData? floatingIcon;
  final VoidCallback? floatingAction;
  final bool enableScroll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: enableDrawer ? AppDrawer() : null,
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: floatingIcon != null
          ? FloatingActionButton(
              onPressed: floatingAction, child: Icon(floatingIcon))
          : null,
      body: enableScroll
          ? SingleChildScrollView(
              child: body,
            )
          : body,
    );
  }

  Widget get body => Padding(
        padding: padding,
        child: child,
      );
}
