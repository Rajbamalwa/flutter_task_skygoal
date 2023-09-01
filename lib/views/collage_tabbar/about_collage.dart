import 'package:flutter/material.dart';
import 'package:flutter_task_skygoal/utils/widgets/cutomWidget.dart';

import '../../constants/colors.dart';

class AboutCollageView extends StatefulWidget {
  var description;
  var mapImage;
  AboutCollageView({required this.description, required this.mapImage});

  @override
  State<AboutCollageView> createState() => _AboutCollageViewState();
}

class _AboutCollageViewState extends State<AboutCollageView> {
  String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText('Description', black, 16, FontWeight.w700),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 20),
              child: CustomText(widget.description, grey, 14, FontWeight.w700),
            ),
            CustomText('Location', black, 16, FontWeight.w700),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 20),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(widget.mapImage), fit: BoxFit.fill)),
              ),
            ),
            CustomText('Student Review', black, 16, FontWeight.w700),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Row(
                  children: [
                    reviewImageWidget(const AssetImage(
                      'assets/home/one_review.jpg',
                    )),
                    reviewImageWidget(const AssetImage(
                      'assets/home/review_user.jpg',
                    )),
                    reviewImageWidget(const AssetImage(
                      'assets/home/review_user.jpg',
                    )),
                    reviewImageWidget(const AssetImage(
                      'assets/home/review_user.jpg',
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 1,
                              blurRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: CustomText(
                              '+12', defaultColor, 14, FontWeight.w800),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27, bottom: 5),
              child: Icon(
                Icons.keyboard_arrow_up,
                color: grey,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: CustomText(
                                  'Priya verma', black, 14, FontWeight.w600),
                            ),
                            CustomText(
                                'This college offers a diverse range of academic programs and a vibrant campus life, making it an ideal place for students to explore their passions and grow as individualsThis college offers a diverse range of academic programs and a vibrant campus life, making it an ideal place for students to explore their passions and grow as individuals🔥✨',
                                grey,
                                12,
                                FontWeight.w600),
                          ],
                        ))))
          ],
        ),
      ),
    );
  }

  Widget reviewImageWidget(child) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
          image: DecorationImage(
            image: child,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
