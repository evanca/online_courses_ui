import 'package:flutter/material.dart';
import 'package:online_courses_ui/constants/theme.dart';
import 'package:online_courses_ui/ui/course_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth ??= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          MyTheme.largeVerticalPadding,
          const Text(
            "Hi, Daria!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          MyTheme.mediumVerticalPadding,
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.search, color: MyTheme.grey),
                Text(
                  "Seach our 1000+ courses",
                  style: TextStyle(color: MyTheme.grey),
                )
              ],
            ),
          )),
          SizedBox(
            height: screenWidth! / 2,
            child: Stack(alignment: Alignment.topCenter, children: [
              Column(
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 3,
                      child: Card(
                        color: MyTheme.catalogueCardColor,
                        child: Container(
                          width: double.infinity,
                        ),
                      ))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 0, 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Expanded(
                                    child: FittedBox(
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Advance your \ncareer now",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Catalog",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                  const Expanded(
                      flex: 3,
                      child: Image(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/catalog.png')))
                ],
              )
            ]),
          ),
          MyTheme.largeVerticalPadding,
          Row(
            children: const [
              Text("Trending courses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.tune)
            ],
          ),
          GridView.count(
            childAspectRatio: 0.75,
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              courseCard(
                  courseImage: const AssetImage('assets/tv.png'),
                  courseName: "How to become a YouTuber",
                  courseInfo: "Estimated 8 weeks",
                  coursePrice: "\$4.89"),
              courseCard(
                  courseImage: const AssetImage('assets/html.png'),
                  courseName: "Basic HTML for Dummies",
                  courseInfo: "Estimated 6 weeks",
                  coursePrice: "\$4.89"),
              courseCard(
                  courseImage: const AssetImage('assets/cryptocurrency.png'),
                  courseName: "Introduction to Bitcoin",
                  courseInfo: "Estimated 11 weeks",
                  coursePrice: "\$6.49"),
              courseCard(
                  courseImage: const AssetImage('assets/globe.png'),
                  courseName: "The Internet of Things",
                  courseInfo: "Estimated 10 weeks",
                  coursePrice: "\$6.49"),
            ],
          )
        ],
      ),
    );
  }

  Widget courseCard(
      {required AssetImage courseImage,
      required String courseName,
      required String courseInfo,
      required String coursePrice}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CourseScreen(
                    courseName: courseName,
                    courseImage: courseImage,
                    courseInfo: courseInfo,
                    coursePrice: coursePrice,
                  )),
        );
      },
      child: Card(
          color: MyTheme.courseCardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: screenWidth! < 400 ? 3 : 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: courseImage,
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(courseName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(courseInfo,
                            style:
                                TextStyle(fontSize: 12, color: MyTheme.grey)),
                        MyTheme.smallVerticalPadding,
                        Text(
                          coursePrice,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
