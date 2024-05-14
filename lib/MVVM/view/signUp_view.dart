import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
          title: Text("SignUp"),
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
              RoundButton(title: 'SignUp',loading: authViewModel.signingUp, onPress: (){
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
                  authViewModel.signUpApi(data, context);
                  print("Success");
                }
              }),
              SizedBox(height: 30,),
              InkWell(
                child: Text("Already have an account? Login"),
                onTap: (){
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
    );
  }
}
