import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:os1/splash.dart';
import 'package:device_info_plus/device_info_plus.dart';


void main() {
    runApp(const MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  AndroidDeviceInfo? androidInfo;
  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfo.androidInfo;
  }

  Widget showCard(String name, String value) {
    return Card(
      color: const Color(0xFF192138),
      child: ListTile(
        leading: Image.asset('assets/tools.png',width: 40,height: 180,),
        selectedTileColor: Colors.blue,
        textColor: Colors.white,
        contentPadding: const EdgeInsets.all(10),
        tileColor: Colors.transparent,
        shape: BeveledRectangleBorder(
          side: const BorderSide(width: 0.6, color: Colors.deepOrangeAccent),
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          "$name : $value",
          style: const TextStyle(fontFamily: 'bright',fontSize: 20,letterSpacing: 2, height: 1.5),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor:  const Color(0xFF192138),
          appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
          "Device Specs",
          style: TextStyle(
          fontSize: 35,
          letterSpacing: 3,
          color: Colors.redAccent,
          fontFamily: 'stencil',
      ),
      textAlign: TextAlign.left,
      ),
      elevation: 0,
      backgroundColor: const Color(0xFF001930),
      toolbarHeight: 60.2,
      toolbarOpacity: 0.9,
            actions: [
              IconButton(
                  onPressed: (){
                    exit(0);
                  },
                  iconSize: 40,
                  icon: Image.asset('assets/exit.png')),
            ],
      ),
          body: SingleChildScrollView(
              child: FutureBuilder<AndroidDeviceInfo>(
                future: getInfo(),
                builder: (context, snapshot) {
                  final data = snapshot.data!;
                  return Column(
                    children: [
                      showCard('Manufacturer', data.manufacturer),
                      showCard('Brand', data.brand),
                      showCard('Device Model', data.device),
                      showCard('Android Version', data.version.release.toString()),
                      showCard('Root-status', data.type),
                      showCard('Security Patch Date', data.version.securityPatch.toString()),
                      showCard('Device ID', data.id),
                      showCard('Version codename', data.version.codename),
                      showCard('Host', data.host),
                      showCard('Display', data.display),
                      showCard('Motherboard', data.board),
                      showCard('Product', data.product),
                      showCard('Processor', data.hardware),
                      showCard('Bootloader status (unknown/unlocked)', data.bootloader),
                      showCard('IsPhysicalDevice', data.isPhysicalDevice.toString()),
                      showCard('Fingerprint credentials', data.fingerprint),
                    ],
                  );
                },
              )),
      ),
    );
  }
}



