import 'package:flutter/material.dart';
import 'package:hacknsu3_sust_dynamo/const.dart';
import 'package:hacknsu3_sust_dynamo/screens/patient_home/tabs/patient_profiledit_page.dart';

import 'tabs/home.dart';
import 'tabs/notification.dart';
import 'tabs/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    Noti(),
    Profile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenH * .9,
          width: screenW,
          child: PageStorage(
            child: currentScreen,
            bucket: bucket,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //home tab
                MaterialButton(
                  minWidth: screenW / 3,
                  onPressed: () {
                    setState(() {
                      currentScreen = Home();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab == 0 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),

                MaterialButton(
                  minWidth: screenW / 3,
                  onPressed: () {
                    setState(() {
                      currentScreen = Noti();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: currentTab == 1 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Notifications',
                        style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: screenW / 4,
                  onPressed: () {
                    setState(() {
                      currentScreen = patient_profEdit();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: currentTab == 2 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
