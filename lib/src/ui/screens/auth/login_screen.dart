import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_structure/src/controllers/auth/login_controller.dart';
import 'package:flutter_getx_structure/src/ui/screens/auth/widget/custom_login_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GetBuilder<LoginController>(
              builder: (controller) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              Expanded(
                                child: AuthCard(
                                  onAppleSignIn: () {},
                                  onSignIn: (email, password) {},
                                  onForgotPassword: () {},
                                  onGoogleSignIn: () {},
                                  onGuestSignIn: () {},
                                  onSignUp: () {},
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                child: TermsSection(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // if (controller.isLoading)
                    //   Container(
                    //     color: Colors.black.withOpacity(0.5),
                    //     child: const Center(
                    //         child: SpinKitCircle(
                    //       color: AppColors.primary,
                    //       size: 40,
                    //     )),
                    //   ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
