import 'package:flutter/material.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_icon_container.dart';

List<Widget> appBarActions() => [
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
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      const CustomIconContainer(
        child: Icon(
          Icons.message_outlined,
          size: 40,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      const CustomIconContainer(
        child: Icon(
          Icons.date_range,
          size: 40,
        ),
      ),
    ];
