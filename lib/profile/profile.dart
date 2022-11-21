import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MePageState();
}

class _MePageState extends State<ProfilePage> {
  // var width = MediaQuery.of(context).size.width;
  // var height = MediaQuery.of(context).size.height;

  String username = "";
  String email = "";

  int _selected_index = 0;
  static const option_style = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  @override
  void initState() {
    username = "AAA";
    email = "csil@ucsb.edu";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 44, 183, 188),
          title: Text(
            "Profile",
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ))),
      body: Center(
        child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0, 0.5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://pbs.twimg.com/profile_images/1336703991124815907/FQIgoIHT_400x400.png"),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  username,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 90.0),
                      child: Container(
                        child: Text(
                          "email: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 70.0),
                      child: Container(
                        child: Text(
                          email,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                          alignment: Alignment.center,
                          child: OutlinedButton(
                            onPressed: () {
                              // todo
                            },
                            child: Text(
                              "Wallet",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.black,
                              side: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: Size(300, 40),
                            ),
                          ))),
                ],
              ),
              // Padding(
              // //   padding: const EdgeInsets.only(top: 36.0, left: 150.0, right: 80.0),
              // padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       const Text("Accounting days:",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              //       Expanded(
              //         child: Container(),
              //       ),
              //       const Text("|",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              //       Expanded(
              //         child: Container(),
              //       ),
              //       const Text("Number of Accounts :",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              //       Expanded(
              //         child: Container(),
              //       ),
              //     ],
              //   ),
              // ),
              // Expanded(
              //     child: Container()
              // ),
            ],
          ),
        ),
      ),
    );
  }
}