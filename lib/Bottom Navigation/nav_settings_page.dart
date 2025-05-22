import 'package:flutter/material.dart';
import 'package:news_app_ui/screens/Login%20Pages%20UI/login_page.dart';
import 'package:news_app_ui/utils/utils_helper.dart';

class NavSettingsPage extends StatelessWidget {
  const NavSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text("Settings"),
      centerTitle: true,
     ),
     body: Padding(
       padding: const EdgeInsets.all(11.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Center(
           child: Container(
            width: double.infinity,
            height: 220,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 11.0),
              child: Column(
                children: [
                 CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/images/news_app_bg1.png"),
                 ),
                 SizedBox(height: 20,),
                 Text("Ideal User" , style: mTextStyle16(),),
                 SizedBox(height: 5,),
                 Text("idealuser@gmail.com" ,style: mTextStyle12(),),
                 Divider(thickness: 1, color: Colors.black,),
                ],
              ),
            ),
           ),
         ),
         mRow("App Language"), SizedBox(height: 20,),
         mRow("News Language"), SizedBox(height: 20,),
         mRow("Player Settings"), SizedBox(height: 20,),
         mRow("Preferred Topics"), SizedBox(height: 20,),
         mRow("Local News Settings"), SizedBox(height: 20,),
         mRow("About Us"), SizedBox(height: 20,),
         TextButton(
          onPressed: (){
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
             child: mRow("Log Out")),
        ],
       ),
     ),
    );
  }
  
  Row mRow(String mMsg){
   return Row(
    children: [
     Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey
      ),
     ), SizedBox(width: 20,),
     Text(mMsg, style: mTextStyle16(),),
    ],
   );
  }
  
}

