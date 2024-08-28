import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final borderMessageField = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    );

    final inputDecoration = InputDecoration(
        hintText: 'Envia un mensaje con "?"',
        enabledBorder: borderMessageField,
        focusedBorder: borderMessageField,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textVAlue = textController.value.text;
              onValue(textVAlue);
              textController.clear();
            },
            icon: const Icon(Icons.send_outlined)));

    return TextField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
