import 'package:flutter/material.dart';

import '../../core/colors.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    Key? key,
    this.onPressed,
    required this.label,
    required this.icon,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.secondary),
        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.button!.copyWith(color: AppColors.white),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      label: Text(label),
      icon: Icon(icon),
    );
  }
}
