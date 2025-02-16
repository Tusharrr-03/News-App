import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

List<Map<String , dynamic>> mNews = [
  {
    'bg_image' : "assets/images/news_app_bg1.png",
    'hot_text' : "🔥Hot",
    'nature_text' : 'Nature',
    'animal_text' : "Animal",
    'cnbc_logo' : "assets/images/cnbc_bg_icon.png",
    'cnbc_text' : 'Cnbc News',
    'time_text' : '1h Ago',
    'heart_icon' : Iconsax.heart,
    'heart_text' : "5.2k",
    'message_icon' : Iconsax.message,
    'message_text' : "23k",
    'news_desc' : "Scientist just found the Lost Species of Jellyfish\nthat went extinct 25 millions years Ago !",
  },
  {
    'bg_image' : "assets/images/news_app_bg2.png",
    'hot_text' : "🔥Hot",
    'nature_text' : 'Nature',
    'animal_text' : "Animal",
    'cnbc_logo' : "assets/images/cnbc_bg_icon.png",
    'cnbc_text' : 'Cnbc News',
    'time_text' : '1h Ago',
    'heart_icon' : Iconsax.heart,
    'heart_text' : "5.2k",
    'message_icon' : Iconsax.message,
    'message_text' : "23k",
    'news_desc' : "Scientist just found the Lost Species of Jellyfish\nthat went extinct 25 millions years Ago !",
  },
  {
    'bg_image' : "assets/images/news_app_bg3.png",
    'hot_text' : "🔥Hot",
    'nature_text' : 'Nature',
    'animal_text' : "Animal",
    'cnbc_logo' : "assets/images/cnbc_bg_icon.png",
    'cnbc_text' : 'Cnbc News',
    'time_text' : '1h Ago',
    'heart_icon' : Iconsax.heart,
    'heart_text' : "5.2k",
    'message_icon' : Iconsax.message,
    'message_text' : "23k",
    'news_desc' : "Scientist just found the Lost Species of Jellyfish\nthat went extinct 25 millions years Ago !",
  },
  {
    'bg_image' : "assets/images/news_app_bg1.png",
    'hot_text' : "🔥Hot",
    'nature_text' : 'Nature',
    'animal_text' : "Animal",
    'cnbc_logo' : "assets/images/cnbc_bg_icon.png",
    'cnbc_text' : 'Cnbc News',
    'time_text' : '1h Ago',
    'heart_icon' : Iconsax.heart,
    'heart_text' : "5.2k",
    'message_icon' : Iconsax.message,
    'message_text' : "23k",
    'news_desc' : "Scientist just found the Lost Species of Jellyfish\nthat went extinct 25 millions years Ago !",
  },
];

List<Map<String , dynamic>> mButtons = [
  {
    'text' : 'All',
  },
  {
    'text' : 'Politics',
  },
  {
    'text' : 'Sports',
  },
  {
    'text' : 'Nature',
  },
  {
    'text' : 'Education',
  },
  {
    'text' : 'Foriegn Affairs',
  },
  {
    'text' : 'Automotive',
  },
];


