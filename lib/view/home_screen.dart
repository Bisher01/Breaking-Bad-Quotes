import 'package:breaking_bad/util/colors.dart';
import 'package:breaking_bad/util/images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.seaGreen.withOpacity(0.1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              MyImages.logo,
              height: 100,
            ),
            const Spacer(),
            Text(
              '❝I watched Jane die. I was there. And I watched her die.❞',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Bitter",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColors.smokyBlack),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'Walter White',
                    style: TextStyle(
                      fontFamily: "ShadowsIntoLight",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: MyColors.darkGreen,
                    ),
                  )
                ],
              ),
            ),
           const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyColors.mughalGreen),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15)),
                  shape: MaterialStateProperty.all<OutlinedBorder?>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Another Quote',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Bitter",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Image.asset(
                      MyImages.ww,
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
