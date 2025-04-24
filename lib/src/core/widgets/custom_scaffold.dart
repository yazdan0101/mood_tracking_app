import 'package:flutter/material.dart';
import 'package:mood_tracking_app/src/core/widgets/app_bar_actions.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.title,
    required this.body,
    this.resizeToAvoidBottomInset,
    super.key,
  });

  final Widget body;
  final Text? title;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Card(
            margin: EdgeInsets.zero,
            surfaceTintColor: Colors.transparent,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: AppBar(
                  surfaceTintColor: Colors.transparent,
                  title: title,
                  actions: appBarActions(),
                ),
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (final context, final constraints) {
            final maxWidth = constraints.maxWidth;
            if (maxWidth < 600) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: body,
              );
            } else if (maxWidth < 1024) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 64, vertical: 20),
                child: body,
              );
            } else if (maxWidth < 1440) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 128, vertical: 20),
                child: body,
              );
            }
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 256, vertical: 20),
              child: body,
            );
          },
        ),
      );
}
