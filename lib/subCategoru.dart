import 'package:flutter/material.dart';
import '/main.dart';


class CategoryDetailScreen extends StatelessWidget {
  final String category;

  CategoryDetailScreen({required this.category});

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
  List<String> subName = [
    "assets/1.jpeg",
    "assets/2.jpeg",
    "assets/3.jpeg",
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
          child: Text(category),
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
      body: Container(
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
                // showDialog(
                //   context: context,
                //   barrierDismissible: false,
                //   builder: (context) {
                //     return AlertDialog(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
                //       backgroundColor: Color(0xFF0E164A),
                //       title:
                //       Row(
                //         children: <Widget>[
                //           IconButton(onPressed: (){ Navigator.of(context).pop(); bannermain.createAdaptiveBanner();}, icon: Icon(Icons.arrow_back,color: Color(0xffD0E9FF),)),
                //           SizedBox(width:8.0),
                //           Text( category['subcategory'][index]['name'],style: TextStyle(color: Color(0xffD0E9FF),fontFamily:"Inria_Sans",fontSize: 22 ),),
                //         ],
                //       ),
                //       content: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Image.network( category['subcategory'][index]['image']),
                //           SizedBox(height: 8.0),
                //           Text(category['subcategory'][index]['description'],style: TextStyle(color: Color(0xffD0E9FF),fontFamily:"Inria_Sans",fontSize:16,),),
                //         ],
                //       ),
                //       actions: [
                //         Container(
                //             width: MediaQuery.of(context).size.width, // Full Width of Screen
                //             child: Column( mainAxisAlignment: MainAxisAlignment.center, children: [
                //               Container(
                //                 width: MediaQuery.of(context).size.width * 0.65, // Full Width of Screen
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(12.0),
                //                   color: Color(0xff262F6D),
                //                 ),
                //                 child: TextButton(
                //                   onPressed: () {
                //                     AdsAdd fullScrinInfo = AdsAdd();
                //                     fullScrinInfo.inititalize();
                //                     fullScrinInfo.showInterstitial();
                //                     Navigator.push(
                //                       context,
                //                       MaterialPageRoute(
                //                         builder: (context) => ProductDetailScreen(
                //                           prod: category['subcategory'][index],
                //                         ),
                //                       ),
                //                     );
                //
                //                   },
                //                   child: Text('Next',style: TextStyle(
                //                       color: Color(0xffD0E9FF),
                //                       fontSize: 20,
                //                       fontFamily: 'Inria_Sans'
                //                   ),
                //                   ),
                //                 ),
                //               )
                //
                //             ])
                //         )
                //       ],
                //     );
                //   },
                // );
              },
              child: Container(
                margin: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                    image: ExactAssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x11FE7BE5), // #0B0F30
                        Color(0x22974EC3), // #040614
                      ],
                      stops: [0.6, 0.9],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      subName[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inria_Sans',
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
