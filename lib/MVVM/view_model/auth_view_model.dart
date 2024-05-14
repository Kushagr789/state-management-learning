
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_management/MVVM/repository/auth_repository.dart';
import 'package:state_management/MVVM/utils/utils.dart';
import 'package:state_management/MVVM/view/home_screen.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo=AuthRepository();
  bool _loading=false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  bool _signingUp=false;
  bool get signingUp => _signingUp;
  setSigningUp(bool value){
    _signingUp=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext context)async{
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.toastMessage("Login Successful");
      if(kDebugMode){
        print(value.toString());
      }
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        Utils.toastMessage(error.toString(),);
        print(error.toString());
      }
    });
  }
  Future<void> signUpApi(dynamic data,BuildContext context)async{
    setSigningUp(true);
    _myRepo.registerApi(data).then((value) {
      setSigningUp(false);
      Utils.toastMessage("SignUp Successful");
      if(kDebugMode){
        print(value.toString());
      }
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

    }).onError((error, stackTrace) {
      setSigningUp(false);
      if(kDebugMode){
        Utils.toastMessage(error.toString(),);
        print(error.toString());
      }
    });
  }
}