import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData video = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData video_1 = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bell = IconData(0xf3bc, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class bms extends StatefulWidget {
  const bms({super.key});

  @override
  State<bms> createState() => _bmsState();
}

class _bmsState extends State<bms> {

  List<Map<String, dynamic>> nav = [
    {'icon': MyFlutterApp.video, 'cap': 'Movies'},
    {'icon': Icons.sports_handball, 'cap': 'Sports'},
    {'icon': Icons.slow_motion_video_outlined, 'cap': 'Stream'},
    {'icon': Icons.settings, 'cap': 'Workshop'},
    {'icon': Icons.theater_comedy_outlined, 'cap': 'Comedy Shows'},
    {'icon': Icons.child_care_outlined, 'cap': 'Kids Zone'},
    {'icon': Icons.menu, 'cap': 'Kids Zone'},
  ];

  List<Map<String, dynamic>> ads = [
    {'image': 'images/galaxys24.jpg'},
    {'image': 'images/gb.jpg'},
    {'image': 'images/pvr ad.jpg'},

  ];

  List<Map<String, dynamic>> movies = [
    {'image': 'images/avesham.jpg'},
    {'image': 'images/gk.jpg'},
    {'image': 'images/gl.jpg'},
    {'image': 'images/gli.jpg'},
    {'image': 'images/mfi.jpg'},
    {'image': 'images/pc.jpg'},
    {'image': 'images/vsh.jpg'},


  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                          'It All Starts Here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Trivandrum >',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.red
                        ),
                      ),
                    ]

                ),
              ],
            ),
            actions: [
              Icon(Icons.search,color: Colors.black45,),
              SizedBox(width: 15),
              Icon(Icons.doorbell,color: Colors.black45,),
              SizedBox(width: 15),
              Icon(Icons.qr_code_outlined,color: Colors.black45,),
              SizedBox(width: 15),

            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20.0),
              child: Divider(color: Colors.black45,),
            ),

          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: nav.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 8,right: 10),
                          child: Column(
                            children: [
                              Icon(nav[index]['icon'], size: 35, color: Colors.black54),
                              SizedBox(height: 10),
                              Text('${nav[index]['cap']}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                height: 215,
                                width: 420,
                                child: AspectRatio(
                                  aspectRatio: 16/10,
                                  child: Image(
                                    image: AssetImage(ads[index]['image']),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              SizedBox(height: 25,),
                            ],
                          ),
                        );
                      }, itemCount: ads.length,

                    ),
                  ),
                  Container(
                    height: 100,
                    width: 380,
                    child: Image(image: AssetImage('images/prime.jpg',),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      SizedBox(width: 14,),
                       Text('Recommended Movies',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 22,
                       ),),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                        Expanded(
                          child: Container(
                            height: 300,
                            child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 1), // Adjust margin here

                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(),
                                      height: 300, // Set a fixed height for the container
                                      width: 200, // Set a fixed width for the container
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                            image: AssetImage(movies[index]['image']),
                                          fit: BoxFit.fill
                                        )
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            },itemCount: movies.length,
                            ),
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
