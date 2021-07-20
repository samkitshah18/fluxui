import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' as v_math;
import 'package:google_fonts/google_fonts.dart';

class UIPage extends StatefulWidget {
  @override
  _UIPageState createState() => _UIPageState();
}

class _UIPageState extends State<UIPage> {
  List<Map> fav = [
    {'url': 'assets/images/adidas.png', 'title': 'adidas'},
    {'url': 'assets/images/airbnb.png', 'title': 'Airbnb'},
    {'url': 'assets/images/coldstone.png', 'title': 'Cold Stone'},
    {'url': 'assets/images/fl.png', 'title': 'Foot Lock'},
    {'url': 'assets/images/hnm.png', 'title': 'H & M'},
    {'url': 'assets/images/ikea.png', 'title': 'Ikea'},
    {'url': 'assets/images/mcd.png', 'title': 'MC Donalds'},
    {'url': 'assets/images/adidas.png', 'title': 'adidas'},
    {'url': 'assets/images/airbnb.png', 'title': 'Airbnb'},
    {'url': 'assets/images/coldstone.png', 'title': 'Cold Stone'},
    {'url': 'assets/images/fl.png', 'title': 'Foot Lock'},
    {'url': 'assets/images/hnm.png', 'title': 'H & M'},
    {'url': 'assets/images/ikea.png', 'title': 'Ikea'},
    {'url': 'assets/images/mcd.png', 'title': 'MC Donalds'},
    {'url': 'assets/images/adidas.png', 'title': 'adidas'},
    {'url': 'assets/images/airbnb.png', 'title': 'Airbnb'},
    {'url': 'assets/images/coldstone.png', 'title': 'Cold Stone'},
    {'url': 'assets/images/fl.png', 'title': 'Foot Lock'},
    {'url': 'assets/images/hnm.png', 'title': 'H & M'},
    {'url': 'assets/images/ikea.png', 'title': 'Ikea'},
    {'url': 'assets/images/mcd.png', 'title': 'MC Donalds'},
  ];

