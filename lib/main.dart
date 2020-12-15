import 'package:flutter/material.dart';
import 'package:scapp/Account.dart';
import 'package:scapp/Article.dart';
import 'package:scapp/CreateArticle.dart';
import 'CategoryArt.dart';
import 'package:scapp/cat_icons_icons.dart';
import 'cat_icons_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final Map categories = {
    "nature": new CategoryArt("nature", CatIcons.leaf),
    "maths": new CategoryArt("Maths", CatIcons.math),
    "science": new CategoryArt("science", CatIcons.atom),
    "astronomy": new CategoryArt("astronomy", CatIcons.space_shuttle)
  };
  static List<Account> comptes = [new Account("john", "smith")];

  List<Article> arts = [
    new Article(
        "La fonte des glaces",
        {"rechauffement", "planete"},
        categories["nature"],
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque perferendis repellendus nostrum minus numquam, incidunt repellat totam eum architecto fuga, facilis natus! Molestias quibusdam possimus architecto necessitatibus illum, nisi voluptatum?",
        comptes[0]),
    new Article(
        "l'origine de pi",
        {"cercle"},
        categories["maths"],
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque perferendis repellendus nostrum minus numquam, incidunt repellat totam eum architecto fuga, facilis natus! Molestias quibusdam possimus architecto necessitatibus illum, nisi voluptatum?",
        comptes[0]),
    new Article(
        "[attention] : mars",
        {
          "planete",
        },
        categories["astronomy"],
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque perferendis repellendus nostrum minus numquam, incidunt repellat totam eum architecto fuga, facilis natus! Molestias quibusdam possimus architecto necessitatibus illum, nisi voluptatum?",
        comptes[0])
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateArticle()))
              }),
      appBar: AppBar(
        title: Text("SciVulg"),
      ),
      body: ListView.separated(
        itemCount: arts.length,
        itemBuilder: _buildArticle,
        separatorBuilder: (context, index) => Divider(
          thickness: 1.5,
        ),
      ),
    ));
  }

  Widget _buildArticle(BuildContext context, int i) {
    return arts[i].getTile(context);
  }
}

class ArticlePage extends StatelessWidget {
  Article art;
  ArticlePage(Article a) {
    this.art = a;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.art.getTitle())),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Wrap(
                  spacing: 20,
                  children: [
                    Icon(
                      this.art.getCategory().getIcon(),
                      size: 50,
                    ),
                    Text(this.art.tagToString())
                  ],
                )),
            Text(this.art.getContent()),
            Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text("Auteur : " + this.art.getAuthor().getIdentity())),
          ]),
        ));
  }
}
