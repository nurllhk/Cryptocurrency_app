import 'package:coinapp/core/providers/page_provider.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/services/coins_serivce.dart';
import '../core/shared/theme/app_color.dart';

class TabbarPage extends ConsumerWidget {
  const TabbarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TabbarManager tabbar = ref.watch(tabbarProvider);
    return Scaffold(
        backgroundColor: PageColor.pageColor,
        bottomNavigationBar: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: PageColor.componentColor,
          strokeColor: PageColor.strokeColor,
          unSelectedColor: PageColor.grayColor,
          backgroundColor: Colors.white,
          currentIndex: tabbar.index,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.search),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.article),
            ),
          ],
          onTap: (value) {
            ref.read(tabbarProvider).tabbarTransition(value);
          },
        ),
        body: tabbar.pages[tabbar.index]);
  }
}
