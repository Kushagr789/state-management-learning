import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class LoginProvider with ChangeNotifier{

  bool _loading=false;
  bool get leading=>_loading;

  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  void login(String email,String password)async{

    _loading=true;
    try{
      Response response=await post(Uri.parse("https://reqres.in/api/users?page=2"),
          body: {
            'email':email,
            'password': password,
          }
      );

      if(response.statusCode==200)
        {
          print('Successful');
          _loading=false;
        }
      else{
        print('Failed');
        _loading=false;
      }
    }catch(e)
    {
      print(e.toString());
      _loading=false;
    }


  }
}