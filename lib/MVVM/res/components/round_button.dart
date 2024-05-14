import 'package:flutter/material.dart';
import 'package:state_management/MVVM/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({super.key, required this.title, this.loading=false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color:AppColors.buttonColor
        ),
        child: loading? CircularProgressIndicator():Text(title,
          style: TextStyle(
            color: AppColors.textColor),
        ),

      ),
    );
  }
}
