import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/Count_provider.dart';

class Count_example extends StatefulWidget {
  const Count_example({super.key});

  @override
  State<Count_example> createState() => _Count_exampleState();
}

class _Count_exampleState extends State<Count_example> {

  @override
  void initState() {
    super.initState();
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {

    final countProvider=Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Kush",),
      ),
      body: Center(

        child: Consumer<CountProvider>(builder: (context,value,child){
          return Text(
              value.count.toString(),style: TextStyle(fontSize: 50)
          );
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );;
  }
}
