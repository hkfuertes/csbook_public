import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landing/model/section.dart';
import 'package:landing/widgets/logo.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<String>(
              future:
                  DefaultAssetBundle.of(context).loadString("assets/info.json"),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const CircularProgressIndicator();
                } else {
                  var pages = Section.listFromJson(snapshot.requireData);
                  return Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 675,
                                width: 700,
                                child: Stack(
                                  children: [
                                    CustomAssetImage(
                                      "web.png",
                                      height: 600,
                                      selected: (_selectedPage == 0),
                                      onTap: () {
                                        setState(() {
                                          _selectedPage = 0;
                                        });
                                      },
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: CustomAssetImage(
                                          "mobile.jpeg",
                                          selected: _selectedPage == 1,
                                          height: 550,
                                          onTap: () {
                                            setState(() {
                                              _selectedPage = 1;
                                            });
                                          },
                                        )),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Logo(
                                size: 96,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Text(
                                pages[_selectedPage].title,
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: SizedBox(
                                  width: 500,
                                  height: 200,
                                  child: Text(pages[_selectedPage].info,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100),
                                      maxLines: 16,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start),
                                ),
                              ),
                              Row(
                                children: pages[_selectedPage]
                                    .links
                                    .map((e) => makeButton(e.text))
                                    .toList(),
                              )
                            ],
                          )
                        ]),
                      ],
                    ),
                  );
                }
              })),
    );
  }

  Widget makeButton(text, {onPress, icon}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 16),
      child: OutlinedButton.icon(
          icon: icon ?? Container(),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: onPress,
          label: Padding(
            padding: const EdgeInsets.all(8.0)
                .copyWith(right: (icon != null) ? 0 : 14),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
          )),
    );
  }
}

class CustomAssetImage extends StatelessWidget {
  final String asset;
  final double? width, height;
  final bool selected;
  final Function()? onTap;
  const CustomAssetImage(
    this.asset, {
    this.width,
    this.height,
    this.selected = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: (!selected)
          ? null
          : BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
            onTap: onTap,
            mouseCursor: SystemMouseCursors.click,
            child: Image.asset(asset)),
      ),
    );
  }
}

extension ListExtension on List {
  List<T> conditionalReverse<T>({reverse = true}) =>
      (reverse) ? reversed.toList() as List<T> : this as List<T>;
}
