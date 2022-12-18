import 'package:flutter/material.dart';

import 'widgets/floating_button.dart';
import 'widgets/input.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Lista De Afazeres',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        color: Colors.blue[100],
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Input(textEditingController: _textEditingController),
            Container(
              padding: const EdgeInsets.all(10),
              height: 310,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onLongPress: () {
                      setState(() {
                        lista.removeAt(index);
                      });
                    },
                    title: Text(
                      lista[index],
                      style: const TextStyle(fontSize: 15),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 360,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingButton(
              onPressed: () {
                setState(() {
                  lista.removeLast();
                });
                _textEditingController.clear();
              },

              icon: const Icon(Icons.remove_circle_outline_outlined),


            ),
            FloatingButton(
                onPressed: () {
                  if (_textEditingController.text.isNotEmpty) {
                    setState(() {
                      lista.add(_textEditingController.text);
                    });
                    _textEditingController.clear();
                  }
                },

                icon: const Icon(Icons.add_circle_outline))

          ],
        ),
      ),
    );
  }
}
