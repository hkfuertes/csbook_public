import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * 0.25,
                horizontal: constraints.maxWidth * 0.25 / 2),
            child: Container(
                width: constraints.maxWidth * 0.75,
                height: 1000,
                color: Colors.white,
                child: const Center(
                    child: Text(
                  "CSBOOK",
                  style: TextStyle(color: Colors.black),
                ))),
          ),
        );
      })),
    );
  }
}
