import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/router/router.dart';

void main() {
  runApp(const ProviderScope(child: MoodTrackingApp()));
}

class MoodTrackingApp extends ConsumerWidget {
  const MoodTrackingApp({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      theme: ThemeData.from(colorScheme: lightColorScheme).copyWith(
        scaffoldBackgroundColor: AppColors.background,
        cardColor: AppColors.surface,
        dividerColor: AppColors.border,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(fontSize: 20, color: Colors.black),
              bodyMedium: const TextStyle(fontSize: 18, color: Colors.black),
              bodySmall: const TextStyle(fontSize: 16, color: Colors.black),
              labelLarge: const TextStyle(fontSize: 24, color: Colors.black),
            ),
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
    );
  }
}

class AppColors {
  static const Color background = Color(0xFFF9F6F4);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE3E0DE);
  static const Color textPrimary = Color(0xFF5A5650);
  static const Color textSecondary = Color(0xFF888676);

  static const Color primary = Color(0xFFA3C565);
  static const Color primaryLight = Color(0xFFD7E7BC);
  static const Color primaryDark = Color(0xFF7EA63E);

  static const Color secondary = Color(0xFFEB7E5A);
  static const Color secondaryLight = Color(0xFFF3C75A);
  static const Color secondaryDark = Color(0xFFD76E50);

  static const Color accentBlue = Color(0xFF84A4E8);
  static const Color accentLime = Color(0xFFDAE592);
  static const Color accentYellow = Color(0xFFF3C75A);

  static const Color error = Color(0xFFB00020);
  static const Color success = primary;
}

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: Colors.white,
  primaryContainer: AppColors.primaryLight,
  secondary: AppColors.secondary,
  onSecondary: Colors.white,
  secondaryContainer: AppColors.secondaryLight,
  surface: AppColors.surface,
  onSurface: AppColors.textPrimary,
  error: AppColors.error,
  onError: Colors.white,
);
