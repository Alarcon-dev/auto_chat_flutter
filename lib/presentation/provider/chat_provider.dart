import "package:flutter/material.dart";
import "package:yes_no_app/domain/entities/message.dart";

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messages = [
    Message(text: 'Hello beatiful instructor', fromWho: FromWho.me),
    Message(text: 'Do i need to bring my homework?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

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
}
