import 'package:flutter/material.dart';
import 'package:medbot/Model/user.dart';
import 'package:medbot/main.dart';

class EditProfilePage extends StatefulWidget {
  late String name;
  late String email;
  late String gender;
  late int age;
  late String phone;
  late String address;
  late int height;
  late String bloodgrp;
  late double weight;
  EditProfilePage(
      {required this.email,
      required this.gender,
      required this.age,
      required this.height,
      required this.address,
      required this.bloodgrp,
      required this.weight,
      required this.phone,
      required this.name,
      super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // declare variables to store the user data
  // String name = controller.name.value;
  // String email = controller.user.value.email;
  // String gender = controller.user.value.gender;
  // int age = controller.user.value.age;
  // String phone = controller.user.value.phone;
  // String address = controller.user.value.address;
  // int height = controller.user.value.height;
  // String bloodgrp = controller.user.value.bloodgrp;
  // double weight = controller.user.value.weight;
  late TextEditingController gendercontroller;
  late TextEditingController emailcontroller;
  late TextEditingController agecontroller;
  late TextEditingController phonecontroller;
  late TextEditingController addresscontroller;
  late TextEditingController heightcontroller;
  late TextEditingController bloodgrpcontroller;
  late TextEditingController weightcontroller;
  late TextEditingController namecontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gendercontroller = TextEditingController(text: widget.gender);
    emailcontroller = TextEditingController(text: widget.email);
    namecontroller = TextEditingController(text: widget.name);
    agecontroller = TextEditingController(text: widget.age.toString());
    phonecontroller = TextEditingController(text: widget.phone);
    addresscontroller = TextEditingController(text: widget.address);
    heightcontroller = TextEditingController(text: widget.height.toString());
    weightcontroller = TextEditingController(text: widget.weight.toString());
    bloodgrpcontroller = TextEditingController(text: widget.bloodgrp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // create form fields for each attribute
          TextFormField(
            // initialValue: widget.name,
            controller: namecontroller,
            decoration: const InputDecoration(labelText: "Name"),
          ),
          TextFormField(
            // initialValue: email,
            controller: emailcontroller,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          TextFormField(
            // initialValue: gender,
            controller: gendercontroller,
            decoration: const InputDecoration(labelText: "Gender"),
          ),
          TextFormField(
            // initialValue: age.toString(),
            controller: agecontroller,
            decoration: const InputDecoration(labelText: "Age"),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            // initialValue: phone,
            controller: phonecontroller,
            decoration: const InputDecoration(labelText: "Phone"),
          ),
          TextFormField(
            // initialValue: address,
            controller: addresscontroller,
            decoration: const InputDecoration(labelText: "Address"),
          ),
          TextFormField(
            // initialValue: height.toString(),
            controller: heightcontroller,
            decoration: const InputDecoration(labelText: "Height (cm)"),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            // initialValue: weight.toString(),
            controller: weightcontroller,
            decoration: const InputDecoration(labelText: "Weight (kg)"),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            // initialValue: bloodgrp,
            controller: bloodgrpcontroller,
            decoration: const InputDecoration(labelText: "Blood Group"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              child: const Text("Save Changes"),
              onPressed: () {
                // save the changes and navigate back to the profile page
                controller.setUserName(namecontroller.text);
                controller.setUser(User(
                    uid: controller.uid.value,
                    imgurl: controller.imgurl.value,
                    name: namecontroller.text,
                    email: emailcontroller.text,
                    gender: gendercontroller.text,
                    age: int.parse(agecontroller.text),
                    address: addresscontroller.text,
                    phone: phonecontroller.text,
                    height: int.parse(heightcontroller.text),
                    weight: double.parse(weightcontroller.text),
                    bloodgrp: bloodgrpcontroller.text));
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
