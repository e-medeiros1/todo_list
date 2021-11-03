// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
      //Barra
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Lista De Afazeres',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),

      //Body com padding
      body: Container(
        color: Colors.blue[100],
        padding: EdgeInsets.all(16fdsfs),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
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

      //Botão de adicionar
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              setState(() {
                lista = [];
              });
              _textEditingController.clear();
            },
            child: Icon(Icons.bookmark_remove),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              if (_textEditingController.text.isNotEmpty) {
                setState(() {
                  lista.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
            },
            child: Icon(Icons.bookmark_add),
          ),
        ],
      ),
    );
  }
}
