import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 2, // Pega 2/6 da tela
                  ),
                  Text(
                    "Que tal um quiz de pokémon?",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "Insira suas informações abaixo",
                  ),
                  Spacer(), // Pega 1/6 da Tela
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Nome completo",
                        fillColor: Color(0xFF1C2341),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        )),
                  ),
                  Spacer(), //Pega 1/6 da Tela
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text("Vamos começar!",
                          style: Theme.of(context).textTheme.button.copyWith(
                                color: Colors.black,
                              )),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ), //Pega 2/6 da tela
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
