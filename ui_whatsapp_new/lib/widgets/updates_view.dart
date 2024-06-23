import 'package:flutter/material.dart';
import 'package:ui_whatsapp_new/theme.dart';
import 'package:ui_whatsapp_new/models/status.dart';

class UpdatesView extends StatelessWidget {
  const UpdatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Icon(Icons.more_vert),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "My Status",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Tap to add status update"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child:
                SizedBox(width: double.infinity, child: Text("Recent updates")),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: statusList.length,
              itemBuilder: (context, index) {
                final status = statusList[index];
                return ListTile(
                  leading: const Icon(
                    Icons.account_circle,
                    color: Colors.black45,
                    size: 58,
                  ),
                  title: Text(
                    status.name,
                    style: customTextStyle,
                  ),
                  subtitle: Text(
                    status.statusDate,
                    style: const TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: whatsAppLightGreen,
        child: const Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
