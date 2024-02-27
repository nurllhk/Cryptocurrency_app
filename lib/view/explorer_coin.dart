
import 'package:coinapp/view/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Explorer extends StatelessWidget {
  final String url;
   Explorer(this.url,{super.key});



  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return const TabbarPage();
          }));
        }, icon:const  Icon(Icons.arrow_back_ios_new)),
      ),

      body:SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
