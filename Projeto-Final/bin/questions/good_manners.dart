class GoodManners {
  String question;
  bool isThisGoodManners = false;
  String chatBot = 'ChatBot:\n';

  GoodManners(this.question);

  bool isThisManners() {
    question = question.toLowerCase();
    if (question.contains('oi') ||
        question.contains('ola') ||
        question.contains('oi') ||
        question.contains('olá') ||
        question.contains('obrigado') ||
        question.contains('obrigada') ||
        question.contains('bom') ||
        question.contains('boa') ||
        question.contains('tarde') ||
        question.contains('noite') ||
        question.contains('de nada')) {
      isThisGoodManners = true;
    }

    return isThisGoodManners;
  }

  goodManners() {
    question = question.toLowerCase();

    if (question.contains('bom dia')) {
      print(chatBot + ' Bom dia Flor do dia!');
    } else if (question.contains('boa tarde') ||
        question.contains('boa tarde')) {
      print(chatBot + ' Opa sô, boa tarde!');
    } else if (question.contains('boa noite') ||
        question.contains('boa noite')) {
      print(chatBot + ' Uma bela noite, não é mesmo?');
    } else if (question.contains('oi') ||
        question.contains('ola') ||
        question.contains('olá')) {
      print(chatBot + ' Muito prazer!');
    } else if (question.contains('obrigado') ||
        question.contains('obrigada')) {
      print(chatBot + ' De nada, fique a vontade c:');
    }
  }
}
