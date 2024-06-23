import 'package:flutter/material.dart';
import 'package:uiwhatsapp/models/status.dart';
import 'package:uiwhatsapp/theme.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statusList.length,
      itemBuilder: (context, index) {
        final status = statusList[index];
        return ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black38,
            size: 58,
          ),
          title: Text(
            status.name,
            style: customTextstyle,
          ),
          subtitle: Text(
            status.statusDate,
            style: const TextStyle(color: Colors.black45, fontSize: 16),
          ),
        );
      },
    );
  }
}
