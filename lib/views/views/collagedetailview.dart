import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_skygoal/constants/colors.dart';
import 'package:flutter_task_skygoal/views/collage_tabbar/about_hostel.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/widgets/cutomWidget.dart';
import '../collage_tabbar/about_collage.dart';

class CollageDetailView extends StatefulWidget {
  String collageImage;
  String collageName;
  String description;
  String mapImage;
  CollageDetailView(
      {required this.collageImage,
      required this.collageName,
      required this.description,
      required this.mapImage});

  @override
  State<CollageDetailView> createState() => _CollageDetailViewState();
}

class _CollageDetailViewState extends State<CollageDetailView> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: defaultColor,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  backgroundColor: white, child: Icon(Icons.arrow_back)),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: white,
                  child: Image.asset(
                    'assets/home/save_img.png',
                    height: 10,
                  )),
            ),
          ]),

      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverPadding(
                padding: EdgeInsets.all(0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.21,
                        width: double.infinity,
                        child: Image.asset(
                          widget.collageImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 11),
                                    child: CustomText(widget.collageName, black,
                                        20, FontWeight.w700),
                                  ),
                                  SizedBox(
                                      width: width * 0.6,
                                      child: Text(
                                        widget.description,
                                        maxLines: 3,
                                        overflow: TextOverflow.clip,
                                        style: GoogleFonts.lato(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: grey,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(6, 7, 6, 7),
                                  child: Column(
                                    children: [
                                      CustomText(
                                          '4.3', white, 18, FontWeight.w800),
                                      Icon(
                                        Icons.star,
                                        color: white,
                                        size: 25,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _MySliverAppBarDelegate(),
                pinned: true, floating: true, // Initially set to false
              ),
            ];
          },
          body: TabBarView(
            children: [
              AboutCollageView(
                description: widget.description,
                mapImage: widget.mapImage,
              ),
              AboutHostelView(
                name: widget.collageName,
                detail: widget.description,
              ),
              Container(),
              Container(),
            ],
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     SizedBox(
          //       height: height * 0.21,
          //       width: double.infinity,
          //       child: Image.asset(
          //         widget.collageImage,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(0, 0, 16, 2),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(top: 15, left: 15),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(bottom: 11),
          //                   child: CustomText(widget.collageName, black, 20,
          //                       FontWeight.w700),
          //                 ),
          //                 SizedBox(
          //                     width: width * 0.6,
          //                     child: Text(
          //                       widget.description,
          //                       maxLines: 3,
          //                       overflow: TextOverflow.clip,
          //                       style: GoogleFonts.lato(
          //                         fontSize: 12,
          //                         fontWeight: FontWeight.w600,
          //                         color: grey,
          //                       ),
          //                     )),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Container(
          //               width: 50,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(5),
          //                   color: Colors.green),
          //               child: Padding(
          //                 padding: const EdgeInsets.fromLTRB(6, 7, 6, 7),
          //                 child: Column(
          //                   children: [
          //                     CustomText('4.3', white, 18, FontWeight.w800),
          //                     Icon(
          //                       Icons.star,
          //                       color: white,
          //                       size: 25,
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       color: Colors.black12,
          //       width: double.infinity,
          //       child: TabBar(
          //         isScrollable: true,
          //         indicatorWeight: 2,
          //         indicatorSize: TabBarIndicatorSize.tab,
          //         dividerColor: Colors.transparent,
          //         indicatorColor: defaultColor,
          //         automaticIndicatorColorAdjustment: false,
          //         padding: const EdgeInsets.only(left: 20, right: 20),
          //         tabs: [
          //           Tab(
          //             child: Text(
          //               'About college',
          //               overflow: TextOverflow.ellipsis,
          //               style: GoogleFonts.lato(
          //                 fontSize: 10,
          //                 fontWeight: FontWeight.w800,
          //                 color: black,
          //               ),
          //             ),
          //           ),
          //           Tab(
          //             child: Text(
          //               'Hostel facility',
          //               overflow: TextOverflow.ellipsis,
          //               style: GoogleFonts.lato(
          //                 fontSize: 10,
          //                 fontWeight: FontWeight.w800,
          //                 color: black,
          //               ),
          //             ),
          //           ),
          //           Tab(
          //             child: Text(
          //               'Q & A',
          //               overflow: TextOverflow.ellipsis,
          //               style: GoogleFonts.lato(
          //                 fontSize: 10,
          //                 fontWeight: FontWeight.w800,
          //                 color: black,
          //               ),
          //             ),
          //           ),
          //           Tab(
          //             child: Text(
          //               'Events',
          //               overflow: TextOverflow.ellipsis,
          //               style: GoogleFonts.lato(
          //                 fontSize: 10,
          //                 fontWeight: FontWeight.w800,
          //                 color: black,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       child: TabBarView(
          //         children: [
          //           AboutCollageView(
          //             description: widget.description,
          //             mapImage: widget.mapImage,
          //           ),
          //           AboutHostelView(
          //             name: widget.collageName,
          //             detail: widget.description,
          //           ),
          //           Container(),
          //           Container(),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
      //  Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     SizedBox(
      //       height: height * 0.21,
      //       width: double.infinity,
      //       child: Image.asset(
      //         widget.collageImage,
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(0, 0, 16, 2),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Padding(
      //             padding:
      //             const EdgeInsets.only(top: 15, left: 15),
      //             child: Column(
      //               mainAxisAlignment:
      //               MainAxisAlignment.spaceBetween,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Padding(
      //                   padding:
      //                   const EdgeInsets.only(bottom: 11),
      //                   child: CustomText(widget.collageName,
      //                       black, 20, FontWeight.w700),
      //                 ),
      //                 SizedBox(
      //                     width: width * 0.6,
      //                     child: Text(
      //                       widget.description,
      //                       maxLines: 3,
      //                       overflow: TextOverflow.clip,
      //                       style: GoogleFonts.lato(
      //                         fontSize: 12,
      //                         fontWeight: FontWeight.w600,
      //                         color: grey,
      //                       ),
      //                     )),
      //                 const SizedBox(
      //                   height: 20,
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(top: 10),
      //             child: Container(
      //               width: 50,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5),
      //                   color: Colors.green),
      //               child: Padding(
      //                 padding:
      //                 const EdgeInsets.fromLTRB(6, 7, 6, 7),
      //                 child: Column(
      //                   children: [
      //                     CustomText(
      //                         '4.3', white, 18, FontWeight.w800),
      //                     Icon(
      //                       Icons.star,
      //                       color: white,
      //                       size: 25,
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       color: Colors.black12,
      //       width: double.infinity,
      //       child: TabBar(
      //         isScrollable: true,
      //         indicatorWeight: 2,
      //         indicatorSize: TabBarIndicatorSize.tab,
      //         dividerColor: Colors.transparent,
      //         indicatorColor: defaultColor,
      //         automaticIndicatorColorAdjustment: false,
      //         padding: const EdgeInsets.only(left: 20, right: 20),
      //         tabs: [
      //           Tab(
      //             child: Text(
      //               'About college',
      //               overflow: TextOverflow.ellipsis,
      //               style: GoogleFonts.lato(
      //                 fontSize: 10,
      //                 fontWeight: FontWeight.w800,
      //                 color: black,
      //               ),
      //             ),
      //           ),
      //           Tab(
      //             child: Text(
      //               'Hostel facility',
      //               overflow: TextOverflow.ellipsis,
      //               style: GoogleFonts.lato(
      //                 fontSize: 10,
      //                 fontWeight: FontWeight.w800,
      //                 color: black,
      //               ),
      //             ),
      //           ),
      //           Tab(
      //             child: Text(
      //               'Q & A',
      //               overflow: TextOverflow.ellipsis,
      //               style: GoogleFonts.lato(
      //                 fontSize: 10,
      //                 fontWeight: FontWeight.w800,
      //                 color: black,
      //               ),
      //             ),
      //           ),
      //           Tab(
      //             child: Text(
      //               'Events',
      //               overflow: TextOverflow.ellipsis,
      //               style: GoogleFonts.lato(
      //                 fontSize: 10,
      //                 fontWeight: FontWeight.w800,
      //                 color: black,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       child: TabBarView(
      //         children: [
      //           AboutCollageView(
      //             description: widget.description,
      //             mapImage: widget.mapImage,
      //           ),
      //           AboutHostelView(
      //             name: widget.collageName,
      //             detail: widget.description,
      //           ),
      //           Container(),
      //           Container(),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            decoration: BoxDecoration(
                color: defaultColor, borderRadius: BorderRadius.circular(15)),
            height: 60,
            child: Center(
              child: CustomText('Apply Now', white, 20, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class _MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // Customize the background color
      child: TabBar(
        isScrollable: true,
        indicatorWeight: 2,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicatorColor: defaultColor,
        automaticIndicatorColorAdjustment: false,
        padding: const EdgeInsets.only(left: 20, right: 20),
        tabs: [
          Tab(
            child: Text(
              'About college',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Hostel facility',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Q & A',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Events',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