  //var color = (Colors.deepPurple[50]);
  bool loadAllFav = false;
  var color1 = Color(0xFF7041EE);
  var color = Color(0xFFE9E9FF);
  var bordercolor = (Colors.grey[700])!;
  final Shader linearGradientText = LinearGradient(
    colors: <Color>[Color(0xFF7041EE), Color(0xffE9D9FB)],
  ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Flux."),
        // ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.symmetric(vertical: 0, horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Flux.",
                    style: GoogleFonts.montserrat(
                      fontSize: height * 0.07,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradientText,
                      // textStyle:
                      //     TextStyle(color: Colors.blue, letterSpacing: .5),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.06,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: height * 0.002),
                  margin: EdgeInsets.fromLTRB(0, height * 0.01, 0, 0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 3,
                        //offset: Offset(0, 5),
                      ),
                    ],
                    border: Border.all(
                      color: color1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: color,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for my favorite brand",
                      prefixIcon: Icon(
                        Icons.search,
                        size: height * 0.05,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  child: Text(
                    "Category",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    catagories(
                      "Food",
                      "assets/images/food.svg",
                      height,
                      width,
                    ),
                    catagories(
                      "Fashion",
                      "assets/images/fashion.svg",
                      height,
                      width,
                    ),
                    catagories(
                      "Fitness",
                      "assets/images/fitness.svg",
                      height,
                      width,
                    ),
                    catagories(
                      "Entertainment",
                      "assets/images/entertainment.svg",
                      height,
                      width,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    catagories(
                      "Museum",
                      "assets/images/museum.svg",
                      height,
                      width,
                    ),
                    catagories(
                      "Logistics",
                      "assets/images/logistics.svg",
                      height,
                      width,
                    ),
                    catagories(
                      "Travel",
                      "assets/images/travel.svg",
                      height,
                      width,
                    ),
                    catagories(
                      "Grocery",
                      "assets/images/grocery.svg",
                      height,
                      width,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  child: Text(
                    "Favorites",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.018,
                ),
                Container(
                  height: loadAllFav ? height * 0.338 : height * 0.2,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.013, height * 0.010, width * 0.013, 0),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        //margin: EdgeInsets.only(bottom: 10),
                        height: loadAllFav ? height * 0.264 : height * 0.125,
                        child: GridView.builder(
                          itemCount:
                              loadAllFav ? fav.length : min(fav.length, 5),
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: height * 0.12,
                            crossAxisCount: 5,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade500,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        //offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  height: height * 0.07,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "https://img.etimg.com/thumb/msid-59738997,width-640,resizemode-4,imgsize-21421/nike.jpg",
                                    ),
                                    backgroundColor: color,
                                    radius: height * 0.11,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.009,
                                ),
                                Text(
                                  fav[index]['title'],
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: height * 0.022,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        height: 1,
                        thickness: 2,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            loadAllFav = !loadAllFav;
                          });
                        },
                        icon: Icon(
                          loadAllFav
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.018,
                ),
                Container(
                  child: Text(
                    "My Coupon",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.35,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: card(
                          [Color(0xFFFDD819), Color(0xFFE80505)],
                          height,
                          width,
                        ),
                        top: 0,
                      ),
                      Positioned(
                        child: card(
                          [Color(0xFFF0FF00), Color(0xFF58CFFB)],
                          height,
                          width,
                        ),
                        top: height * 0.04,
                      ),
                      Positioned(
                        child: card(
                          [Color(0xFFFFF3B0), Color(0xFFCA26FF)],
                          height,
                          width,
                        ),
                        top: height * 0.08,
                      ),
                      Positioned(
                        child: card(
                          [Color(0xFFFDEB71), Color(0xFFF8D800)],
                          height,
                          width,
                        ),
                        top: height * 0.12,
                      ),
                      Positioned(
                        child: card(
                          [Color(0xFFFFCF71), Color(0xFF2376DD)],
                          height,
                          width,
                        ),
                        top: height * 0.16,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget catagories(String title, String img, double height, double wigth) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                spreadRadius: 1,
                blurRadius: 5,
                //offset: Offset(0, 5),
              ),
            ],
          ),
          child: CircleAvatar(
            child: SvgPicture.asset(
              img,
              //alignment: Alignment.center,
              height: height * 0.06,
              color: color1,
              fit: BoxFit.scaleDown,
            ),
            backgroundColor: color,
            radius: height * 0.04,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
            child: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ))
      ],
    );
  }

  Widget card(List<Color> linearGradientCard, double height, double width) {
    return ClipPath(
      clipper: DolDurmaClipper(height * 0.035, width * 0.1),
      child: Container(
        height: height * 0.18,
        width: width * 0.92,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              stops: [0.3, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: linearGradientCard,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  width * 0.035, height * 0.01, width * 0.035, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "LEGO",
                    style: TextStyle(fontSize: 15),
                  ),
                  Image.asset(
                    "assets/images/Lego.png",
                    // height: 30,
                    // width: 60,
                    // fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Discount 10% for any purchase.",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.002, width * 0.05, 0),
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.003, horizontal: width * 0.01),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                "Valid until 01-June-2021",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: height * 0.017,
                  color: Colors.red,
                ),
              ),
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.05, 40, width * 0.05, 0),
              child: Text(
                "The coupon cannot be used in Airport branch, IFC mail branch and K11 MUSEA",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper(this.right, this.holeRadius);

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - right - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - right),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - right)
      ..arcToPoint(
        Offset(size.width, size.height - right - holeRadius),
        clockwise: true,
        radius: Radius.circular(1),
      );

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}














// Column(
                    //     children: [
                    //       Container(
                    //         //margin: EdgeInsets.only(bottom: 10),
                    //         height:
                    //             loadAllFav ? height * 0.264 : height * 0.125,
                    //         child: GridView.builder(
                    //           itemCount:
                    //               loadAllFav ? fav.length : min(fav.length, 5),
                    //           //padding: EdgeInsets.zero,
                    //           gridDelegate:
                    //               SliverGridDelegateWithFixedCrossAxisCount(
                    //             mainAxisExtent: height * 0.12,
                    //             crossAxisCount: 5,
                    //             crossAxisSpacing: 0,
                    //             mainAxisSpacing: 0,
                    //           ),
                    //           itemBuilder: (context, index) {
                    //             return Column(
                    //               children: [
                    //                 Container(
                    //                   decoration: BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     boxShadow: [
                    //                       BoxShadow(
                    //                         color: Colors.grey.shade500,
                    //                         spreadRadius: width * 0.007,
                    //                         blurRadius: width * 0.005,
                    //                         offset: Offset(
                    //                             width * 0.007, height * 0.005),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                   height: height * 0.07,
                    //                   child: CircleAvatar(
                    //                     backgroundImage: NetworkImage(
                    //                       "https://img.etimg.com/thumb/msid-59738997,width-640,resizemode-4,imgsize-21421/nike.jpg",
                    //                     ),
                    //                     backgroundColor: color,
                    //                     radius: height * 0.11,
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   height: height * 0.009,
                    //                 ),
                    //                 Text(
                    //                   fav[index]['title'],
                    //                   textAlign: TextAlign.center,
                    //                   overflow: TextOverflow.ellipsis,
                    //                   style: TextStyle(
                    //                     fontSize: height * 0.022,
                    //                   ),
                    //                 ),
                    //               ],
                    //             );
                    //           },
                    //         ),
                    //       ),
                          
                    //     ],
                    //   ),
                    