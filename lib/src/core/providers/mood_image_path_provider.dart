import 'package:flutter_riverpod/flutter_riverpod.dart';

final moodImagesPathListProvider = Provider<List<String>>(
  (final ref) => [
    'mood_sad.svg',
    'mood_angry.svg',
    'mood_okay.svg',
    'mood_good.svg',
    'mood_happy.svg',
  ],
);
