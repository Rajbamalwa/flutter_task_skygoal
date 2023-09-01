import 'package:flutter/material.dart';
import 'package:flutter_task_skygoal/constants/colors.dart';
import 'package:flutter_task_skygoal/utils/widgets/cutomWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../NavBar/NavbarView.dart';
import 'collageListview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: defaultColor,
        toolbarHeight: 200,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 49, 10, 8),
                  child: CustomText(
                      'Find your own way', white, 20, FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 49, 20, 8),
                  child: Icon(
                    Icons.notifications,
                    color: white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: CustomText(
                  'Search in 600 colleges around!', white, 14, FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 27),
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
                  Container(
                    height: 53,
                    width: 55,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Icon(Icons.mic),
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
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
            child: GestureDetector(
              onTap: callBottomSheet,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/home/home3.png'),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: GestureDetector(
              onTap: callBottomSheet,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/home/home1.png'),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: GestureDetector(
              onTap: callBottomSheet,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/home/home2.png'),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future callBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListTile(
                  title: CustomText('Sort', black, 18, FontWeight.w800),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.clear)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 0.4,
                  color: black,
                ),
              ),
              RadioListTile<String>(
                title: const Text('Bachelor of Technology'),
                value: 'Bachelor of Technology',
                groupValue: selectedValue,
                controlAffinity: ListTileControlAffinity.trailing,

                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NavBarPage(
                          page: CollageListView(),
                        ),
                      ));
                },
                selectedTileColor: defaultColor,
                activeColor: defaultColor,

                secondary: Icon(Icons.school_outlined), // Trailing icon
              ),
              RadioListTile<String>(
                title: const Text('Bachelor of Architecture'),
                value: 'Bachelor of Architecture',
                groupValue: selectedValue,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NavBarPage(
                          page: CollageListView(),
                        ),
                      ));
                },
                activeColor: defaultColor,

                selectedTileColor: defaultColor,

                secondary: Icon(Icons.architecture_outlined), // Trailing icon
              ),
              RadioListTile<String>(
                title: Text('Pharmacy'),
                value: 'Pharmacy',
                groupValue: selectedValue, selectedTileColor: defaultColor,

                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NavBarPage(
                          page: CollageListView(),
                        ),
                      ));
                },
                activeColor: defaultColor,

                secondary: Icon(Icons.local_pharmacy_outlined), // Trailing icon
              ),
              RadioListTile<String>(
                title: Text('Law'),
                value: 'Law',
                groupValue: selectedValue,
                activeColor: defaultColor,
                selectedTileColor: defaultColor,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NavBarPage(
                          page: CollageListView(),
                        ),
                      ));
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NavBarPage(
                          page: CollageListView(),
                        ),
                      ));
                },
                secondary: Icon(Icons.add_outlined), // Trailing icon
              ),
              RadioListTile<String>(
                title: Text('Management'),
                value: 'Management',
                groupValue: selectedValue, selectedTileColor: defaultColor,

                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NavBarPage(
                          page: CollageListView(),
                        ),
                      ));
                },
                activeColor: defaultColor,

                secondary:
                    Icon(Icons.settings_applications_outlined), // Trailing icon
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    selectedValue = '';
  }
}
