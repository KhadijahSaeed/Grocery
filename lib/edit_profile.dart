// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EditProfileView extends StatefulWidget {
  EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Column(
                children: [
                  Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/bb.jpg"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Form(
                      child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                            child: Text(
                              "Username",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          )),
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "Khadijah saeed"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                            child: Text(
                              "Email Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          )),
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "example@email.com"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                            child: Text(
                              "Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          )),
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "Accra, Ghana"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          )),
                      TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "033xxxxxxx"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                            child: Text(
                              "Birth Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          )),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Kindly type your date of birth";
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "dd-mm-yyyy"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                TextSpan(
                                    text: "Joined ",
                                    style: TextStyle(color: Colors.grey)),
                                TextSpan(
                                    text: "17 April 2022",
                                    style: TextStyle(color: Colors.black)
                                    ),
                              ]
                              ),
                              ),
                          TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey[200]),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "Update",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[600],
                                      fontSize: 20),
                                ),
                              ))
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
