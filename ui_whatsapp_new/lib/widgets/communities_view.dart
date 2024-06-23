import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_whatsapp_new/theme.dart';
import 'package:ui_whatsapp_new/models/chat.dart';

class CommunitiesView extends StatelessWidget {
  const CommunitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  const Text("New community"),
                ],
              ),
            ),
            Container(
              height: 12,
              color: Colors.grey[200],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.tealAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(
                            Icons.book,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "EXTEND 😎",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.surround_sound_outlined,
                        color: Colors.black,
                      ),
                    ),
                    title: const Text(
                      "Announcements",
                      style: TextStyle(fontSize: 14),
                    ),
                    subtitle: const Text(
                      "Wildan: Assalamualaikum",
                      style: TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text(
                        "4/3/24",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(24)),
                      child: const Icon(
                        Icons.surround_sound_outlined,
                        color: Colors.black,
                      ),
                    ),
                    title: const Text(
                      "Extend Asoy",
                      style: TextStyle(fontSize: 14),
                    ),
                    subtitle: const Text(
                      "Fendy: TUGAS POST TEST",
                      style: TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text(
                        "08.25",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "View All",
                          style: TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 12,
              color: Colors.grey[200],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.green[900],
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(
                            Icons.balance,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Intensif An-Nahl 1 2024",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.surround_sound_outlined,
                        color: Colors.black,
                      ),
                    ),
                    title: const Text(
                      "Announcements",
                      style: TextStyle(fontSize: 14),
                    ),
                    subtitle: const Text(
                      "Wildan: Assalamualaikum",
                      style: TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text(
                        "4/3/24",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(24)),
                      child: const Icon(
                        Icons.surround_sound_outlined,
                        color: Colors.black,
                      ),
                    ),
                    title: const Text(
                      "Intan 1 Konsumsi 🍜",
                      style: TextStyle(fontSize: 14),
                    ),
                    subtitle: const Text(
                      "Fatimah: TUGAS POST TEST",
                      style: TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text(
                        "08.25",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "View All",
                          style: TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: null,
    );
  }
}
