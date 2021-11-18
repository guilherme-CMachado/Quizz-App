import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class Options extends StatelessWidget {
  const Options({
    Key key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getRingColor() {
            if (qnController.isAnswerd) {
              if (index == qnController.correctAns) {
                return kGreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getRightIcon() {
            return getRingColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(
                  color: getRingColor(),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1} $text',
                    style: TextStyle(
                      color: getRingColor(),
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getRingColor() == kGrayColor
                          ? Colors.transparent
                          : getRingColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getRingColor()),
                    ),
                    child: getRingColor() == kGrayColor
                        ? null
                        : Icon(
                            getRightIcon(),
                            size: 16,
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
