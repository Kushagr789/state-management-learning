import 'package:state_management/MVVM/data/network/BaseApiServices.dart';
import 'package:state_management/MVVM/data/network/NetworkApiServices.dart';
import 'package:state_management/MVVM/res/app_urls.dart';

class AuthRepository{
  BaseApiServices _apiServices= NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.logInUrl, data);
      return response;
    }catch(e)
    {
      throw e;
    }
  }
  Future<dynamic> registerApi(dynamic data) async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    }catch(e)
    {
      throw e;
    }
  }
}