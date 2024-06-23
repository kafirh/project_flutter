import 'package:flutter/material.dart';
import 'package:ui_whatsapp_new/theme.dart';
import 'package:ui_whatsapp_new/models/call.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: callList.length,
        itemBuilder: (context, index) {
          final call = callList[index];
          return ListTile(
            leading: const Icon(
              Icons.account_circle,
              color: Colors.black45,
              size: 58,
            ),
            title: Text(
              call.name,
              style: customTextStyle,
            ),
            subtitle: Text(
              call.callDate,
              style: const TextStyle(color: Colors.black45, fontSize: 16),
            ),
            trailing: const Icon(Icons.call),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: whatsAppLightGreen,
        child: const Icon(Icons.add_call),
      ),
    );
  }
}
