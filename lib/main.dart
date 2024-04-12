import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:system_theme/system_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'Modal/ModalAds.dart';
import 'front-page.dart';

void main() =>
    runApp(
        MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen",
      system = "System";

  late Stream<String> progressString;
  late String res;
  bool downloading = false;
  List<String> images = [
    "assets/1.jpeg",
    "assets/2.jpeg",
    "assets/3.jpeg",
    "assets/4.jpeg",
    "assets/5.jpeg",
    "assets/6.jpeg",
    "assets/7.jpeg",
    "assets/8.jpeg",
    "assets/9.jpeg",
    "assets/10.jpeg",
    "assets/11.jpeg",
    "assets/12.jpeg",
    "assets/13.jpeg",
  ];
  var result = "Waiting to set wallpaper";
  bool _isDisable = true;

  int nextImageID = 0;

  Future show(String path) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;

    // Отримайте байтовий потік зображення з assets
    final byteData = await rootBundle.load(path);
    final bytes = byteData.buffer.asUint8List();

    // Запишіть зображення в тимчасовий каталог
    final tempFile = File('$tempPath/myimage.jpeg');
    await tempFile.writeAsBytes(bytes);
    var width = MediaQuery
        .of(context)
        .size
        .width * 2;
    var height = MediaQuery
        .of(context)
        .size
        .height * 2;
    home = await Wallpaper.homeScreen(
        options: RequestSizeOptions.RESIZE_FIT,
        width: width,
        height: height);
    print("Task Done");
    _showWallpaperInstalledDialog(context);
  }
  AdsAdd banner = AdsAdd();

  @override
  void initState() {
    super.initState();
    banner.createAdaptiveBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Lethal Company Wallpaper'),
          ),
          backgroundColor: Color(0xFF2A0609),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2A0609),
                  Color(0xFF922633), // #0B0F30
                  // #040614
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.5),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      AdsAdd fullscrin = AdsAdd();
                      fullscrin.inititalize();
                      fullscrin.showInterstitial();
                      show(images[index]);
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

                      ),
                    ),
                  );
                })
        ));
  }
}

void _showWallpaperInstalledDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WallpaperInstalledDialog();
    },
  );
}

class WallpaperInstalledDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Wallpaper Installed',style: TextStyle(color: Colors.white,),),
      content: Text('Wallpaper has been successfully installed!',style: TextStyle( color: Colors.white,),),
      backgroundColor: Color(0xFF2A0609),
      elevation: 15,
      contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'OK',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
