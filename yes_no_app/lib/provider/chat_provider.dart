import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hola Coneja!', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    if (text.endsWith('?')) {
      getHerReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> getHerReply() async {
    final getMessage = await getYesNoAnswer.getAnswer();
    messages.add(getMessage);
    notifyListeners();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300), curve: Curves.easeOut);
  }
}
