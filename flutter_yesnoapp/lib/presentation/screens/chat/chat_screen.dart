import 'package:flutter/material.dart';
import 'package:flutter_yesnoapp/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://yt3.googleusercontent.com/ytc/AIdro_nCfJ5zS5jr28RoUco9p609rkIyUT5UW6e-ktimx0fJORA=s900-c-k-c0x00ffffff-no-rj'),
          ),
        ),
        title: Text('Jorge 🙉'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return const MyMessageBubble();
                    })),
            Text('Mundo')
          ],
        ),
      ),
    );
  }
}
