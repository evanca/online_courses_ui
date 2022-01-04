import 'package:flutter/material.dart';
import 'package:online_courses_ui/constants/theme.dart';

class GraduationScreen extends StatelessWidget {
  final String courseName;

  const GraduationScreen({Key? key, required this.courseName})
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Congratulations, Daria!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            MyTheme.mediumVerticalPadding,
            Text("You have successfully completed $courseName course!",
                style: const TextStyle(fontSize: 18)),
            MyTheme.mediumVerticalPadding,
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "View Certificate",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
            MyTheme.largeVerticalPadding,
            const Expanded(
              child: Image(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/graduation.png')),
            )
          ],
        ),
      ),
    );
  }
}
