import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supportedLocalesProvider = Provider<List<Locale>>(
  (final ref) => [
    const Locale('en'),
    const Locale('de'),
  ],
);
