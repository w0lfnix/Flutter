import 'package:flutter/material.dart';

class CreateArticle extends StatefulWidget {
  @override
  _CreateArticleState createState() => _CreateArticleState();
}

class _CreateArticleState extends State<CreateArticle> {
  String _titre;
  String _tags;
  String _contenu;

  final _formKey = GlobalKey<FormState>();

  Widget buildTitre() => TextFormField(
        decoration: InputDecoration(labelText: "Titre"),
        validator: (value) {
          if (value.isEmpty) {
            return "champ requis";
          } else {
            return null;
          }
        },
        onSaved: (String value) => _titre = value,
      );
  Widget buildTags() => TextFormField();
  Widget buildContenu() => TextFormField();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: <Widget>[buildTitre()],
        ),
      ),
    );
  }
}
