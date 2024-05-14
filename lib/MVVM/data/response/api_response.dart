

import 'package:state_management/MVVM/data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.message,this.status,this.data);

  ApiResponse.loading(): status= Status.LOADING;
  ApiResponse.completed(): status= Status.COMPLETED;
  ApiResponse.error(): status= Status.ERROR;

  @override
  String toString(){
    return 'Status: $status \n message: $message \n data:$data';
  }
}