import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_first_flutter/constants.dart';
import 'package:my_first_flutter/details_screen.dart';
import 'package:my_first_flutter/model/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(),
      //home: HomeScreen(),
      routes: {
        '/': (context) => HomeScreen(),
        '/ux-design': (context) => DetailsScreen()
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset('assets/icons/menu.svg'),
                  Image.asset('assets/images/user.png')
                ]),
            SizedBox(height: 30),
            Text('Hey alex', style: HeadingStyle),
            Text(
              'Find a course you want to learn',
              style: SubheadingStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xfff5f5f7),
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/search.svg'),
                  SizedBox(width: 10),
                  Text('search for anything')
                ],
              ),
            ), //the gray box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Category',
                  style: TitleTextStyle,
                ),
                Text(
                  'see all',
                  style: SubtitleTextStyle.copyWith(color: BlueColor),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: categories.length,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: index.isEven ? 200 : 240,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: AssetImage(categories[index].image))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(categories[index].name,
                                  style: TitleTextStyle),
                              Text(
                                '${categories[index].numOfCourse} Courses',
                                style:
                                    TextStyle(color: TextColor.withOpacity(.6)),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          if (categories[index].name == 'UX Design') {
                            Navigator.pushNamed(context, '/ux-design');
                          }
                          //if()
                        },
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1)))
          ],
        ),
      ),
    );
  }
}
