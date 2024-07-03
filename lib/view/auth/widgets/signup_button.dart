import 'package:flutter/material.dart';
import 'package:studio137_deliva/utils/utils.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key, this.onpressed, this.buttonText});

  final Function()? onpressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: const ButtonStyle(
          maximumSize: WidgetStatePropertyAll(Size(250, 80)),
          backgroundColor:
              WidgetStatePropertyAll(Color.fromRGBO(231, 76, 61, 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText!,
            style: TextStyle(color: white, fontWeight: FontWeight.w500),
          ),
          sizedwten(context),
          Icon(
            Icons.arrow_forward_rounded,
            color: white,
            size: 20,
          )
        ],
      ),
    );
  }
}
