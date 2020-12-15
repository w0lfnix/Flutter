import 'package:flutter/material.dart';
import 'package:scapp/Account.dart';
import 'package:scapp/CategoryArt.dart';
import 'package:scapp/main.dart';

class Article {
  String _title;
  Set _tags;
  CategoryArt _category;
  int _score;
  String _content;
  Account _author;

  Article(String t, Set<String> tgs, CategoryArt cat, String cont, Account a) {
    this._category = cat;
    this._score = 0;
    this._tags = tgs;
    this._title = t;
    this._content = cont;
    this._author = a;
  }

  String getTitle() => this._title;
  Set getTags() => this._tags;
  CategoryArt getCategory() => this._category;
  int getScore() => this._score;
  String getContent() => this._content;
  Account getAuthor() => this._author;

  void incrementScore() => this._score += 1;
  void decrementScore() => this._score -= 1;

  ListTile getTile(BuildContext context) {
    IconData icon = this._category.getIcon();
    return ListTile(
      leading: Icon(icon),
      title: Text(this.getTitle()),
      subtitle: Text(this.tagToString()),
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ArticlePage(this))),
    );
  }

  String tagToString() {
    String s = "";
    this.getTags().forEach((element) {
      s += "#$element; ";
    });
    return s;
  }
}
