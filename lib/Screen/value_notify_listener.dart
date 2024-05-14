import 'package:flutter/material.dart';

class ValueNotifierScreen extends StatelessWidget {
   ValueNotifierScreen({super.key});
  ValueNotifier<int> count=ValueNotifier(0);
  ValueNotifier<bool> visible=ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Subscribers",),
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(valueListenable: visible,
                builder: (context,value,child){
              return TextFormField(
                obscureText: visible.value,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: (){
                        print(visible.value);
                        visible.value=!visible.value;
                      },
                      child: Icon((visible.value)?Icons.visibility:Icons.visibility_off,),
                    )
                ),
              );
                }
            ),


            ValueListenableBuilder(
                valueListenable: count,
                builder: (context,value,child){
                  return Text(count.value.toString(),style: TextStyle(fontSize: 40),);
                }
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
