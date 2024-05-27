import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'languageList.dart';
import 'languaugeController.dart';


class LanguageDialogBox extends StatefulWidget {
  const LanguageDialogBox({super.key});

  @override
  State<LanguageDialogBox> createState() => _LanguageDialogBoxState();
}

class _LanguageDialogBoxState extends State<LanguageDialogBox> {
  LanguageController languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text('Select Language'),
                    children: <Widget>[
                      SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop(langs.keys.elementAt(0));
                          },
                          child: Text(langs.values.elementAt(0))),
                      SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop(langs.keys.elementAt(1));
                          },
                          child: Text(langs.values.elementAt(1))),
                      SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop(langs.keys.elementAt(2));
                          },
                          child: Text(langs.values.elementAt(2))),
                      SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop(langs.keys.elementAt(3));
                          },
                          child: Text(langs.values.elementAt(3))),
                      SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop(langs.keys.elementAt(4));
                          },
                          child: Text(langs.values.elementAt(4))),
                      SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop(langs.keys.elementAt(5));
                          },
                          child: Text(langs.values.elementAt(5))),
                      SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop(langs.keys.elementAt(6));
                          },
                          child: Text(langs.values.elementAt(6))),
                    ],
                  );
                }).then((value) => setState(() {
                  if (value == null) {
                    /// Takes care of the situation when no theme is selected.
                    return;
                  } else {
                    print(value);
                    languageController.updateString(value);
                  }
                }));
          },
          child: const Icon(Icons.language));
  }
}


