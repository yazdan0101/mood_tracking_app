import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {this.resizeToAvoidBottomInset,
      required this.title,
      required this.body,
      super.key});

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
                  actions: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsetsDirectional.all(8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.green, Colors.lightGreen],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.diamond,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '300',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.message_outlined,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.date_range,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: body,
        ),
      );
}
