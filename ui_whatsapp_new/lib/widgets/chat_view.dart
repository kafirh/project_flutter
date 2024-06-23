import 'package:flutter/material.dart';
import 'package:ui_whatsapp_new/theme.dart';
import 'package:ui_whatsapp_new/models/chat.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(chat.image, fit: BoxFit.cover),
            ),
            title: Text(
              chat.name,
              style: customTextStyle,
            ),
            subtitle: Text(
              chat.mostRecentMessage,
              style: const TextStyle(color: Colors.black45, fontSize: 12),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(
                chat.messageDate,
                style: const TextStyle(color: Colors.black45),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: whatsAppLightGreen,
        child: const Icon(Icons.message),
      ),
    );
  }
}
