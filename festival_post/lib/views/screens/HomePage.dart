import 'package:festival_post/utils/festival_utils.dart';
import 'package:festival_post/utils/routes_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willPop = await showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text("Are you sure to exit?"),
            actions: [
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(color: MyColor.theme2),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  "No",
                  style: TextStyle(color: MyColor.theme2),
                ),
              ),
            ],
          ),
        );
        return willPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Festival Post"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2.5,
              ),
              itemCount: festivalData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      MyRoutes.DetailsPage,
                      arguments: festivalData[index],
                    );
                  },
                  child: Card(
                    color: Colors
                        .primaries[index % Colors.primaries.length].shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${festivalData[index].name}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "${festivalData[index].image}",
                                scale: 1,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
