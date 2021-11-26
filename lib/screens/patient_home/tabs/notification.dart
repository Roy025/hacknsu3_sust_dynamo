import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacknsu3_sust_dynamo/backend/data/model/doctor_info.dart';
import 'package:hacknsu3_sust_dynamo/const.dart';
import 'package:hacknsu3_sust_dynamo/screens/make_appointment/make_appointment.dart';

class Noti extends StatefulWidget {
  const Noti({Key? key}) : super(key: key);

  @override
  _NotiState createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  var pageViewController = PageController();
  var currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.0, screenH * .05, 8, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async {
                    await pageViewController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutCubic,
                    );
                    setState(() {
                      currentPage = 0;
                    });
                  },
                  child: Text(
                    'Upcoming',
                    style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: currentPage == 0
                            ? textColor.withOpacity(1.0)
                            : textColor.withOpacity(0.6)),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await pageViewController.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic);
                    setState(() {
                      currentPage = 1;
                    });
                  },
                  child: Text(
                    'Completed',
                    style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: currentPage == 1
                            ? textColor.withOpacity(1.0)
                            : textColor.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
            Expanded(
              // height: screenH * .85,
              child: PageView(
                controller: pageViewController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [Upcoming(), Completed()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Completed extends StatelessWidget {
  Completed({
    Key? key,
  }) : super(key: key);

  List<DoctorInfo> completedList = [
    DoctorInfo(
        name: "Dr. Forhad Rabbi",
        image:
            "https://image.shutterstock.com/image-photo/hand-closeup-holding-stethoscope-portrait-260nw-1189195201.jpg",
        hospitalName: "Mount adora hospital",
        speciality: "Heart Specialist",
        about:
            "Nostrud consequat mollit nulla eiusmod qui ullamco culpa commodo amet nisi officia eu eiusmod. Voluptate id magna reprehenderit ullamco sit dolore. Exercitation qui id duis reprehenderit enim laboris culpa sint quis sunt ea Lorem et tempor. Ut duis ea mollit ea in aliquip cillum commodo laboris.",
        address: "address",
        rating: 4.5,
        availableTimes: [
          AvailableTime(day: "27 Nov 21", time: "9.00am-3.30pm"),
        ]),
    DoctorInfo(
        name: "Dr. XYZ Rabbi",
        image:
            "https://image.shutterstock.com/image-photo/hand-closeup-holding-stethoscope-portrait-260nw-1189195201.jpg",
        hospitalName: "Mount adora hospital",
        speciality: "Heart Specialist",
        about:
            "Nostrud consequat mollit nulla eiusmod qui ullamco culpa commodo amet nisi officia eu eiusmod. Voluptate id magna reprehenderit ullamco sit dolore. Exercitation qui id duis reprehenderit enim laboris culpa sint quis sunt ea Lorem et tempor. Ut duis ea mollit ea in aliquip cillum commodo laboris.",
        address: "address",
        rating: 4.5,
        availableTimes: [
          AvailableTime(day: "30 Nov 21", time: "9.00am-3.30pm"),
        ]),
    DoctorInfo(
        name: "Dr. Forhad Rabbi",
        image:
            "https://image.shutterstock.com/image-photo/hand-closeup-holding-stethoscope-portrait-260nw-1189195201.jpg",
        hospitalName: "Mount adora hospital",
        speciality: "Heart Specialist",
        about:
            "Nostrud consequat mollit nulla eiusmod qui ullamco culpa commodo amet nisi officia eu eiusmod. Voluptate id magna reprehenderit ullamco sit dolore. Exercitation qui id duis reprehenderit enim laboris culpa sint quis sunt ea Lorem et tempor. Ut duis ea mollit ea in aliquip cillum commodo laboris.",
        address: "address",
        rating: 4.5,
        availableTimes: [
          AvailableTime(day: "27 Dec 21", time: "9.00am-3.30pm"),
        ]),
    DoctorInfo(
        name: "Dr. Abc Ahmed",
        image:
            "https://image.shutterstock.com/image-photo/hand-closeup-holding-stethoscope-portrait-260nw-1189195201.jpg",
        hospitalName: "Mount adora hospital",
        speciality: "Heart Specialist",
        about:
            "Nostrud consequat mollit nulla eiusmod qui ullamco culpa commodo amet nisi officia eu eiusmod. Voluptate id magna reprehenderit ullamco sit dolore. Exercitation qui id duis reprehenderit enim laboris culpa sint quis sunt ea Lorem et tempor. Ut duis ea mollit ea in aliquip cillum commodo laboris.",
        address: "address",
        rating: 4.5,
        availableTimes: [
          AvailableTime(day: "27 Dec 21", time: "9.00am-3.30pm"),
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completedList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MakeAppointment(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            // width: screenW * 0.8,
            // height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  // color: Color.fromRGBO(0, 119, 182, 0.6),
                  color: const Color(0xff0077B6).withOpacity(.3),
                  offset: Offset(3, 3),
                  blurRadius: 6,
                )
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      radius: 25,
                      child: Text(
                        completedList[index].name[0],
                        style: GoogleFonts.lora(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(completedList[index].name,
                              style: Theme.of(context).textTheme.bodyText1),
                          // Text(
                          //   acceptDataList[index].email,
                          // ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 12,
                                    ),
                                    Text(
                                      completedList[index]
                                          .availableTimes[0]
                                          .day,
                                      style: textStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      size: 12,
                                    ),
                                    Text(
                                      completedList[index]
                                          .availableTimes[0]
                                          .time,
                                      style: textStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ])
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ElevatedButton(
                    //     onPressed: () {},
                    //     style:
                    //         ElevatedButton.styleFrom(primary: Color(0xffF36262)),
                    //     child: SizedBox(
                    //         width: screenW * 0.3,
                    //         child: Center(child: Text("Reject")))),
                    // ElevatedButton(
                    //     onPressed: () {},
                    //     child: SizedBox(
                    //         width: screenW * 0.3,
                    //         child: Center(child: Text("Done"))))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Upcoming extends StatelessWidget {
  Upcoming({
    Key? key,
  }) : super(key: key);

  List<DoctorInfo> upcomingList = [
    DoctorInfo(
        name: "Dr. Forhad Rabbi",
        image:
            "https://image.shutterstock.com/image-photo/hand-closeup-holding-stethoscope-portrait-260nw-1189195201.jpg",
        hospitalName: "Mount adora hospital",
        speciality: "Heart Specialist",
        about:
            "Nostrud consequat mollit nulla eiusmod qui ullamco culpa commodo amet nisi officia eu eiusmod. Voluptate id magna reprehenderit ullamco sit dolore. Exercitation qui id duis reprehenderit enim laboris culpa sint quis sunt ea Lorem et tempor. Ut duis ea mollit ea in aliquip cillum commodo laboris.",
        address: "address",
        rating: 4.5,
        availableTimes: [
          AvailableTime(day: "27 Nov 21", time: "9.00am-3.30pm"),
        ]),
    DoctorInfo(
        name: "Dr. XYZ Rabbi",
        image:
            "https://image.shutterstock.com/image-photo/hand-closeup-holding-stethoscope-portrait-260nw-1189195201.jpg",
        hospitalName: "Mount adora hospital",
        speciality: "Heart Specialist",
        about:
            "Nostrud consequat mollit nulla eiusmod qui ullamco culpa commodo amet nisi officia eu eiusmod. Voluptate id magna reprehenderit ullamco sit dolore. Exercitation qui id duis reprehenderit enim laboris culpa sint quis sunt ea Lorem et tempor. Ut duis ea mollit ea in aliquip cillum commodo laboris.",
        address: "address",
        rating: 4.5,
        availableTimes: [
          AvailableTime(day: "30 Nov 21", time: "9.00am-3.30pm"),
        ]),
    DoctorInfo(
        name: "Dr. Forhad Rabbi",
        image:
            "https://image.shutterstock.com/image-photo/hand-closeup-holding-stethoscope-portrait-260nw-1189195201.jpg",
        hospitalName: "Mount adora hospital",
        speciality: "Heart Specialist",
        about:
            "Nostrud consequat mollit nulla eiusmod qui ullamco culpa commodo amet nisi officia eu eiusmod. Voluptate id magna reprehenderit ullamco sit dolore. Exercitation qui id duis reprehenderit enim laboris culpa sint quis sunt ea Lorem et tempor. Ut duis ea mollit ea in aliquip cillum commodo laboris.",
        address: "address",
        rating: 4.5,
        availableTimes: [
          AvailableTime(day: "27 Dec 21", time: "9.00am-3.30pm"),
        ]),
    DoctorInfo(
        name: "Dr. Abc Ahmed",
        image:
            "https://image.shutterstock.com/image-photo/hand-closeup-holding-stethoscope-portrait-260nw-1189195201.jpg",
        hospitalName: "Mount adora hospital",
        speciality: "Heart Specialist",
        about:
            "Nostrud consequat mollit nulla eiusmod qui ullamco culpa commodo amet nisi officia eu eiusmod. Voluptate id magna reprehenderit ullamco sit dolore. Exercitation qui id duis reprehenderit enim laboris culpa sint quis sunt ea Lorem et tempor. Ut duis ea mollit ea in aliquip cillum commodo laboris.",
        address: "address",
        rating: 4.5,
        availableTimes: [
          AvailableTime(day: "27 Dec 21", time: "9.00am-3.30pm"),
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: upcomingList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          // width: screenW * 0.8,
          // height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                // color: Color.fromRGBO(0, 119, 182, 0.6),
                color: const Color(0xff0077B6).withOpacity(.3),
                offset: Offset(3, 3),
                blurRadius: 6,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    radius: 25,
                    child: Text(
                      upcomingList[index].name[0],
                      style: GoogleFonts.lora(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(upcomingList[index].name,
                            style: Theme.of(context).textTheme.bodyText1),
                        // Text(
                        //   reqData[index].email,
                        // ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 12,
                                  ),
                                  Text(
                                    upcomingList[index].availableTimes[0].day,
                                    style: textStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_outlined,
                                    size: 12,
                                  ),
                                  Text(
                                    upcomingList[index].availableTimes[0].time,
                                    style: textStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ])
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xffF36262)),
                      child: SizedBox(
                          width: screenW * 0.3,
                          child: Center(child: Text("Reject")))),
                  // ElevatedButton(
                  //     onPressed: () {},
                  //     child: SizedBox(
                  //         width: screenW * 0.3,
                  //         child: Center(child: Text("Accept"))))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
