import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Section {
  final String id;
  final String title;
  final String info;
  final String devInfo;
  final List<SectionLink> links;

  Section(
      {required this.id,
      required this.title,
      required this.info,
      required this.devInfo,
      required this.links});

  static List<Section> listFromJson(String json) {
    var jsonObject = jsonDecode(json) as List;
    return jsonObject.map((e) {
      var links = (e['links'] as List)
          .map((e) =>
              SectionLink(url: e['url'], text: e['text'], icon: e['icon']))
          .toList();
      return Section(
          id: e['id'],
          title: e['title'],
          info: e['info'],
          devInfo: e['devInfo'],
          links: links);
    }).toList();
  }
}

class SectionLink {
  final String url;
  final String text;
  final String? icon;

  SectionLink({required this.url, required this.text, this.icon});

  IconData? getIconData() {
    if (icon != null) {
      if (icon == "github") {
        return FontAwesomeIcons.github;
      } else if (icon == "firefoxBrowser") {
        return FontAwesomeIcons.firefoxBrowser;
      }
    }
    return null;
  }
}
