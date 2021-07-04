import 'package:flutter/material.dart';
import 'package:todo/HomeScreen/page/home_page.dart';
import 'package:todo/constants.dart';
import 'package:todo/screens/Forget_Password/forget_password.dart';
import 'background.dart';
import 'package:todo/Screens/Signup/signup_screen.dart';
import 'package:todo/components/already_have_an_account_acheck.dart';
import 'package:todo/components/rounded_button.dart';
import 'package:todo/components/rounded_input_field.dart';
import 'package:todo/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    String email;
    String password;

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(child: Text("Forgot Password", style: TextStyle(color: kPrimaryColor)), onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()),);
                },)
              ],
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                try {
                  final loginUser = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (loginUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
