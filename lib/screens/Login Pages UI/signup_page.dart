import 'package:flutter/material.dart';

import '../../utils/utils_helper.dart';
class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var userNameTextController = TextEditingController();

  var emailTextController = TextEditingController();

  var numberTextController = TextEditingController();

  var passwordTextController = TextEditingController();

  String selectedOption = 'Media Reporter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Text("NEWS Nation" , textAlign: TextAlign.center ,style: mTextStyle32(
                    mColor: Colors.blue,
                    mFontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(
                height: 30,
              ),
              mTextField(
                mController: userNameTextController,
                mHintText: "Username",
              ),

              SizedBox(
                height: 30,
              ),
              mTextField(
                mController: emailTextController,
                mHintText: "email",
              ),

              SizedBox(
                height: 30,
              ),
              mTextField(
                mController: numberTextController,
                mHintText: "phone",
              ),

              SizedBox(
                height: 30,
              ),
              mTextField(
                mController: passwordTextController,
                mHintText: "password",
              ),

              SizedBox(height: 20,),
              Text("I am a", style: mTextStyle16(),),

              Row(
                children: [
                  Radio(
                      value: 'Media Reporter',
                      groupValue: selectedOption,
                      onChanged: (String? value){
                        selectedOption;
                        setState(() {});
                      }),
                  Text("Media Reporter"),
                  Radio(
                      value: 'Visitor',
                      groupValue: selectedOption,
                      onChanged: (String? value){
                        setState(() {});
                      }),
                  Text("Visitor"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
