import 'package:flutter/material.dart';
import 'package:landing/widgets/logo.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 650,
                          width: 675,
                          child: Stack(
                            children: [
                              SizedBox(
                                  height: 600, child: Image.asset("web.png")),
                              Positioned(
                                  bottom: -16,
                                  right: -32,
                                  child: SizedBox(
                                      height: 550,
                                      width: 350,
                                      child: Image.asset("mobile.jpeg"))),
                            ],
                          )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Logo(
                          size: 64,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Web App",
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.7)),
                        ),
                        Text(lorem.replaceAll(".", ".\n")),
                        Row(
                          children: [
                            OutlinedButton(
                                onPressed: () {}, child: Text("Ver")),
                            OutlinedButton(
                                onPressed: () {}, child: Text("Ver guias")),
                          ],
                        )
                      ],
                    )
                  ]),
                ],
              )
            ],
          ),
        );
      })),
    );
  }

  final String lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id nibh tortor id aliquet. Nibh venenatis cras sed felis eget velit aliquet. Semper feugiat nibh sed pulvinar proin gravida hendrerit. Est lorem ipsum dolor sit. Mi in nulla posuere sollicitudin aliquam ultrices sagittis. Dui sapien eget mi proin sed libero. Leo integer malesuada nunc vel risus. Vehicula ipsum a arcu cursus vitae congue mauris rhoncus. Sed odio morbi quis commodo odio aenean. Faucibus turpis in eu mi bibendum neque. Quam nulla porttitor massa id neque. Nam libero justo laoreet sit amet. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Sem fringilla ut morbi tincidunt augue interdum velit. Lacus viverra vitae congue eu.';
}
