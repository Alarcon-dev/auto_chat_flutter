import "package:flutter/material.dart";
import "package:yes_no_app/config/helpers/get_yes_no_answer.dart";
import "package:yes_no_app/domain/entities/message.dart";

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hello beatiful instructor', fromWho: FromWho.me),
    Message(text: 'Do i need to bring my homework?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    if (text.endsWith('?')) {
      yourAnswer();
    }

    notifyListeners();
    moveScroll();
  }

  Future<void> moveScroll() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  Future<void> yourAnswer() async {
    final yourMessage = await getAnswer.getAnswer();

    messages.add(yourMessage);
    notifyListeners();
    moveScroll();
  }
}