class NavHomePage extends StatefulWidget {
  const NavHomePage({super.key});

  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              /// Profile Structure of the app
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset("assets/images/tusharprofile.jpg" , fit: BoxFit.cover,),
                        ),
                      ),SizedBox(width: 7,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome" , style: TextStyle(fontSize: 16 , color: Colors.black54),),
                            Text("Tushar Goyal!" , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),Expanded(child: SizedBox(width: 10,)),
                      Container(
                        child: Icon(Iconsax.notification , color: Colors.black,),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),

              /// TextField Area for search
              Container(
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      prefixIcon: Icon(Iconsax.search_normal , color: Colors.black54,),
                      hintText: "Let's see what happend today",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white),
                      ),focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white),
                  )
                  ),
                ),
              ),
              SizedBox(height: 20,),

              /// Heading Before news section
              Container(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Breaking News !" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                    Text("See all" , style: TextStyle(color: Colors.blue )),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              /// News Cards Sections
              Container(
                width: 450,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: mNews.length,
                    itemBuilder: (context , index){
                      return  Card(
                        child: Stack(
                          children: [

                            /// BackGround Image
                            Container(
                              height : 220,
                              width: 320,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(21),
                                child: Image.asset(mNews[index]['bg_image'] , fit: BoxFit.cover,),
                              ),
                            ),

                            /// Hot Text
                            Positioned(
                                top: 20,
                                left: 20,
                                child: Container(
                                  width: 70,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10)
                                  ),child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(mNews[index]['hot_text'], style: TextStyle(fontSize: 16 , color: Colors.white),textAlign: TextAlign.center,),
                                ),
                                )
                            ),

                            /// Nature Text
                            Positioned(
                                right: 80,
                                top: 20,
                                child: Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0 , left: 3 ,right: 3),
                                    child: Text(mNews[index]['nature_text'], style: TextStyle(color: Colors.white) , textAlign: TextAlign.center,),
                                  ),
                                )
                            ),

                            /// Animal Text
                            Positioned(
                                right: 10,
                                top: 20,
                                child: Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0 , left: 3 ,right: 3),
                                    child: Text(mNews[index]['animal_text'], style: TextStyle(color: Colors.white) , textAlign: TextAlign.center,),
                                  ),
                                )
                            ),

                            /// CNBC news logo
                            Positioned(
                                bottom: 80,
                                left: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(mNews[index]['cnbc_logo'] , width: 30, height: 30, fit: BoxFit.cover,),
                                )
                            ),

                            /// CNBC news Title
                            Positioned(
                              bottom: 85,
                              left: 60,
                              child: Text(mNews[index]['cnbc_text'] , style: TextStyle(color: Colors.white),),
                            ),

                            /// Dot
                            Positioned(
                              bottom: 91,
                              left: 140,
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Color(0XFFFFFFFFFF),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),

                            /// Text Position
                            Positioned(
                              bottom: 85,
                              left: 150,
                              child: Text(mNews[index]['time_text'] ,style: TextStyle(color: Colors.white),),
                            ),

                            /// Icon and Text
                            Positioned(
                                bottom: 85,
                                right: 80,
                                child: Row(
                                  children: [
                                    Icon(mNews[index]['heart_icon'] , color: Color(0XFFFFFFFFFF), size: 16,),SizedBox(width: 5,),
                                    Text(mNews[index]['heart_text'] , style: TextStyle(color: Colors.white),),
                                  ],
                                )
                            ),

                            /// Icon and Text
                            Positioned(
                                bottom: 85,
                                right: 20,
                                child: Row(
                                  children: [
                                    Icon(mNews[index]['message_icon'], color: Color(0XFFFFFFFFFF), size: 16,),SizedBox(width: 5,),
                                    Text(mNews[index]['message_text'], style: TextStyle(color: Colors.white),),
                                  ],
                                )
                            ),

                            /// News Desc
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: Text(mNews[index]['news_desc'] , style: TextStyle(color: Colors.white , fontSize: 13),textAlign: TextAlign.justify,),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),
              SizedBox(height: 20,),

              /// Second Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending Right Now", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                  Text("See all" , style: TextStyle(color: Colors.blue),)
                ],
              ),
              SizedBox(height: 20,),

              /// Container Button
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(mButtons.length, (index) =>
                      InkWell(
                        onTap: (){
                          selectedIndex = index;
                          setState(() {

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedIndex == index ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 12),
                            child: Text(mButtons[index]['text'] , textAlign: TextAlign.center, style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: selectedIndex == index ? Colors.white : Colors.black),),
                                        ),
                                        ),
                        ),
                      ),),
                ),
              ),
              SizedBox(height: 20,),

              /// Container List Tile
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/images/bg_bmw.jpg" , fit: BoxFit.cover,),
                        ),
                      ),SizedBox(width: 6,),
                      Container(
                        width: 245,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Technology // Automotive " , style: TextStyle(color: Colors.grey),),SizedBox(height: 5,),
                            Text("Get Ready , Flying Car Already Tested on a Mass Scale" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold),),SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width : 125,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset("assets/images/tusharprofile.jpg" , width: 40, height: 40, fit: BoxFit.cover,),
                                      ),SizedBox(width: 5,),
                                      Text("Tushar" , style: TextStyle(color: Colors.black54),),SizedBox(width: 5,),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.grey,
                                        ),
                                      ),SizedBox(width: 5,),
                                      Text("6h" , style: TextStyle(color: Colors.black54),),
                                    ],
                                  )
                                ),
                                Container(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      Icon(Iconsax.heart , size: 16, color: Colors.grey,),
                                      Text("4k" , style: TextStyle(color: Colors.black54),),SizedBox(width: 10,),
                                      Icon(Iconsax.message , size: 16, color: Colors.grey,),
                                      Text("3.5k" , style: TextStyle(color: Colors.black54),),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
