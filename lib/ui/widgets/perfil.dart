import 'package:flutter/material.dart';
import '../widgets/estados.dart';
import 'chat_page.dart';

class ContentPage11 extends StatefulWidget {
  const ContentPage11({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ContentPage11> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Perfil"),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150/92c952'),
                    radius: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150/92c952'),
                    radius: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150/92c952'),
                    radius: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150/92c952'),
                    radius: 30,
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(20.0), // exterior
                        padding: const EdgeInsets.all(10.0), // interior
                        color: Colors.deepOrange[50],
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Row(children: const [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150/92c952'),
                                  radius: 20,
                                ),
                              ),
                            ]),
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.all(20.0), // exterior
                        padding: const EdgeInsets.all(10.0), // interior
                        color: Colors.deepOrange[50],
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Row(children: const [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150/92c952'),
                                  radius: 20,
                                ),
                              ),
                            ]),
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.all(20.0), // exterior
                        padding: const EdgeInsets.all(10.0), // interior
                        color: Colors.deepOrange[50],
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Row(children: const [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150/92c952'),
                                  radius: 20,
                                ),
                              ),
                            ]),
                          ],
                        ))
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatPage()));
                },
                child: const Text('Escribir estado')),
          ],
        ),
      ),
    );
  }
}
