import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medbot/main.dart';
import 'package:medbot/screens/Profile/editprofile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Column(children: [
        Center(
          child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(controller.user.value.imgurl)),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(child: Obx(
              () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTile(
                        icon: Icons.person_outlined,
                        text: controller.user.value.name),
                    CustomTile(
                        icon: Icons.email_outlined,
                        text: controller.user.value.email),
                    CustomTile(
                        icon: Icons.phone_android_outlined,
                        text: controller.user.value.phone),
                    CustomTile(
                        icon: Icons.man_4_outlined,
                        text: controller.user.value.gender),
                    CustomTile(
                        icon: Icons.calendar_month_outlined,
                        text: controller.user.value.age.toString()),
                    CustomTile(
                        icon: Icons.location_on,
                        text: controller.user.value.address),
                    CustomTile(
                        icon: Icons.height_outlined,
                        text: "${controller.user.value.height} cm"),
                    CustomTile(
                        icon: Icons.monitor_weight_outlined,
                        text: "${controller.user.value.weight} kg"),
                    CustomTile(
                        icon: Icons.favorite,
                        text: controller.user.value.bloodgrp),
                    const SizedBox(height: 30),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilePage(
                                    email: controller.user.value.email,
                                    gender: controller.user.value.gender,
                                    age: controller.user.value.age,
                                    address: controller.user.value.address,
                                    height: controller.user.value.height,
                                    weight: controller.user.value.weight,
                                    bloodgrp: controller.user.value.bloodgrp,
                                    phone: controller.user.value.phone,
                                    name: controller.name.value,
                                    

                                  )));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                // color: Colors.purple[200],
                                gradient: LinearGradient(colors: [
                                  Colors.blue.shade900,
                                  Colors.purple.shade300
                                ]),
                                borderRadius: BorderRadius.circular(30)),
                            alignment: Alignment.center,
                            height: 50,
                            width: 200,
                            child: const Text(
                              "Edit Profile",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      ),
                    )
                  ],
                );
              },
            )),
          ),
        )
      ]),
    );
  }
}

class CustomTile extends StatelessWidget {
  IconData icon;
  String text;
  CustomTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black38, width: 1))),
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Icon(
          icon,
          size: 30,
        ),
        SizedBox(
          width: 230,
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.grey[700]),
          ),
        ),
      ]),
    );
  }
}
