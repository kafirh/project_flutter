import 'package:flutter/material.dart';
import 'package:uiwhatsapp/models/call.dart';
import 'package:uiwhatsapp/theme.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callList.length,
      itemBuilder: (context, index) {
        final call = callList[index];
        return ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black38,
            size: 58,
          ),
          title: Text(
            call.name,
            style: customTextstyle,
          ),
          subtitle: Text(
            call.callDate,
            style: const TextStyle(color: Colors.black45, fontSize: 16),
          ),
          trailing: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.call,
              color: whatsappGreen,
            ),
          ),
        );
      },
    );
  }
}
