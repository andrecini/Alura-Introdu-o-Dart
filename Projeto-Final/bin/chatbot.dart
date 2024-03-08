
import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

void main() async{
  String chatBot = 'ChatBot:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock().chatBotSream(1,100);
  var subscriber = myStream.listen((event) {
    print('\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tChatBot está ativo a: $event segundos');
  },onDone: (){
    print('ChatBot está sendo finalizado! Faça a última pergunta.');
    a = false;
  });

  print('-- Iniciando o ChatBot, aguarde..--\n');
  await BotClock().clock(3);
  print('$chatBot Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString().toLowerCase();
    print('-- Processando pergunta, aguarde..--');
     await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('tchau') ||
        usuario.contains('falou') ||
        usuario.contains('flw') ||
        usuario.contains('adeus')) {
      a = false;
      print(chatBot + ' Até a proxima!!');
      subscriber.cancel();
    } else if (TimeQuestions(usuario).isThisTime()) {
      TimeQuestions(usuario).timeQuestion();
      await  BotClock().clock(1);
    } else if (GoodManners(usuario).isThisManners()) {
      GoodManners(usuario).goodManners();
    } else if (false) {
      // Adicionar novas perguntas
    }else {
      await  BotClock().clock(2);
      print(chatBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(chatBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando ChatBot--');
}
