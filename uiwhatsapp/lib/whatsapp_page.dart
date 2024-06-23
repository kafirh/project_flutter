import 'package:flutter/material.dart';
import 'package:uiwhatsapp/theme.dart';
import 'package:uiwhatsapp/widgets/call_view.dart';
import 'package:uiwhatsapp/widgets/chat_view.dart';
import 'package:uiwhatsapp/widgets/status_view.dart';

class WhatsappPage extends StatefulWidget {
  const WhatsappPage({super.key});

  @override
  State<WhatsappPage> createState() => _WhatsappPageState();
}

class _WhatsappPageState extends State<WhatsappPage>
    with SingleTickerProviderStateMixin {
  final tabs = const [
    Tab(
      icon: Icon(Icons.camera_alt),
    ),
    Tab(
      text: "CHAT",
    ),
    Tab(
      text: "STATUS",
    ),
    Tab(
      text: "CALL",
    ),
  ];
  TabController? tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController?.index = 1;
    tabController?.addListener(() {
      setState(() {
        switch (tabController?.index) {
          case 0:
            fabIcon = Icons.camera;
            break;
          case 1:
            fabIcon = Icons.message;
            break;
          case 2:
            fabIcon = Icons.camera_alt;
            break;
          case 3:
            fabIcon = Icons.call;
            break;
          default:
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        backgroundColor: whatsappGreen,
        actions: const [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.more_vert),
          )
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        Center(
          child: Icon(Icons.camera_alt),
        ),
        ChatView(),
        StatusView(),
        CallView(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: whatsappLightGreen,
        child: Icon(fabIcon),
      ),
    );
  }
}
