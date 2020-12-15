import 'package:flutter/cupertino.dart';

class CategoryArt {
  String _name;
  IconData _icon;
  CategoryArt(String n, IconData catIc) {
    this._name = n;
    this._icon = catIc;
  }

  String getName() => this._name;

  IconData getIcon() => this._icon;
}
