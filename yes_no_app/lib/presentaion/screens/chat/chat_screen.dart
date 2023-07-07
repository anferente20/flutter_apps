import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentaion/screens/chat/widgets/chat/message_bubble.dart';
import 'package:yes_no_app/presentaion/screens/chat/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/provider/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rPCXC8GxXpoP-XJSDeUrYQYIEQIIJWCW-g&usqp=CAU'),
            ),
          ),
          title: const Text('Coneja')),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: chatProvider.messages[index],
                  isLeftMessage: chatProvider.messages[index].fromWho == FromWho.her ? true : false,
                  image: chatProvider.messages[index].imgUrl,
                );
              },
            )),
            MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
