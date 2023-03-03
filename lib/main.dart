// ignore_for_file: sized_box_for_whitespace

import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:calculator/controls/functions.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> btns = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "4",
    "5",
    "6",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ABS",
    "="
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 160,
          ),
          output(prs),
          input(),
        ],
      ),
    );
  }

  Widget output(text) {
    return Center(child: Text(text));
  }

  Widget input() {
    return Expanded(
      flex: 1,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: btns.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: ((context, index) {
                    var func = Functions();
                    switch (index) {
                      case 0:
                        return TextButton(
                          onPressed: () {
                            setState(() {
                              prs = func.clear();
                              log("clear numbers:$prs");
                            });
                          },
                          child: Text(btns[index]),
                        );
                      case 1:
                        return TextButton(
                          onPressed: () {
                            setState(() {
                              prs = func.delete(prs);
                            });
                          },
                          child: Text(btns[index]),
                        );
                      default:
                        return TextButton(
                          onPressed: () {
                            setState(() {
                              prs += btns[index];
                              log("message:$prs");
                              //.insert(index, btns[index]);// += btns[index];
                            });
                          },
                          child: Text(btns[index]),
                        );
                    }
                  })),
            )
          ]),
    );
  }

  String prs = "";
}
