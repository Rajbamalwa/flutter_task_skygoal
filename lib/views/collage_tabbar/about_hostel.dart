import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../utils/widgets/cutomWidget.dart';

class AboutHostelView extends StatefulWidget {
  String name;
  String detail;
  AboutHostelView({required this.name, required this.detail});

  @override
  State<AboutHostelView> createState() => _AboutHostelViewState();
}

class _AboutHostelViewState extends State<AboutHostelView> {
  int isSelected = 0;
  int pageIndex = 2;
  bool first = false;
  bool second = false;
  bool third = false;
  bool fourth = true;

  final List _list = [
    'assets/home/rooms.png',
    'assets/home/rooms.png',
    'assets/home/rooms.png',
    'assets/home/rooms.png',
    'assets/home/rooms.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 00, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                clipWidget(
                    Icons.bed,
                    '4',
                    fourth == true ? defaultColor : white,
                    fourth == true ? white : black, () {
                  setState(() {
                    fourth = true;
                    first = false;
                    second = false;
                    third = false;
                  });
                }),
                clipWidget(Icons.bed, '3', third == true ? defaultColor : white,
                    third == true ? white : black, () {
                  setState(() {
                    fourth = false;
                    first = false;
                    second = false;
                    third = true;
                  });
                }),
                clipWidget(
                    Icons.bed,
                    '2',
                    second == true ? defaultColor : white,
                    second == true ? white : black, () {
                  setState(() {
                    fourth = false;
                    first = false;
                    second = true;
                    third = false;
                  });
                }),
                clipWidget(Icons.bed, '1', first == true ? defaultColor : white,
                    first == true ? white : black, () {
                  setState(() {
                    fourth = false;
                    first = true;
                    second = false;
                    third = false;
                  });
                }),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 00, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  roomsWidget(),
                  roomsWidget(),
                  roomsWidget(),
                  roomsWidget(),
                  roomsWidget(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Center(
              child: CarouselIndicator(
                width: 7,
                color: black,
                count: _list.length,
                index: pageIndex,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(widget.name, black, 16, FontWeight.w700),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                          child: Row(
                            children: [
                              CustomText('4.3', white, 12, FontWeight.w800),
                              Icon(
                                Icons.star,
                                color: white,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: defaultColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomText('Vishnupuri, Nanded, 431 606', Color(0xff4A4A4A),
                        14, FontWeight.w700),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(widget.detail, grey, 12, FontWeight.w700),
                const SizedBox(
                  height: 20,
                ),
                CustomText('Facilities', black, 16, FontWeight.w700),
                ListTile(
                  leading: const Icon(Icons.add_home_work_outlined),
                  title: CustomText('College in 400mtrs', Color(0xff4A4A4A), 14,
                      FontWeight.w600),
                ),
                ListTile(
                  leading: const Icon(Icons.bathtub_outlined),
                  title: CustomText(
                      'Bathrooms : 2', Color(0xff4A4A4A), 14, FontWeight.w600),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding roomsWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(
            color: white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage('assets/home/rooms.png'), fit: BoxFit.cover)),
      ),
    );
  }

  Widget clipWidget(
    icon,
    text,
    color,
    color2,
    onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width / 7,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: defaultColor),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color2,
                ),
                CustomText(text, color2, 16, FontWeight.w600),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
