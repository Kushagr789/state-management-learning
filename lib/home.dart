import 'package:flutter/material.dart';
import 'package:state_management/MVVM/view/login_view.dart';
import 'package:state_management/Screen/Count_example.dart';
import 'package:state_management/Screen/Example2.dart';
import 'package:state_management/Screen/Favourite/favourite_screen.dart';
import 'package:state_management/Screen/dark_theme.dart';
import 'package:state_management/Screen/login.dart';
import 'package:state_management/Screen/value_notify_listener.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Count_example()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text("Example 1",style: TextStyle(fontSize: 40),),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Example2()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text("Example 2",style: TextStyle(fontSize: 40),),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouriteScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text("Favourite App",style: TextStyle(fontSize: 40),),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DarkTheme()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text("Theme Change",style: TextStyle(fontSize: 40),),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text("LogIn",style: TextStyle(fontSize: 40),),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ValueNotifierScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text("ValueNotifier",style: TextStyle(fontSize: 40),),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text("MVVM",style: TextStyle(fontSize: 40),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
