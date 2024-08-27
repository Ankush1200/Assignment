import 'package:assignment/feature/profile/complete_profile.dart';
import 'package:assignment/feature/profile/controller.dart';
import 'package:flutter/material.dart';

Widget customDrawer(){
  return Drawer(
    backgroundColor:Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
            children: [
              const ProiflePicAndEdit(),
              const SizedBox(height: 10,),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration:const InputDecoration(labelText: 'Phone'),
              ),
            ],
          ),
    ),
  );
}