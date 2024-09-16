import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  final VoidCallback onCreateAccountPressed;
  final VoidCallback onLoginPressed;

  const CreateAccount({
    Key? key,
    required this.onCreateAccountPressed,
    required this.onLoginPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Read Anywhere,",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3F6184),
          ),
        ),
        Text(
          "Anytime.",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3F6184),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 358,
          height: 64,
          child: ElevatedButton(
            onPressed: onCreateAccountPressed,
            child: Text(
              'Create Account',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3F6184),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Login',
                style: TextStyle(
                  color: Color(0xFF3F6184),
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = onLoginPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
