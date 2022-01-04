import 'package:flutter/material.dart';
import 'package:online_courses_ui/constants/theme.dart';

import 'graduation_screen.dart';

class CourseScreen extends StatelessWidget {
  final String courseName;
  final AssetImage courseImage;
  final String courseInfo;
  final String coursePrice;

  const CourseScreen(
      {Key? key,
      required this.courseName,
      required this.courseImage,
      required this.courseInfo,
      required this.coursePrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.courseCardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: MyTheme.catalogueButtonColor),
      ),
      body: Stack(
        children: [
          Column(children: [
            Expanded(
              flex: 35,
              child: Center(
                child: Image(
                  image: courseImage,
                ),
              ),
            ),
            const Spacer(
              flex: 65,
            )
          ]),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.0))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: MyTheme.grey.withOpacity(0.5),
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(1.0))),
                          height: 4,
                          width: 48,
                        ),
                      ),
                      MyTheme.mediumVerticalPadding,
                      Text(courseName,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(courseInfo,
                          style: TextStyle(fontSize: 16, color: MyTheme.grey)),
                      MyTheme.largeVerticalPadding,
                      Row(
                        children: [
                          Text(coursePrice,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Column(
                              children: [
                                const Text("Progress: 100%"),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      32.0, 4.0, 32.0, 8.0),
                                  height: 10,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: 1,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          MyTheme.progressColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      MyTheme.mediumVerticalPadding,
                      const Text(
                        "Learn the basics of lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        style: TextStyle(fontSize: 16),
                      ),
                      MyTheme.mediumVerticalPadding,
                      Row(
                        children: [
                          const Spacer(
                            flex: 2,
                          ),
                          Expanded(
                            flex: 4,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GraduationScreen(
                                              courseName: courseName,
                                            )),
                                  );
                                },
                                child: const Text(
                                  "Graduate",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                          ),
                          const Spacer(
                            flex: 2,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
