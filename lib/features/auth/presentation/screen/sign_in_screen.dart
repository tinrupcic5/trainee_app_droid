import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/core/localization_extension.dart';
import 'package:trainee_app/core/route_generator.dart';
import 'package:trainee_app/core/style/style_extensions.dart';
import 'package:trainee_app/features/auth/presentation/util/utils.dart';
import 'package:trainee_app/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:trainee_app/features/auth/presentation/widget/password_visibilty_toggle.dart';
import 'package:trainee_app/features/common/presentation/widget/custom_snackbar.dart';
import 'package:trainee_app/features/common/presentation/widget/primary_button.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordObscure = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (_, state) {
      state.whenOrNull(
        unauthenticated: (error, shouldShow) {
          setState(() => _isLoading = false);
          if (shouldShow) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => CustomSnackBar.show(
                  context, context.localWrongEmailOrPassword),
            );
          }
        },
        loading: () => setState(() => _isLoading = true),
        authenticated: (user) {
          setState(() => _isLoading = true);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            RouteGenerator.setUserLoginToken(user);
            Navigator.of(context)
                .pushReplacementNamed(RouteGenerator.homeScreen);
          });
        },
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 120, horizontal: 60),
                      child: Hero(
                        tag: 'login_image',
                        child: Image(
                            image: AssetImage('assets/images/app_icon.png')),
                      ),
                    ),
                    Text(
                      context.localSignInTitle,
                      style: context.textStandard,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _userNameController,
                      label: context.localEmail,
                      textInputAction: TextInputAction.next,
                      validator: (value) => validateEmail(context, value),
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _passwordController,
                      label: context.localPassword,
                      isObscure: _isPasswordObscure,
                      validator: (value) => validatePassword(context, value),
                      suffixIcon: PasswordVisibilityToggle(
                        onTap: () => setState(
                            () => _isPasswordObscure = !_isPasswordObscure),
                        isPasswordObscure: _isPasswordObscure,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(RouteGenerator.resetScreen),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Text(context.localForgotPassword,
                              style: context.textStandard),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                      onPressed: _login,
                      isLoading: _isLoading,
                      text: context.localSignIn,
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.localDontHaveAccount,
                            style: context.textStandard),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: _redirectToRegisterScreen,
                          child: Text(
                            context.localCreateAccount,
                            style: context.textHighlightStandard,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (_formKey.currentState!.validate()) {
      print("username : ${_userNameController.text.trim()}");
      await ref.read(authNotifierProvider.notifier).login(
            _userNameController.text.trim(),
            _passwordController.text.trim(),
          );
    }
  }

  void _redirectToRegisterScreen() =>
      Navigator.of(context).pushNamed(RouteGenerator.signUpScreen);
}
