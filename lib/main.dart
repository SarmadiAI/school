import 'package:flutter/material.dart';
import 'package:school/screens/advance_quiz_setting.dart';
import 'package:school/screens/dashboard.dart';
import 'package:school/screens/log_in.dart';
import 'package:school/screens/question.dart';
import 'package:school/screens/quiz_setting.dart';
import 'package:school/screens/sign_up.dart';
import 'package:school/screens/welcome.dart';

void main() {
  runApp(const School());
}

class School extends StatelessWidget {
  const School({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Welcome.route,
      routes: {
        Welcome.route: (context) => const Welcome(),
        SignUp.route: (context) => const SignUp(),
        LogIn.route: (context) => const LogIn(),
        Dashboard.route: (context) => const Dashboard(),
        QuizSetting.route: (context) => const QuizSetting(),
        AdvanceQuizSetting.route: (context) => const AdvanceQuizSetting(),
        Question.route: (context) => const Question(),
      },
    );
  }
}
