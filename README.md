# Mood Tracker Flutter App

This Flutter application is the frontend for the Mood Tracker project, consuming a Symfony backend
API to allow users to log in and record daily mood entries with additional context.

---

## Features

- **User Login** via JWT-secured Symfony API
- **Mood Selection**: choose from a row of moods on the home screen
- **Multi-step Entry**: record date/time, feelings, sleep quality, activities, best part of the day,
  and an optional note
- **Success Confirmation**: navigate to a success screen after submission
- **Internationalization**: German and English translations via `flutter_localizations` and
  generated ARB files
- **Riverpod** for state management & dependency injection
- **go_router** for navigation

---

## Setup & Installation

1. **Flutter & Dart SDK**
    - Ensure you have Flutter 3.x+
      installed: [Flutter install guide](https://flutter.dev/docs/get-started/install)

2. **Clone the repository**
   ```bash
   git clone https://github.com/yazdan0101/mood-tracking-app.git
   cd mood-tracking-app
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Generate code**
    - Generate Riverpod providers, Freezed models, and `go_router` routes:
      ```bash
      dart run build_runner build --delete-conflicting-outputs
      ```

5. **Android cleartext policy**
    - Ensure `android/app/src/main/AndroidManifest.xml` includes:
      ```xml
      <application
          android:usesCleartextTraffic="true"
          android:networkSecurityConfig="@xml/network_security_config">
      ```
    - And `res/xml/network_security_config.xml` permits HTTP to `10.0.2.2` and `127.0.0.1`.

---

## Running the App

- **Android emulator**:
  ```bash
  flutter run -d emulator-5554
  ```

- **iOS Simulator**:
  ```bash
  flutter run -d ios
  ```

- **Web**:
  ```bash
  flutter run -d chrome
  ```

---

## Test Credentials

Use these credentials to log in and test functionality:

- **Username:** `psuser`
- **Password:** `pspass`
---
### Third‑Party Packages

Besides go_router and flutter_riverpod, this Flutter client uses:

**riverpod_annotation**: Enables code generation of Riverpod providers, reducing boilerplate and improving type safety.

**go_router_builder**: Generates strongly‑typed route classes and helpers for go_router, avoiding string‑based navigation errors.

**flutter_svg**: Renders SVG assets (the mood icons) sharply at any size without rasterization artifacts.

**http**: A simple, composable HTTP client for making REST calls to the Symfony backend.

**freezed_annotation & freezed**: Immutable data classes with copyWith, equals, and sealed unions to model API payloads safely.

**json_annotation & json_serializable**: Auto‑generate toJson/fromJson serialization code for the Freezed entities.

**flutter_i18n**: Manages translations and localization for German and English UI text.

**flutter_localizations**: Enables Flutter’s built‑in internationalization support, required by flutter_i18n.

Dev Dependencies

**flutter_lints**: Provides a recommended set of lints to enforce consistent code style.

**build_runner**: Drives code generation tasks (Freezed, Riverpod, JSON Serializable).

**riverpod_generator**: Generates Riverpod provider boilerplate.

**json_serializable**: Generates JSON serialization logic for annotated classes

---
Built with ❤️ using Flutter, Riverpod, and go_router.

