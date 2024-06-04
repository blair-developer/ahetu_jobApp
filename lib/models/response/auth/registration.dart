import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/controllers/login_provider.dart';
import 'package:ahetu/controllers/zoom_provider.dart';
import 'package:ahetu/models/response/auth/login.dart';
import 'package:ahetu/views/common/BackBtn.dart';
import 'package:ahetu/views/common/app_bar.dart';
import 'package:ahetu/views/common/app_style.dart';
import 'package:ahetu/views/common/custom_btn.dart';
import 'package:ahetu/views/common/custom_textfield.dart';
import 'package:ahetu/views/common/height_spacer.dart';
import 'package:ahetu/views/common/reusable_text.dart';
import 'package:ahetu/views/common/styled_container.dart';
//import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
 TextEditingController email = TextEditingController();
 TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Consumer<LoginNotifier>(
      builder: (context, LoginNotifier, child){
        return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), 
      child: CustomAppBar(
        text: 'SignUp',
        child: GestureDetector(
           onTap: () {
             Get.offAll(()=> const LoginPage());
           },
           child: const Icon(
            AntDesign.leftcircleo,
           ),
        )
        ),
      ),
      body: buildStyleContainer(context,
      Padding(padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             HeightSpacer(size: 50),
             ReusableText(text: "Welcome", 
             style: appStyle(30, Color(kDark.value), FontWeight.w600)
             ),
             ReusableText(text: "Fill in the details to SignUp", 
             style: appStyle(14, Color(kDarkGrey.value), FontWeight.w600)
             ),

             HeightSpacer(size: 50),
             CustomTextField(controller: username, hintText: "Enter Your userName", keyboardType: TextInputType.text,
             validator: (username) {
               if (username!.isEmpty) {
                 return "please enter your email";
               }
               return null;
             },
             ),
              HeightSpacer(size: 40),
             CustomTextField(controller: email, hintText: "Enter Your Email", keyboardType: TextInputType.emailAddress,
             validator: (email) {
               if (email!.isEmpty || !email.contains('@')) {
                 return "please enter your email";
               }
               return null;
             },
             ),
             HeightSpacer(size: 40),
             CustomTextField(controller: password,obscureText: LoginNotifier.obsecureText, hintText: "Enter Your Password", 
             keyboardType: TextInputType.text,
             suffixIcon: GestureDetector(
              onTap: () {
                LoginNotifier.obsecureText = !LoginNotifier.obsecureText;
              },
              child: Icon(
                LoginNotifier.obsecureText ?
                Icons.visibility : Icons.visibility_off),
             ),
              validator: (password) {
               if (password!.isEmpty || password.length < 8) {
                 return "please enter your password";
               }
               return null;
             },
             ),
             HeightSpacer(size: 10),
             Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.offAll(()=> RegistrationPage());
                },
                child: ReusableText(text: "Already have an account? Login",
                 style: appStyle(14, Colors.blue, FontWeight.bold)
                 ),
              ),
             ),
             const HeightSpacer(size: 30),
             Consumer<ZoomNotifier>(
              builder: (context, ZoomNotifier, child){
                return CustomButton(text: "Sign Up",
                onTap: () {
                  
                },
                );
              }
              )
          ],
        )
        ),
      )),
    );
      }
      );
  }
}