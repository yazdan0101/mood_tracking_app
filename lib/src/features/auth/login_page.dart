import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/core/providers/auth_provider.dart';

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
    const gap20 = SizedBox(
      height: 20,
    );
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
                const Text('User Login'),
                gap20,
                gap20,
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
                          decoration: InputDecoration(
                            labelText: 'username',
                            labelStyle: labelStyle,
                          ),
                          style: textFieldTextStyle,
                          onSaved: (final v) => _username = v!.trim(),
                          validator: (final v) =>
                              v!.isEmpty ? 'username_required' : null,
                        ),
                        gap20,
                        TextFormField(
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
                        gap20,
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.login,
                            color: colorScheme.surface,
                          ),
                          style: ButtonStyle(
                            padding: const WidgetStatePropertyAll<
                                EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 16),
                            ),
                            backgroundColor: WidgetStatePropertyAll<Color>(
                                colorScheme.primary),
                            foregroundColor: WidgetStatePropertyAll<Color>(
                                colorScheme.surface),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await ref
                                  .read(authProvider.notifier)
                                  .login(_username, _password);
                            }
                          },
                          label: const Text('login'),
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
