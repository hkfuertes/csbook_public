import 'package:flutter/material.dart';
import 'package:landing/pages/main_page_large.dart';
import 'package:landing/pages/main_page_mobile.dart';

import '../model/section.dart';

class MainAdaptative extends StatelessWidget {
  const MainAdaptative({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString("assets/info.json"),
        builder: ((context, snapshot) {
          if (snapshot.data == null) {
            return const Material(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            var pages = Section.listFromJson(snapshot.requireData);
            return LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth < 1000) {
                return MainPageMobile(sections: pages);
              } else {
                return MainPageLarge(sections: pages);
              }
            });
          }
        }));
  }
}
