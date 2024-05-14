import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/MVVM/utils/routes/routes.dart';
import 'package:state_management/MVVM/utils/routes/routes_name.dart';
import 'package:state_management/MVVM/view_model/auth_view_model.dart';
import 'package:state_management/MVVM/view_model/user_view_model.dart';
import 'package:state_management/Provider/Count_provider.dart';
import 'package:state_management/Provider/ProviderExam2.dart';
import 'package:state_management/Provider/auth_provider.dart';
import 'package:state_management/Provider/favourite_provider.dart';
import 'package:state_management/Provider/theme_changer.dart';
import 'package:state_management/Screen/Count_example.dart';
import 'package:state_management/Screen/Favourite/favourite_screen.dart';
import 'package:state_management/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CountProvider()),
        ChangeNotifierProvider(create: (_)=>ProviderExam2()),
        ChangeNotifierProvider(create: (_)=>FavouriteItem()),
        ChangeNotifierProvider(create: (_)=>ThemeChanger()),
        ChangeNotifierProvider(create: (_)=>LoginProvider()),
        ChangeNotifierProvider(create: (_)=>AuthViewModel()),
        ChangeNotifierProvider(create: (_)=>UserViewModel()),
      ],

      child: Builder(
        builder: (BuildContext context){
          return MaterialApp(
            title: 'Flutter Demo',debugShowCheckedModeBanner: false,
            themeMode: Provider.of<ThemeChanger>(context).thememode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            home: Home(),
            //initialRoute: RoutesName.login,
            //onGenerateRoute: Routes.generateRoute,
          );
        },
      )
    );

  }
}


