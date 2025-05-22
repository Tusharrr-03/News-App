import 'package:flutter/material.dart';
import 'package:news_app_ui/screens/Login%20Pages%20UI/signup_page.dart';
import 'package:news_app_ui/screens/home_page.dart';
import 'package:news_app_ui/utils/utils_helper.dart';

class LoginPage extends StatelessWidget {
  var loginTextController = TextEditingController();
  var passTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 380,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 160,),
                Text("NEWS Nation" , style: mTextStyle32(
                  mColor: Colors.blue,
                  mFontWeight: FontWeight.bold
                ),),
                SizedBox(height: 100,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(11)
                  ),
                  child: Text("Login In" , style: mTextStyle32(
                      mColor: Colors.white,
                      mFontWeight: FontWeight.bold
                  ),),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(11.0),
            child: mTextField(
              mController: loginTextController,
              mPrefixIcon: Icon(Icons.email, color: Colors.grey,),
              mHintText: "Enter email",
            )
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: mTextField(
              mHintText: "Enter password",
              mPrefixIcon: Icon(Icons.password, color: Colors.grey,),
              mController: passTextController,
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 11),
            alignment: Alignment(1, 0),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage()));
              },
                child: Text("SingUp?")),
          ),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }, style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,

          ), child: Text("Login", style: mTextStyle16(mColor: Colors.white),)),
          SizedBox(height: 20,),
          Divider(
            height: 1,
            color: Colors.grey.shade800,
            thickness: 1,
            indent: 12.0,
            endIndent: 12.0,
          ),

        ],
      ),
    );
  }
}
