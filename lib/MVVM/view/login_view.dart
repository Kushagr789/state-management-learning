import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/MVVM/res/components/round_button.dart';
import 'package:state_management/MVVM/utils/utils.dart';
import 'package:state_management/MVVM/view/signUp_view.dart';
import 'package:state_management/MVVM/view_model/auth_view_model.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  ValueNotifier<bool> visible=ValueNotifier(true);
  FocusNode emailFocus=FocusNode();
  FocusNode passwordFocus=FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
    visible.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel=Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("LogIn"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: email,
              focusNode: emailFocus,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email)
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocus, passwordFocus);
              },
            ),
            ValueListenableBuilder(
                valueListenable: visible,
                builder: (context,value,child){
                  return TextFormField(
                    focusNode: passwordFocus,
                    controller: password,
                    obscureText: visible.value,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),
                      suffix: InkWell(
                        onTap: (){
                          visible.value=!visible.value;
                        },
                        child: Icon((visible.value)?Icons.visibility:Icons.visibility_off,),
                      )
                    ),

                  );
                }
            ),
            SizedBox(height: 100,),
            RoundButton(title: 'LogIn',loading: authViewModel.loading, onPress: (){
              if(email.text.isEmpty){
                Utils.toastMessage("Enter Email");
              }
              else if(password.text.isEmpty){
                Utils.toastMessage("Enter Password");
              }
              else {
                Map data={
                  'email':email.text.toString(),
                  'password':password.text.toString(),
                };
                authViewModel.loginApi(data,context);
                print("Success");
              }
            }),
            SizedBox(height: 30,),
            InkWell(
              child: Text("Don't have an account? SignUp"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpView()));
              },
            )
          ],
        ),
      )
    );
  }
}
