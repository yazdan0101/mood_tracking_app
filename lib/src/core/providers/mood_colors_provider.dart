import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final moodColorsProvider = Provider<List<Color>>(
  (final ref) => [
    const Color(0xFFEB7E5A), // Sad
    const Color(0xFFF3C75A), // Angry
    const Color(0xFF84A4E8), // Neutral
    const Color(0xFFDAE592), // Happy
    const Color(0xFFA3C565), // Very Happy
  ],
);
