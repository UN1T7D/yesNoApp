import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/1200x/22/f2/33/22f233dfab39d1e6ce1b25a5757d5eb2.jpg'),
          ),
        ),
        title: const Text('Mi amor UwU <3'),
        centerTitle: true,
      ),
      body: _chatView(),
    );
  }
}

class _chatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChatProvider chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      // Esto es para habilitar el diseño solo en el espacio libre del dispositivo, respetando btn, notch
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return message.fromWho == FromWho.hers
                    ? HerMessageBubble(
                        message: chatProvider.messageList[index],
                      )
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),
            MessageFieldBox(
              onValue: chatProvider
                  .sendMessage, //(value)=> chatProvider.sendMessage(value) = chatProvider.sendMessage
            )
          ],
        ),
      ),
    );
  }
}
