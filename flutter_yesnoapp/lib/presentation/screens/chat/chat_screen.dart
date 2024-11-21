import 'package:flutter/material.dart';
import 'package:flutter_yesnoapp/domain/entities/message.dart';
import 'package:provider/provider.dart';
import 'package:flutter_yesnoapp/presentation/providers/chat_provider.dart';
import 'package:flutter_yesnoapp/presentation/widgets/chat/her_message_bubble.dart';
import 'package:flutter_yesnoapp/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_yesnoapp/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(232, 184, 178, 178), 
        leading: const Padding(
          padding:  EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://yt3.googleusercontent.com/ytc/AIdro_nCfJ5zS5jr28RoUco9p609rkIyUT5UW6e-ktimx0fJORA=s900-c-k-c0x00ffffff-no-rj'),
          ),
        ),
       title: const Text(
          'Jorge 🙉',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // Cambia el color del texto aquí
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white), // Cambia el color del icono aquí
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      return (message.fromwho == Fromwho.hers)
                          ?  HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),
             MessageFieldBox(onValue:chatProvider.sendMessage,
             ),
          ],
        ),
      ),
    );
  }
}
