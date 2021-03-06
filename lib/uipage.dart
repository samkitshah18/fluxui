import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' as v_math;
import 'package:google_fonts/google_fonts.dart';
import 'package:fluxui/animation.dart';
import 'package:path_drawing/path_drawing.dart';

class UIPage extends StatefulWidget {
  @override
  _UIPageState createState() => _UIPageState();
}

class _UIPageState extends State<UIPage> {
  List<Map> fav = [
    {'url': 'assets/images/adidas.png', 'title': 'adidas'},
    {'url': 'assets/images/airbnb.png', 'title': 'Airbnb'},
    {'url': 'assets/images/coldstone.png', 'title': 'Cold Stone'},
    // {'url': 'assets/images/fl.png', 'title': 'Foot Lock'},
    // {'url': 'assets/images/hnm.png', 'title': 'H & M'},
    // {'url': 'assets/images/ikea.png', 'title': 'Ikea'},
    // {'url': 'assets/images/mcd.png', 'title': 'MC Donalds'},
    // {'url': 'assets/images/adidas.png', 'title': 'adidas'},
    // {'url': 'assets/images/airbnb.png', 'title': 'Airbnb'},
    // {'url': 'assets/images/coldstone.png', 'title': 'Cold Stone'},
    // {'url': 'assets/images/fl.png', 'title': 'Foot Lock'},
    // {'url': 'assets/images/hnm.png', 'title': 'H & M'},
    // {'url': 'assets/images/ikea.png', 'title': 'Ikea'},
    // {'url': 'assets/images/mcd.png', 'title': 'MC Donalds'},
    // {'url': 'assets/images/adidas.png', 'title': 'adidas'},
    // {'url': 'assets/images/airbnb.png', 'title': 'Airbnb'},
    // {'url': 'assets/images/coldstone.png', 'title': 'Cold Stone'},
    // {'url': 'assets/images/fl.png', 'title': 'Foot Lock'},
    // {'url': 'assets/images/hnm.png', 'title': 'H & M'},
    // {'url': 'assets/images/ikea.png', 'title': 'Ikea'},
    // {'url': 'assets/images/mcd.png', 'title': 'MC Donalds'},
  ];

  //var color = (Colors.deepPurple[50]);
  ScrollController controller = ScrollController();
  var expand = true;
  late List<Widget> listItems;
  var height;
  var width;
  double topContainer = 0;
  //bool closeTopContainer = false;
  bool loadAllFav = false;
  var color1 = Color(0xFF7041EE);
  var color = Color(0xFFE9E9FF);
  var bordercolor = (Colors.grey[700])!;
  final Shader linearGradientText = LinearGradient(
    colors: <Color>[Color(0xFF7041EE), Color(0xffE9D9FB)],
  ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));

  void getfavdata() {
    if (fav.length < 10) {
      fav = fav.sublist(0, fav.length);
    } else {
      fav = fav.sublist(0, 10);
    }
    print(fav.length);
  }

  @override
  void initState() {
    super.initState();
    getfavdata();
    controller.addListener(() {
      setState(() {
        double value = controller.offset / (height * 0.18 * 0.6);
        topContainer = value;
        if (controller.offset > height * 0.18 * 0.6) {
          expand = false;
        } else {
          expand = true;
        }
        //closeTopContainer = controller.offset > 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    setState(() {
      height = size.height;
      width = size.width;
    });
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandedSection(
                expand: expand,
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
                    // Material(
                    //   elevation: 5,
                    //   child: 
                      Container(
                        height: height * 0.06,
                        width: width * 0.91,
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.002),
                        margin: EdgeInsets.fromLTRB(0, height * 0.01, 0, 0),
                        decoration: BoxDecoration(
                          boxShadow:
                          //kElevationToShadow[4],
                           [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: width * 0.005,
                              spreadRadius: width * 0.0005,
                              offset: Offset(width * 0.007, height * 0.005),
                            ),
                          ],
                          border: Border.all(
                            color: color1,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.03),
                          color: color,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: color1,
                              fontSize: height * 0.024,
                            ),
                            hintText: "Search for my favorite brand",
                            prefixIcon: Icon(
                              Icons.search,
                              size: height * 0.045,
                              color: color1,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    //),
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
                      height: fav.length > 5 ? height * 0.24 : height * 0.135,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01, vertical: height * 0.01),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      child: Column(
                        children: [
                          favContainer(0, min(fav.length, 5)),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          if(fav.length >= 5)
                          favContainer(5, min(fav.length, 10))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.018,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
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
              if(expand)
              SizedBox(
                height: height * 0.02,
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 500,
                //! Change height 
                //height: !expand ? height * 0.2 : height * 0.18 * 14 * 0.7 + height * 0.18,
                //height: expand ? height * 0.3 : height,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                        child: ListView.builder(
                            controller: controller,
                            itemCount: 10,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              double scale = 1.0;
                              if (topContainer > 0.5) {
                                scale = index + 0.5 - topContainer;
                                if (scale < 0) {
                                  scale = 0;
                                } else if (scale > 1) {
                                  scale = 1;
                                }
                              }
                              return Opacity(
                                opacity: scale,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..scale(scale, scale),
                                  alignment: Alignment.bottomCenter,
                                  child: Align(
                                    heightFactor: 0.6,
                                    alignment: Alignment.topCenter,
                                    child: card(
                                      [Color(0xFFFFCF71), Color(0xFF2376DD)],
                                      height,
                                      width,
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget favContainer(start, end) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: fav.sublist(start, end).map((e) {
          print(fav.length);
          return Container(
            width: width * 0.18,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        spreadRadius: width * 0.005,
                        blurRadius: width * 0.005,
                        offset: Offset(width * 0.007, height * 0.005),
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
                  e['title'],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: height * 0.022,
                  ),
                ),
              ],
            ),
          );
        }).toList());
  }

  Widget catagories(String title, String img, double height, double width) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                spreadRadius: width * 0.005,
                blurRadius: width * 0.01,
                offset: Offset(width * 0.007, height * 0.005),
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
        SizedBox(
          width: 70,
          child: Center(
              child: Text(
            title,
            overflow: TextOverflow.ellipsis,
          )),
        )
      ],
    );
  }

  Widget card(List<Color> linearGradientCard, double height, double width) {
    return CustomPaint(
      foregroundPainter: TimelinePainter(context, height * 0.035, width * 0.1),
      child: ClipPath(
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
                margin: EdgeInsets.fromLTRB(
                    width * 0.05, height * 0.04, width * 0.05, 0),
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

class TimelinePainter extends CustomPainter {
  TimelinePainter(
    this.context,
    this.right,
    this.holeRadius,
  );
  final right;
  final holeRadius;
  BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    // print('size of canvas= h${size.height} & w${size.width}');
    var path = Path();

    path.moveTo(20, size.height - right - holeRadius + 18);
    path.lineTo(size.width - 20, size.height - right - holeRadius + 18);

    canvas.drawPath(
        dashPath(path, dashArray: CircularIntervalList([15.0, 7.0])), paint);
  }

  @override
  bool shouldRepaint(CustomPainter delegate) {
    return false;
  }
}
