import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/background_transparent.dart';
import 'package:nimo/widgets/button_submit.dart';
import 'package:nimo/widgets/form_input.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController campusController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController studyProgramController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                'Register',
                style: fontPermanentMarker.copyWith(
                  fontWeight: semibold,
                  fontSize: 32,
                  color: whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Name
            FormInput(
              label: 'Nama',
              hint: 'Masukkan nama',
              controller: nameController,
            ),
            const SizedBox(height: 20),
            // Place of Birth
            FormInput(
              label: 'Tempat Lahir',
              hint: 'Masukkan tempat lahir',
              controller: placeOfBirthController,
            ),
            const SizedBox(height: 20),
            // Date of Birth
            FormInput(
              label: 'Tangal Lahir',
              hint: 'Ex: 20 Juli 1998',
              controller: placeOfBirthController,
            ),
            const SizedBox(height: 20),
            // Campus
            FormInput(
              label: 'Perguruan Tinggi',
              hint: 'Masukkan PT asal',
              controller: campusController,
            ),
            const SizedBox(height: 20),
            // Faculty
            FormInput(
              label: 'Fakultas',
              hint: 'Masukkan Fakultas',
              controller: facultyController,
            ),
            const SizedBox(height: 20),
            // Study Program
            FormInput(
              label: 'Program Studi',
              hint: 'Masukkan Program Studi',
              controller: studyProgramController,
            ),
            const SizedBox(height: 20),
            // Username
            FormInput(
              label: 'Username',
              hint: 'Masukkan username anda',
              controller: usernameController,
            ),
            const SizedBox(height: 20),
            // Password
            FormInput(
              label: 'Password',
              hint: 'Masukkan password anda',
              controller: passwordController,
              isFormPassword: true,
            ),
            const SizedBox(height: 30),
            ButtonSubmit(
              onPressed: () {},
              title: 'REGISTER',
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Login',
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

  @override
  Widget build(BuildContext context) {
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
