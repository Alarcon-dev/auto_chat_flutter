import "package:flutter/material.dart";
import "package:yes_no_app/domain/entities/message.dart";

class YourMessageBubble extends StatelessWidget {
  final Message yourMessage;

  const YourMessageBubble({super.key, required this.yourMessage});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                color: color.secondary,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(yourMessage.text),
            ),
          ),
        ),
        _ImageBubble(
          imageUrl: yourMessage.imageUrl,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String? imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          '$imageUrl',
          height: 150,
          width: size.width * 0.7,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              height: 150,
              width: size.width * 0.7,
              child: const Text('Instructora enviando una imagen'),
            );
          },
        ),
      ),
    );
  }
}
