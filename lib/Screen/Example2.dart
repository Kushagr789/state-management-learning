import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/ProviderExam2.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Kush",),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ProviderExam2>(builder: (context,value,child){
            return Slider(
                min: 0.0,
                max: 1.0,
                value: value.value,
                onChanged: (val){
                  value.setValue(val);
                });
          }),
          Consumer<ProviderExam2>(builder: (context,value,child){
            return Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)
                    ),
                    height: 100,
                    child: Center(child: Text("Container1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)
                    ),
                    height: 100,
                    child: Center(child: Text("Container2")),
                  ),
                ),
              ],
            );
          }),

        ],
      ),
    );
  }
}
