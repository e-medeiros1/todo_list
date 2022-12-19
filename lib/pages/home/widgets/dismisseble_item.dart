import 'package:flutter/material.dart';

class DismissebleItem extends StatefulWidget {
  String title;
  void Function(DismissDirection)? onDismissed;
  @override
  Key key;

  DismissebleItem(
      {required this.title, required this.onDismissed, required this.key});

  @override
  State<DismissebleItem> createState() => _DismissebleItemState();
}

class _DismissebleItemState extends State<DismissebleItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (_) {
        return showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Excluir nota'),
                  content: const Text('Tem certeza?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('Cancelar')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Ok')),
                  ],
                ));
      },
      onDismissed: widget.onDismissed,
      direction: DismissDirection.endToStart,
      background: Container(
          color: Colors.blue,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          child: const Text('Excluir',
              style: TextStyle(fontSize: 18, color: Colors.white))),
      key: widget.key,
      child: Card(
        elevation: 3,
        shadowColor: Colors.blue,
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: ListTile(
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
