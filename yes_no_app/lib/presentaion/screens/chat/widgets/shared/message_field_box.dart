import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({required this.onValue, super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    OutlineInputBorder outlineDecoration = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
            enabledBorder: outlineDecoration,
            focusedBorder: outlineDecoration,
            filled: true,
            hintText: "End your message with a ?",
            suffixIcon: IconButton(
              icon: const Icon(Icons.send_rounded),
              onPressed: () {
                onValue(textController.value.text);
                textController.clear();
                focusNode.requestFocus();
              },
            )),
        focusNode: focusNode,
        onFieldSubmitted: (value) {
          onValue(value);
          textController.clear();
          focusNode.requestFocus();
        },
        onTapOutside: (event) {
          focusNode.unfocus();
        },
      ),
    );
  }
}
