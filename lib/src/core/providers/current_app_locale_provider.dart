import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentAppLocaleNotifier extends StateNotifier<Locale> {
  CurrentAppLocaleNotifier() : super(const Locale('de'));

  void changeLocale(final Locale locale) {
    state = locale;
  }
}

final currentAppLocaleProvider =
    StateNotifierProvider<CurrentAppLocaleNotifier, Locale>(
        (final ref) => CurrentAppLocaleNotifier());
