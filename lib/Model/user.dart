import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String email;
  String gender;
  int age;
  String phone;
  String address;
  String imgurl;
  int height;
  String bloodgrp;
  double weight;

  User({
    required this.uid,
    required this.imgurl,
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.phone,
    required this.address,
    required this.height,
    required this.bloodgrp,
    required this.weight,
  });
  factory User.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    try {
      return User(
        uid: data['uid'] ?? '',
        imgurl: data['imgurl'] ??
            'https://media.istockphoto.com/id/1196083861/vector/simple-man-head-icon-set.jpg?s=612x612&w=0&k=20&c=a8fwdX6UKUVCOedN_p0pPszu8B4f6sjarDmUGHngvdM=',
        name: data['name'],
        email: data['email'] ?? '',
        gender: data['gender'],
        age:
            data['age'] != null ? int.tryParse(data['age'].toString()) ?? 0 : 0,
        phone: data['phone'] ?? '',
        address: data['address'] ?? '',
        height: data['height'] != null
            ? int.tryParse(data['height'].toString()) ?? 0
            : 0,
        bloodgrp: data['bloodgrp'] ?? '',
        weight: data['weight'] != null
            ? double.tryParse(data['weight'].toString()) ?? 0.0
            : 0.0,
      );
    } catch (e) {
      print('Error parsing User data: $e');
      return User(
        uid: '',
        imgurl: '',
        name: '',
        email: '',
        gender: '',
        age: 0,
        phone: '',
        address: '',
        height: 0,
        bloodgrp: '',
        weight: 0.0,
      );
    }
  }
}
