import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    required this.title,
    required this.value,
    required this.onChanged,
    required this.icon,
  });

  final String title;
  final Icon icon;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      secondary: icon,
    );
  }
}
