import 'package:database/adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'first.dart';

class view_data extends StatefulWidget {
  const view_data({super.key});

  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data> {
  Box box=Hive.box('cdmi');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: box.length,
        itemBuilder: (context, index) {
        adapter c=box.getAt(index);
        print(c);
        return Card(child:
          ListTile(
            title: Text("${c.name}"),
            subtitle: Text("${c.Contact}"),
            trailing: Wrap(
              children: [
                IconButton(onPressed: () {
                  box.deleteAt(index);
                  setState(() {

                  });
                }, icon: Icon(Icons.delete)),
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return first(c);
                  },));
                }, icon: Icon(Icons.edit)),
              ],
            ),
          )
          ,);
      },),
    );
  }
}
