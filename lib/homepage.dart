import 'package:flutter/material.dart';
import 'package:ui/smart_device.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // padding contants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

// list of smart devices..
  List mySmartDevices = [
    // [smartDevicesName, iconPath, powerStatus]
    ['Smart Light', 'assets/icons/lamp_icon.png', true],
    ['Smart fan', 'assets/icons/fan_icon.png', false],
    ['Smart Ac', 'assets/icons/air conditioner_icon.png', false],
    ['Smart Tv', 'assets/icons/tv_icon.png', false],
  ];

  //  power button switch..
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app bar....
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icons..
                  Center(
                    child: Image.asset(
                      "assets/icons/menu_icon.png",
                      height: 40,
                    ),
                  ),
                  Icon(
                    Icons.person,
                    size: 40,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // welcome home + grid..
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome home "),
                  Text(
                    "Havier marlega",
                    style: TextStyle(fontSize: 35),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Smart home"),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20),
                itemCount: mySmartDevices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return SmartDevicesBox(
                    smartDevicesName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
