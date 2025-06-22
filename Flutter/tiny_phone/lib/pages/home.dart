//The home page of the phone :)

import 'package:flutter/material.dart';
import 'package:tiny_phone/pages/Simplist.dart';
import 'package:tiny_phone/pages/calculator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget appSelection = const SizedBox();

  Widget currentPage = const SizedBox();
  @override
  void initState() {
    super.initState();
    appSelection = Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "images/SpaceWallpaper.jpg",
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = const Simplist();
                      });
                    },
                    child: const AppIcon(
                        title: 'Simplist',
                        imagePath: 'images/SimplistIcon.png'),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = const Calculator();
                      });
                    },
                    child: const AppIcon(
                        title: 'Calculator',
                        imagePath: 'images/CalculatorIcon.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    currentPage = appSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: currentPage),
          Container(
            color: const Color.fromARGB(255, 49, 49, 49),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      currentPage = appSelection;
                    });
                  }, //Go home
                  icon: const Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  final String title;
  final String imagePath;
  const AppIcon({required this.title, required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.asset(imagePath)),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ],
    );
  }
}

