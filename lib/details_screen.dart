import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_first_flutter/constants.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xfff5f4ef),
              image: DecorationImage(
                  image: AssetImage('assets/images/ux_big.png'),
                  alignment: Alignment.topRight)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 50, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            child:
                                SvgPicture.asset('assets/icons/arrow-left.svg'),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        SvgPicture.asset('assets/icons/more-vertical.svg')
                      ],
                    ),
                    SizedBox(height: 30),
                    ClipPath(
                      clipper: BestSellerClipper(),
                      child: Container(
                        color: BestSellerColor,
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 20, bottom: 5),
                        child: Text('bestseller'.toUpperCase()),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Design Thinking',
                      style: HeadingStyle,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/person.svg'),
                        SizedBox(width: 5),
                        Text('18k'),
                        SizedBox(width: 25),
                        SvgPicture.asset('assets/icons/star.svg'),
                        SizedBox(width: 5),
                        Text('4.8')
                      ],
                    ),
                    SizedBox(height: 20),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '\$50',
                          style: HeadingStyle.copyWith(fontSize: 32)),
                      TextSpan(
                        text: "\$70",
                        style: TextStyle(
                            color: TextColor.withOpacity(0.5),
                            decoration: TextDecoration.lineThrough),
                      )
                    ]))
                  ],
                ),
              ),
              SizedBox(height: 60),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Course Content', style: TitleTextStyle),
                            SizedBox(height: 30),
                            CourseContent(
                              number: '01',
                              duration: 5.15,
                              title: 'welcome to the course',
                              isDone: false,
                            ),
                            CourseContent(
                              number: '02',
                              duration: 8.15,
                              title: 'design principles',
                              isDone: false,
                            ),
                            CourseContent(
                              number: '03',
                              duration: 2.15,
                              title: 'Tools for this course',
                              isDone: true,
                            ),
                            CourseContent(
                              number: '04',
                              duration: 15.15,
                              title: 'First Project',
                              isDone: true,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: -20,
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 50,
                                color: Colors.grey[200],
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(14),
                                height: 56,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Color(0xffffedee),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Icon(
                                  Icons.shop,
                                  size: 30,
                                  color: Colors.red[400],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: BlueColor,
                                  ),
                                  child: Text(
                                    'Buy Now',
                                    style: SubtitleTextStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 0, bottom: 25),
      child: Row(
        children: [
          Text(
            number,
            style: HeadingStyle.copyWith(
              color: TextColor.withOpacity(0.2),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: '$duration mins',
                    style: TextStyle(
                      color: TextColor.withOpacity(.5),
                      fontSize: 18,
                    )),
                TextSpan(
                  text: '\nwelcome to the course',
                  style: SubtitleTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: GreenColor.withOpacity(isDone ? 0.5 : 1)),
            child: Icon(Icons.play_arrow, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
