import 'package:flutter/material.dart';
import 'package:quiz_error/answer_button.dart';
import 'package:quiz_error/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

//click on column and right click reflector and than wrap with container choice
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  currentQuestion.text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:quiz/answer_button.dart';
// import 'package:quiz/data/questions.dart';

// class QuestionsScreen extends StatefulWidget {
//   const QuestionsScreen({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _QuestionsScreenState();
//   }
// }

// class _QuestionsScreenState extends State<QuestionsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final currentQuestion = questions[0];
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             currentQuestion.text,
//             style: const TextStyle(color: Colors.white),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
//           AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
//           AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
//           AnswerButton(answerText: currentQuestion.answers[3], onTap: () {})
//         ],
//       ),
//     );
//   }
// }
