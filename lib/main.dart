import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/todo_list_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:TodoListPage(),
    );
  }
}
