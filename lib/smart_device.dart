import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SmartDevicesBox extends StatelessWidget {
  final String smartDevicesName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDevicesBox(
      {super.key,
      required this.smartDevicesName,
      required this.iconPath,
      required this.powerOn,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.black : Colors.grey[100],
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //icon
              Image.asset(
                iconPath,
                height: 60,
                color: powerOn ? Colors.white : Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        smartDevicesName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: powerOn ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                    ),
                  )
                ],
              )
              //smart device name + switch
            ],
          ),
        ),
      ),
    );
  }
}
