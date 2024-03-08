import 'dart:io';

class TimeQuestions {
  // Perguntas padrões
  String hour = 'Que horas são?';   
  String day = 'Que dia e hoje?';
  String year = 'Em que ano estamos?';
  // Label - resposta chatBot
  String chatBot = 'chatBot:\n';
  // Propiedades
  String question;
  DateTime date = DateTime.now();
  bool isThisATimeQuestion = false;

  TimeQuestions(this.question);

  bool isThisTime() {
    question = question.toLowerCase();

    if (question.contains('horas') ||
        question.contains('dia') ||
        question.contains('ano')) {
      isThisATimeQuestion = true;
    }

    return isThisATimeQuestion;
  }

  timeQuestion() {
    if (question == hour) {
      String _botAnswer =
          chatBot + ' Opa! são : ${date.hour} horas e ${date.minute} minutos!';
      print(_botAnswer);
    } else if (question == day) {
      String _botAnswer = chatBot + ' Opa! hoje é dia : ${date.day}';
      print(_botAnswer);
    } else if (question == year) {
      String _botAnswer = chatBot + ' Opa! estamos em : ${date.year}';
      print(_botAnswer);
    } else {
      unsure();
    }
  }

  unsure() {
    question = question.toLowerCase();

    if (question.contains('horas')) {
      String _botQuestion =
          chatBot + ' Não entendi, você quer saber das horas?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String _botAnswer = chatBot +
            ' Beleza, são : ${date.hour} horas e ${date.minute} minutos!';
        print(_botAnswer);
      } else {
        String _botAnswer = chatBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('dia')) {
      String _botQuestion =
          chatBot + ' Não entendi, você quer saber que dia é hoje?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String _botAnswer = chatBot + ' Beleza, hoje é dia: ${date.day}';
        print(_botAnswer);
      } else {
        String _botAnswer = chatBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('ano')) {
      String _botQuestion =
          chatBot + ' Não entendi, você quer saber em que ano estamos?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        String _botAnswer = chatBot +
            ' Beleza, estamos no ano de 2077, a pandemia já está terminando... \n '
                'Brincadeirinha! estamos em : ${date.year}';
        print(_botAnswer);
      } else {
        String _botAnswer = chatBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    }
  }
}
