import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nimo/pages/rule.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/page_transition.dart';
import 'package:nimo/widgets/background_transparent.dart';
import 'package:nimo/widgets/button_submit.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
  }

  @override
  Widget build(BuildContext context) {
    // Input decoration
    InputDecoration inputDecoration(hint) {
      return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        filled: true,
        fillColor: whiteColor,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14,
          color: primaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: secondaryColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: secondaryColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

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
                margin: const EdgeInsets.only(left: 10, top: 10),
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
              Text(
                'Username',
                style: TextStyle(
                  fontWeight: medium,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: username,
                decoration: inputDecoration('Masukkan username anda'),
              ),
              const SizedBox(height: 20),
              Text(
                'Password',
                style: TextStyle(
                  fontWeight: medium,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: password,
                obscureText: true,
                decoration: inputDecoration('Masukkan password anda'),
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
                onPressed: () {},
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
