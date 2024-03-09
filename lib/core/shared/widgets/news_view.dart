import 'package:coinapp/core/shared/models/news_model.dart';
import 'package:coinapp/core/shared/theme/app_palet.dart';
import 'package:coinapp/view/explorer_coin.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  final Article articl;

  const NewsView(this.articl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: "newImage",
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.2,
                    child: Image.network(
                      articl.urlToImage ?? "",
                      fit: BoxFit.cover,
                      errorBuilder: (object,s,g){
                        return const SizedBox();
                      },)),
              ),
            ),
            Padding(
              padding: Palet.pagePadding,
              child: Column(
                children: [
                  Text(
                    articl.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      articl.description ?? "",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  ListTile(
                    title: Text(articl.author ?? ""),
                    subtitle:
                        Text(articl.publishedAt.toString().substring(0, 11)),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {

                                return Explorer(articl.url ?? "");
                          }));
                        },
                        icon: const Icon(Icons.language)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
