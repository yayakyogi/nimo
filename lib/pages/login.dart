

import 'package:flutter/material.dart';
import 'package:nimo/pages/register.dart';
import 'package:nimo/pages/rule.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/page_transition.dart';
import 'package:nimo/widgets/background_transparent.dart';
import 'package:nimo/widgets/button_submit.dart';
import 'package:nimo/widgets/form_input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Container login
    Widget containerLogin() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  'Login',
                  style: fontPermanentMarker.copyWith(
                    fontWeight: semibold,
                    fontSize: 32,
                    color: whiteColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FormInput(
                label: 'Username',
                hint: 'Masukkan username anda',
                controller: usernameController,
              ),
              const SizedBox(height: 20),
              FormInput(
                label: 'Password',
                hint: 'Masukkan password anda',
                controller: passwordController,
                isFormPassword: true,
              ),
              const SizedBox(height: 30),
              ButtonSubmit(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(widget: const Rule()),
                  );
                },
                title: 'LOGIN',
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(widget: const Register()),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteColor,
                    fontWeight: semibold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(
          children: [
            const BackgroundTransparent(),
            containerLogin(),
          ],
        ),
      ),
    );
  }
}
