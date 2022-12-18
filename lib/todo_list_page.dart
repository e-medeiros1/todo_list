// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'pages/home/widgets/floating_button.dart';
import 'pages/home/widgets/input.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Lista De Afazeres',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        color: Colors.blue[100],
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Input(textEditingController: _textEditingController),
            Container(
              padding: EdgeInsets.all(10),
              height: 310,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
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
                      style: TextStyle(fontSize: 15),
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
              icon: Icon(Icons.remove_circle_outline_outlined),
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
                icon: Icon(Icons.add_circle_outline))
          ],
        ),
      ),
    );
  }
}
