import 'package:breaking_bad/controller/quotes_provider.dart';
import 'package:breaking_bad/model/quotes_model.dart';
import 'package:breaking_bad/util/colors.dart';
import 'package:breaking_bad/util/images.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                MyImages.logo,
                height: 100,
              ),
              const Spacer(),
              Consumer<QuotesProvider>(builder: (context, provider, child) {
                return FutureBuilder<QuotesModel?>(
                    future: provider.getQuote(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: MyColors.seaGreen,
                            ),
                          );
                        case ConnectionState.done:
                          if (snapshot.hasData) {
                            final data = snapshot.data!;
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    '❝ ${data.quote!} ❞',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontFamily: "Bitter",
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.smokyBlack),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        data.author!,
                                        style: const TextStyle(
                                          fontFamily: "ShadowsIntoLight",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.darkGreen,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Text(
                              'Something went wrong!',
                              style: TextStyle(
                                  fontFamily: "Bitter",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.smokyBlack),
                            );
                          }
                        default:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: MyColors.seaGreen,
                            ),
                          );
                      }
                    });
              }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<QuotesProvider>(context, listen: false)
                        .refresh();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyColors.mughalGreen),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(vertical: 15)),
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
                      const SizedBox(
                        width: 10,
                      ),
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
      ),
    );
  }
}
