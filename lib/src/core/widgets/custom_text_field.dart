import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.onChange,
    required this.controller,
    required this.maxLines,
    super.key,
  });

  final TextEditingController controller;
  final void Function(String value) onChange;
  final int maxLines;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return TextField(
      controller: controller,
      showCursor: true,
      maxLines: maxLines,
      style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal),
      onChanged: onChange,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        hintText: FlutterI18n.translate(context, 'type_here'),
        hintStyle:
            textTheme.bodySmall?.copyWith(color: colorScheme.onSecondary),
      ),
    );
  }
}
