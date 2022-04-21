import 'package:flutter/material.dart';
import 'package:landing/widgets/url_button.dart';

import '../model/section.dart';
import '../widgets/logo.dart';

class MainPageMobile extends StatelessWidget {
  final List<Section> sections;
  MainPageMobile({Key? key, required this.sections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            Logo(
              size: 64,
            ),
            const SizedBox(
              height: 32,
            ),
            ..._buildSections(
                separator: Padding(
              padding: const EdgeInsets.all(32.0).copyWith(top: 0),
              child: Container(
                color: Colors.white.withOpacity(0.4),
                width: 300,
                height: 0.5,
              ),
            )),
          ],
        ),
      ),
    );
  }

  List<SectionLink> _links(List<Section> sections) {
    List<SectionLink> ret = [];
    sections.forEach((element) {
      ret.addAll(element.links);
    });
    return ret;
  }

  List<Widget> _buildSections({Widget? separator}) {
    var widgets = sections
        .map<List<Widget>>((s) {
          return <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                s.title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.7)),
              ),
            ),
            SizedBox(
              width: 300,
              child: Text(s.info,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w100),
                  maxLines: 16,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start),
            ),
            ...s.links
                .map(
                    (e) => UrlButton(e.text, url: e.url, icon: e.getIconData()))
                .toList(),
            const SizedBox(
              height: 32,
            ),
            separator ?? Container()
          ];
        })
        .expand((element) => element)
        .toList();
    if (separator != null) {
      widgets = widgets.sublist(0, widgets.length - 1);
    }

    return widgets;
  }
}
