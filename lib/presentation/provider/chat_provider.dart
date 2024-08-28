import "package:flutter/material.dart";
import "package:yes_no_app/domain/entities/message.dart";

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hello beatiful instructor', fromWho: FromWho.me),
    Message(text: 'Do i need to bring my homework?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    notifyListeners();
  }
}
