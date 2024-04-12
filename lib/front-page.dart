import 'package:flutter/material.dart';
import 'package:wallpaper1/subCategoru.dart';
import '/main.dart';



class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Map<String, dynamic>> categories = [];

  @override
  void initState() {
    super.initState();

  }

  List<String> images = [
    "assets/1.jpeg",
    "assets/2.jpeg",
    "assets/3.jpeg",
    "assets/4.jpeg",
    "assets/5.jpeg",
    "assets/6.jpeg",
    "assets/7.jpeg",
    // "https://raw.githubusercontent.com/PashkaSm/test-json/main/image/388765031209b7cd075fe33d4e0a143e.png",
    // "https://raw.githubusercontent.com/PashkaSm/test-json/main/image/388765031209b7cd075fe33d4e0a143e.png",
    // "https://images.pexels.com/photos/7037125/pexels-photo-7037125.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    // "https://images.pexels.com/photos/8803905/pexels-photo-8803905.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    // "https://images.pexels.com/photos/9556451/pexels-photo-9556451.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    // "https://images.pexels.com/photos/10050591/pexels-photo-10050591.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    // "https://images.pexels.com/photos/9000160/pexels-photo-9000160.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    // "https://images.pexels.com/photos/9676202/pexels-photo-9676202.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    // "https://images.pexels.com/photos/9308054/pexels-photo-9308054.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  ];
  List<String> nameCategory = [
    "Anime",
    "Nature",
    "Car",
    "assets/4.jpeg",
    "assets/5.jpeg",
    "assets/6.jpeg",
    "assets/7.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Wallpaper'),
        ),
        actions: [
          // You can add additional actions on the right side of the AppBar if needed
          IconButton(
            icon: Icon(Icons.menu),
            // Replace 'Icons.search' with your desired icon
            onPressed: () {
              // runApp( MaterialApp(
              //     home: MyApp1()));
            },
          ),
        ],
        backgroundColor: Color(0xFF313866),
      ),
      body:
      Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF313866), // #0B0F30
                Color(0xFF504099), // #040614
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child:  ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDetailScreen(
                                category: nameCategory[index],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15.0),
                          child: Container(
                            height: 153.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                image: ExactAssetImage(images[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container (
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x11FE7BE5 ),// #0B0F30
                                    Color(0x22974EC3 ), // #040614
                                  ],
                                  stops: [
                                    0.6,
                                    0.9
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child:Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child:
                                  Text(
                                    nameCategory[index],
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
