import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hasPermission = false;

  @override
  void initState() {
    _fetchPermissionStatus();
    super.initState();
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() {
          _hasPermission = status == PermissionStatus.granted;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (context) {
        if (_hasPermission) {
          return _buildCompass();
        } else {
          return _buildPermission();
        }
      },
    ));
  }

  Widget _buildPermission() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Permission.locationWhenInUse.request().then((value) {
              _fetchPermissionStatus();
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Click to Grant Permission for Location"),
          )),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("An Error has Occured");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          double? direction = snapshot.data!.heading;
          if (direction == null) {
            return const Text("No Direction or sensor Issue");
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: RadialGradient(
              colors: [
                Colors.black,
                Colors.grey.shade900,
              ],
            )),
            child: Transform.rotate(
              angle: (direction * (math.pi / 180) * -1),
              child: Container(
                child: Image.asset('lib/images/compass.png'),
              ),
            ),
          );
        });
  }
}
