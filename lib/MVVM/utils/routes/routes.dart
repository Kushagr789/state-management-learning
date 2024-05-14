
import 'package:flutter/material.dart';
import 'package:state_management/MVVM/utils/routes/routes_name.dart';
import 'package:state_management/MVVM/view/home_screen.dart';

import '../../view/login_view.dart';

class Routes{
  static MaterialPageRoute generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
          body: Center(
          child: Text("NO Route Defined"),
          ),
          );
        });
    }
  }
}