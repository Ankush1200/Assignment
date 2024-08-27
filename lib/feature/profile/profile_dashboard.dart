import 'package:assignment/contants/colors.dart';
import 'package:assignment/feature/profile/complete_profile.dart';
import 'package:assignment/feature/profile/controller.dart';
import 'package:assignment/feature/profile/drawer.dart';
import 'package:assignment/services/auth_services.dart';
import 'package:assignment/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProfileDashBoard extends StatefulWidget {
  const ProfileDashBoard({super.key});

  static const routePath = "/profile-Dashboard";

  @override
  State<ProfileDashBoard> createState() => _ProfileDashBoardState();
}

class _ProfileDashBoardState extends State<ProfileDashBoard> {
  Position? _currentPosition;
  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    LocalStorage.loadUserData();
    _loadUserLocation();
  }

  Future<void> _loadUserLocation() async {
    await AuthServices.requestLocationPermission();
    _currentPosition = await AuthServices.getUserLocation();
    setState(() {
      _currentAddress =
          'Lat: ${_currentPosition?.latitude.toPrecision(2)}, Long: ${_currentPosition?.longitude.toPrecision(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: customDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.redColor)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
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
                      decoration: const InputDecoration(labelText: 'Phone'),
                    ),
                    SizedBox(
                      height:50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Device Location',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const VerticalDivider(color: Colors.grey, thickness: 2,indent:0,endIndent:0,),
                            _currentAddress != null
                                ? Text(
                                    _currentAddress!,
                                    style: const TextStyle(fontSize: 16),
                                  )
                                : const Center(child: CircularProgressIndicator()),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(CompleteProfilePage.routePath);
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}
