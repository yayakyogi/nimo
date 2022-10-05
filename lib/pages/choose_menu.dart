import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/page_transition.dart';
import 'package:nimo/widgets/button_back.dart';
import 'package:nimo/widgets/button_submit.dart';

class ChooseMenu extends StatelessWidget {
  const ChooseMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pilih Menu',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonSubmit(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(widget: const ChooseMenu()),
                      );
                    },
                    title: 'Menu 1',
                  ),
                  ButtonSubmit(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(widget: const ChooseMenu()),
                      );
                    },
                    title: 'Menu 2',
                  ),
                  ButtonSubmit(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(widget: const ChooseMenu()),
                      );
                    },
                    title: 'Menu 3',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonSubmit(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(widget: const ChooseMenu()),
                      );
                    },
                    title: 'Menu 4',
                  ),
                  ButtonSubmit(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(widget: const ChooseMenu()),
                      );
                    },
                    title: 'Menu 5',
                  ),
                  ButtonSubmit(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(widget: const ChooseMenu()),
                      );
                    },
                    title: 'Menu 6',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonSubmit(
                    onPressed: () => Navigator.pop(context),
                    title: 'Kembali',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
