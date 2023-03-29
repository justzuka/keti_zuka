import 'dart:math';

List<String> MathQuizRandomQuestionGenerator() {
  //enter two random integer numbers between 1 and 250
  int num1 = Random().nextInt(250) + 1;
  int num2 = Random().nextInt(250) + 1;

  //generate a random number between 1 and 2
  int operation = Random().nextInt(2) + 1;
  int ans;
  if (operation == 1) {
    ans = num1 + num2;
  } else {
    ans = num1 - num2;
  }

  //generate a random number between -20 and 20 except for 0
  int rand1 = Random().nextInt(40) - 20;
  int wrongAns1 = ans + rand1;
  while (rand1 == 0) {
    rand1 = Random().nextInt(40) - 20;
    wrongAns1 = ans + rand1;
  }
  int rand2 = Random().nextInt(40) - 20;
  int wrongAns2 = ans + rand2;
  while (rand2 == 0) {
    rand2 = Random().nextInt(40) - 20;
    wrongAns2 = ans + rand1;
  }
  int rand3 = Random().nextInt(40) - 20;
  int wrongAns3 = ans + rand3;
  while (rand3 == 0) {
    rand3 = Random().nextInt(40) - 20;
    wrongAns3 = ans + rand3;
  }
  int rand4 = Random().nextInt(40) - 20;
  int wrongAns4 = ans + rand4;
  while (rand1 == 0) {
    rand4 = Random().nextInt(40) - 20;
    wrongAns4 = ans + rand4;
  }
  //returns num1 ,(+ (1) or -(2)), num2, ans, wrongAns1, wrongAns2, wrongAns3

  String question = '${num1}' + ((operation == 1) ? '+' : "-") + '${num2}';
  int randomIndex = Random().nextInt(4) + 1;
  List<String> options = [
    question,
    wrongAns1.toString(),
    wrongAns2.toString(),
    wrongAns3.toString(),
    wrongAns4.toString(),
    (randomIndex - 1).toString()
  ];
  options[randomIndex] = ans.toString();
  return options;
}
