import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:noteydho/config/router.dart';
import 'package:noteydho/utils/assets/icons.dart';
import 'package:noteydho/utils/assets/images.dart';
import 'package:noteydho/utils/consts/colors.dart';
import 'package:noteydho/utils/consts/consts.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  Future<void> signInWithGoogle() async {
    try {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      // Sign in with Google
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);

      // Check if the sign-in was successful
      if (userCredential.user != null) {
        // Navigate to the home page
        context.go(AppRouter.home);
      }
    } catch (e) {
      // Handle errors (e.g., display an error message)
      print('Sign-in failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-in failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.freshMintGreen,
                AppColors.lightGray,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                height: 100,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome to ",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 30,
                          ),
                    ),
                    TextSpan(
                      text: "Noteydho",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 42,
                          ),
                    ),
                  ],
                ),
              ),
              Text(
                "Simplify note-taking and supercharge your study sessions with AI. Noteydho makes learning easier and more effective!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: Consts.margin25,
                ),
                padding: const EdgeInsets.all(Consts.padding10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Consts.radius10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: TextButton.icon(
                  onPressed: () {
                    signInWithGoogle();
                  },
                  label: Text(
                    "Continue with Google",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  icon: SvgPicture.asset(
                    AppIcons.google,
                    height: 25,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By continuing, you agree to the ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "Terms & Conditions",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.blue.shade900,
                          ),
                    ),
                    TextSpan(
                      text: " and ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.blue.shade900,
                          ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
