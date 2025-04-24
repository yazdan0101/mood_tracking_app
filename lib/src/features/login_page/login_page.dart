import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/core/entities/user.dart';
import 'package:mood_tracking_app/src/core/providers/auth_provider.dart';
import 'package:mood_tracking_app/src/core/providers/base_backend_url_provider.dart';
import 'package:mood_tracking_app/src/core/providers/user_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/vertical_gap_widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final colorScheme = theme.colorScheme;
    final labelStyle = textTheme.bodySmall;
    final auth = ref.watch(authProvider);
    ref.listen<AuthState>(authProvider, (final prev, final next) {
      if (next.status == AuthStatus.authenticated) {
        context.go('/');
      }
    });
    final textFieldTextStyle =
        textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FlutterI18n.translate(context, 'user_login'),
                  style: textTheme.bodyLarge?.copyWith(fontSize: 32),
                ),
                const VerticalGapWidget(),
                const VerticalGapWidget(),
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'username',
                            labelStyle: labelStyle,
                          ),
                          style: textFieldTextStyle,
                          onSaved: (final v) => _username = v!.trim(),
                          validator: (final v) =>
                              v!.isEmpty ? 'username_required' : null,
                        ),
                        const VerticalGapWidget(),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'password',
                            labelStyle: labelStyle,
                          ),
                          obscureText: true,
                          style: textFieldTextStyle,
                          onSaved: (final v) => _password = v!.trim(),
                          validator: (final v) =>
                              v!.isEmpty ? 'password_required' : null,
                        ),
                        const VerticalGapWidget(),
                        const VerticalGapWidget(),
                        const VerticalGapWidget(),
                        ElevatedButton.icon(
                          style: theme.elevatedButtonTheme.style?.copyWith(
                            minimumSize:
                                const WidgetStatePropertyAll(Size(250, 60)),
                          ),
                          icon: auth.status == AuthStatus.loading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: colorScheme.surface,
                                  ),
                                )
                              : Icon(
                                  Icons.login,
                                  color: colorScheme.surface,
                                ),
                          onPressed: auth.status != AuthStatus.loading
                              ? () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    final user = User(
                                      userName: _username,
                                      password: _password,
                                    );
                                    final backendBaseUrl =
                                        ref.read(baseBackendUrlProvider);
                                    await ref
                                        .read(authProvider.notifier)
                                        .login(user, backendBaseUrl)
                                        .then(
                                      (final _) {
                                        ref
                                            .read(userProvider.notifier)
                                            .updateUser(user);
                                      },
                                    );
                                  }
                                }
                              : null,
                          label: Text(
                            'login',
                            style: textTheme.bodyMedium
                                ?.copyWith(color: colorScheme.surface),
                          ),
                        ),
                        if (auth.status == AuthStatus.error)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              auth.error!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
