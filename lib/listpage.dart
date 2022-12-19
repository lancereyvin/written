import 'package:flutter/material.dart';
import 'package:assignment3/addtodo.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: ListView(
        children: const [
            ListTile(
            title:  Text('Item 1'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddTodo()
              )
            );
          },
          child: Icon(Icons.add),
      ),
    );
  }
}
