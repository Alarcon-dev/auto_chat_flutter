import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:yes_no_app/domain/entities/message.dart";
import "package:yes_no_app/presentation/provider/chat_provider.dart";
import "package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart";
import "package:yes_no_app/presentation/widgets/chat/your_message_bubble.dart";
import "package:yes_no_app/presentation/widgets/shared/message_field_box.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://es.web.img2.acsta.net/pictures/15/12/24/11/47/487503.jpg'),
          ),
        ),
        title: const Text('Instructora'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    final number = chatProvider.messages.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: number,
                    itemBuilder: (context, index) {
                      final messageList = chatProvider.messages[index];
                      return (messageList.fromWho == FromWho.me)
                          ? MyMessageBubble(message: messageList)
                          : YourMessageBubble(yourMessage: messageList);
                    })),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
