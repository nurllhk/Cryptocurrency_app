import 'package:coinapp/core/providers/news_provider.dart';
import 'package:coinapp/core/shared/theme/app_color.dart';
import 'package:coinapp/core/shared/theme/app_palet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class News extends ConsumerStatefulWidget {
  const News({super.key});

  @override
  ConsumerState<News> createState() => _NewsState();
}

class _NewsState extends ConsumerState<News> {
  @override
  Widget build(BuildContext context) {
    var news = ref.watch(newsProvider);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: news.when(
          data: (news) {
            return RefreshIndicator(
              color: PageColor.pageColor,
              onRefresh: () async {
                setState(() {});
                return Future<void>.delayed(const Duration(seconds: 3));
              },
              child: ListView.builder(itemBuilder: (context, index) {
                return Container(
                  margin: Palet.pagePadding + const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: Palet.singleRadius),
                  width: size.width / 1.2,
                  height: size.height / 2,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: Palet.singleRadius,
                        child: SizedBox(
                            width: size.width,
                            height: size.height / 4,
                            child: Image.network(
                              news.articles[index].urlToImage ?? "",
                              fit: BoxFit.cover,
                              errorBuilder: (object,s,g){
                                return const SizedBox();
                              },
                            )),
                      ),
                      Container(
                          margin: Palet.pagePadding,
                          width: size.width,
                          height: size.height / 11,
                          child: Text(
                            news.articles[index].title ?? "",
                            style: Theme.of(context).textTheme.titleMedium,
                          )),
                      Container(
                          margin: Palet.pagePadding,
                          width: size.width,
                          height: size.height / 10,
                          child: Text(
                            news.articles[index].description.length > 150
                                ? '${news.articles[index].description.substring(0, 150)}...'
                                : news.articles[index].description ?? "",
                          )),
                    ],
                  ),
                );
              }),
            );
          },
          error: (err, stack) {
            return Center(
              child: Text(
                "Error :$err",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
            );
          },
          loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ))),
    );
  }
} /*  */
