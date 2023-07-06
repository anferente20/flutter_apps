import 'package:flutter/material.dart';
import 'package:yes_no_app/presentaion/screens/chat/widgets/chat/message_bubble.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return MessageBubble(
                  isLeftMessage: index % 2 == 0 ? true : false,
                );
              },
            )),
            Container(color: Colors.greenAccent)
          ],
        ),
      ),
    );
  }
}
