import 'dart:io';

import 'package:database/adapter.dart';
import 'package:database/view_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(adapterAdapter());
  var box = await Hive.openBox('cdmi');
  runApp(MaterialApp(
    home: first(),
    debugShowCheckedModeBanner: false,
  ));
}


class first extends StatefulWidget {
  // const first(adapter c, {super.key});
  adapter ?c;
  first([this.c]);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  int a=0;
  Box box=Hive.box('cdmi');
  @override
  void initState() {
    a=box.get('cdmi')??0;
    if(widget.c!=null){
      t1.text=widget.c!.name;
      t2.text=widget.c!.Contact;
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: (widget.c!=null?Text("Update Data"):Text("Add Data")),),
      body: Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
         // Text("A:-${a}",style: TextStyle(fontSize: 40),),
          ElevatedButton(onPressed: () {
            String name=t1.text;
            String contact=t2.text;
            if(widget.c!=null)
              {
                widget.c!.name=name;
                widget.c!.Contact=contact;
                widget.c!.save();
              }else{
              // adapter d=adapter(name, Contact);
              adapter d=adapter(name,contact);
              box.add(d);
              print(d);
            }


           // a++;
            setState(() {

            });

          }, child: Text("Add")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return view_data();
            },));
          }, child: Text("view")),
        ],
      ),
    );
  }
}
