import 'package:flutter/material.dart';
import 'package:ui_whatsapp_new/theme.dart';
import 'package:ui_whatsapp_new/widgets/call_view.dart';
import 'package:ui_whatsapp_new/widgets/chat_view.dart';
import 'package:ui_whatsapp_new/widgets/communities_view.dart';
import 'package:ui_whatsapp_new/widgets/updates_view.dart';

class WhatsAppPage extends StatefulWidget {
  const WhatsAppPage({super.key});

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ChatView(),
    const UpdatesView(),
    const CommunitiesView(),
    const CallView(),
  ];

  final List<Icon> _iconFloating = [
    const Icon(Icons.chat_outlined),
    const Icon(Icons.camera_alt_outlined),
    const Icon(Icons.no_accounts),
    const Icon(Icons.add_ic_call_rounded)
  ];

  final List<String> _title = ["WhatsApp", "Updates", "Communities", "Calls"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _selectedIndex == 0
            ? Text(
                _title[_selectedIndex],
                style: TextStyle(
                    color: whatsAppGreen,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              )
            : Text(
                _title[_selectedIndex],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
        actions: [
          const Icon(Icons.camera_alt_outlined),
          const SizedBox(
            width: 18,
          ),
          _selectedIndex == 2
              ? Container()
              : const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 18,
                    ),
                  ],
                ),
          const Icon(Icons.more_vert),
          const SizedBox(
            width: 12,
          ),
        ],
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), label: "Communities"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        ],
      ),
    );
  }
}
