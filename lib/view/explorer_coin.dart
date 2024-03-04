import 'package:coinapp/core/providers/page_provider.dart';
import 'package:coinapp/view/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Explorer extends ConsumerWidget {
  final String url;

  Explorer(this.url, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          if (progress == 0) {
            ref.read(loadingProvider.notifier).update((state) => true);
          }
          if (progress == 100) {
            ref.read(loadingProvider.notifier).update((state) => false);
          }
        },
      ))
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return const TabbarPage();
            }));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            Center(
              child:  (ref.watch(loadingProvider.notifier).state)
                  ? const CircularProgressIndicator.adaptive()
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

