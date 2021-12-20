import 'package:f_202110_firebase/domain/controller/authentication_controller.dart';
import 'package:f_202110_firebase/ui/widgets/perfil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/chat_page.dart';
import '../widgets/firestore_page.dart';
import '../widgets/perfil.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  int _selectIndex = 0;
  AuthenticationController authenticationController = Get.find();
  static List<Widget> _widgets = <Widget>[
    FireStorePage(),
    ChatPage(),
    ContentPage11(
      title: '',
    )
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome ${authenticationController.userEmail()}"),
          actions: [
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  _logout();
                }),
          ]),
      body: _widgets.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_location_rounded),
              label: "Ubication",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_shade),
              label: "Actividad",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "Chat",
              backgroundColor: Colors.purple)
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
