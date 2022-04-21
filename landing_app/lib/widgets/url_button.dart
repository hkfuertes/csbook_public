import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlButton extends StatelessWidget {
  final String text;
  final String? url;
  final IconData? icon;
  UrlButton(this.text, {this.url, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 16),
      child: OutlinedButton.icon(
          icon: (icon == null) ? Container() : Icon(icon),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: (url == null)
              ? null
              : () async {
                  await launch(url!);
                },
          label: Padding(
            padding: const EdgeInsets.all(16.0)
                .copyWith(right: (icon != null) ? 0 : 14),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
          )),
    );
  }
}
