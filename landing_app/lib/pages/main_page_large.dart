import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landing/model/section.dart';
import 'package:landing/widgets/logo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/url_button.dart';

class MainPageLarge extends StatefulWidget {
  final List<Section> sections;
  MainPageLarge({Key? key, required this.sections}) : super(key: key);

  @override
  State<MainPageLarge> createState() => _MainPageLargeState();
}

class _MainPageLargeState extends State<MainPageLarge> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 400,
                  width: 400,
                  child: Stack(
                    children: [
                      CustomAssetImage(
                        "web.png",
                        height: 350,
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
                            height: 350,
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
                  size: 72,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  widget.sections[_selectedPage].title,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(0.7)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    width: 500,
                    height: 150,
                    child: Text(widget.sections[_selectedPage].info,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w100),
                        maxLines: 16,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start),
                  ),
                ),
                Row(
                  children: widget.sections[_selectedPage].links
                      .map((e) =>
                          UrlButton(e.text, url: e.url, icon: e.getIconData()))
                      .toList(),
                )
              ],
            )
          ]),
        ],
      ),
    )));
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
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(onTap: onTap, child: Image.asset(asset))),
      ),
    );
  }
}

extension ListExtension on List {
  List<T> conditionalReverse<T>({reverse = true}) =>
      (reverse) ? reversed.toList() as List<T> : this as List<T>;
}
