import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/constants/colors.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              SvgPicture.asset('lib/assets/icons/logo.svg'),
              const SizedBox(
                height: 10,
              ),
              const Text("Just Trivia",
                  style: TextStyle(color: Colors.white, fontSize: 32)),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 0.5,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SignInButton(
                padding: const EdgeInsets.all(6),
                Buttons.google,
                onPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              SignInButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                Buttons.facebookNew,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
