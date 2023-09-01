import 'package:flutter/material.dart';
import 'package:flutter_task_skygoal/utils/widgets/cutomWidget.dart';
import 'package:flutter_task_skygoal/views/views/collagedetailview.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class CollageListView extends StatefulWidget {
  const CollageListView({super.key});

  @override
  State<CollageListView> createState() => _CollageListViewState();
}

class _CollageListViewState extends State<CollageListView> {
  TextEditingController controller = TextEditingController();
  String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: defaultColor,
        toolbarHeight: 100,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: SizedBox(
                        height: 53,
                        child: TextFormField(
                          controller: controller,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.search,
                              color: grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    style: BorderStyle.solid)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    style: BorderStyle.solid)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    style: BorderStyle.none)),
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: grey,
                            ),
                            hintText: 'Search for colleges, schools.....',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: GestureDetector(
                      child: Container(
                        height: 53,
                        width: 55,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Icon(Icons.mic),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                clipWidget('MVSH Engineering college'),
                clipWidget('MVSH Engineering college'),
                clipWidget('MVSH Engineering college'),
              ],
            ),
          ),
          CollageListWidget(
            imageName: 'assets/home/collage1.jpg',
            collegeName: 'SGGS Collage Nanded',
            description:
                '''Established in 1981, Shri Guru Gobind Singhji Institute of Engineering and Technology (SGGSIET), Nanded, is one of the promising leader institutions in technical education, research and technology transfer. Since its inception, the institute is dedicated to students’ centric learning and believes in pursuing academic excellence. It is having neat, clean and green campus spread over land of 46 acres. It receives 100% grant-in aid from Government of Maharashtra.''',
            mapImage: 'assets/home/sggs_map.png',
          ),
          CollageListWidget(
            imageName: 'assets/home/collage2.jpg',
            collegeName: 'Bachelor of Technology',
            description: description,
            mapImage: 'assets/home/other_map.png',
          ),
          CollageListWidget(
            imageName: 'assets/home/collage3.jpeg',
            collegeName: 'GHJK Engineering college',
            description: description,
            mapImage: 'assets/home/other_map.png',
          ),
        ],
      ),
    );
  }

  Widget clipWidget(text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 13, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: black),
        ),
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text, black, 10, FontWeight.w500)),
        ),
      ),
    );
  }
}

class CollageListWidget extends StatelessWidget {
  var imageName;
  var mapImage;
  var collegeName;
  var description;
  CollageListWidget({
    required this.imageName,
    required this.collegeName,
    required this.description,
    required this.mapImage,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CollageDetailView(
                        collageImage: imageName,
                        collageName: collegeName,
                        description: description,
                        mapImage: mapImage,
                      )));
        },
        child: Container(
          height: height * 0.32,
          decoration: BoxDecoration(
            color: white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(23),
          ),
          child: Column(
            children: [
              Container(
                height: height * 0.13,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imageName,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(23),
                      topLeft: Radius.circular(23)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: white,
                        child: Icon(Icons.share),
                      ),
                      CircleAvatar(
                        backgroundColor: white,
                        child: Image.asset(
                          'assets/home/save_img.png',
                          height: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 11),
                                child: CustomText(
                                    collegeName, black, 14, FontWeight.w700),
                              ),
                              SizedBox(
                                width: width * 0.5,
                                child: CustomText(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Eu ut imperdiet sed nec ullamcorper.',
                                    grey,
                                    9,
                                    FontWeight.w600),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 11),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 2, 6, 2),
                                    child: Row(
                                      children: [
                                        CustomText(
                                            '4.3', white, 12, FontWeight.w800),
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
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: defaultColor),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(6, 2, 6, 2),
                                  child: Row(
                                    children: [
                                      CustomText('Apply Now', white, 12,
                                          FontWeight.w800),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Image.asset(
                            'assets/home/collageLike.png',
                            height: 20,
                          ),
                        ),
                        CustomText('More than 1000+ students have been placed',
                            grey, 9, FontWeight.w600),
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText('468+', grey, 9, FontWeight.w600),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
