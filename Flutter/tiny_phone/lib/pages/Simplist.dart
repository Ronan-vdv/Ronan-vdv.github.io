//A short description about Simplist

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Simplist extends StatelessWidget {
  const Simplist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              const Text('Simplist',
                  style: TextStyle(fontSize: 70, color: Colors.white)),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://play.google.com/store/apps/details?id=com.spadeware.simplist'));
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  width: 200,
                  child: Image.asset(
                    'images/SimplistIcon.png',
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Simplist is my very first published app. It's basically an app that tracks your grocery list."
                " You can add items and then mark them as 'completed' once you've retrieved them. There are certainly many similar apps floating around but I think Simplist blends simplicity and functionality well within a nice UI."
                " The reason I made the app was because of a remark someone using a different one made:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 75, 75, 75),
                    borderRadius: BorderRadius.circular(15)),
                child: const Text(
                  "\"I wish I had the ability to categorise items. So then I can have a section for vegetables, then not need to search through the list for everything vegetable-related while I'm in that part of the supermarket.\"",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "The app is built with the intention to give a user the option to create their own categories (in the form of coloured tags) so that they can section of their groceries however they want."
                " While it's not a terribly complicated app by it's nature, it taught me a lot about the process needed to get an app onto the Google Play store. You can see the app on the store by tapping on the logo at the top of the page.",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
