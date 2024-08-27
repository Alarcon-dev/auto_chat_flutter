import "package:flutter/material.dart";
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        return index % 2 == 0
                            ? const MyMessageBubble()
                            : const YourMessageBubble();
                      })),
              const MessageFieldBox(),
            ],
          ),
        ),
      ),
    );
  }
}
