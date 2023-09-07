// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slack & GitHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String slackName = "Clement Yeboah (10811590)";
  final String githubUrl = "https://github.com/baafik";

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slack & GitHub'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              slackName,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Image.asset('images/me.png'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GithubWebView(githubUrl),
                  ),
                );
              },
              child: const Text("Open GitHub"),
            ),
          ],
        ),
      ),
    );
  }
}

class GithubWebView extends StatefulWidget {
  final String githubUrl;

  const GithubWebView(this.githubUrl, {super.key});

  @override
  State<GithubWebView> createState() => _GithubWebViewState();
}

class _GithubWebViewState extends State<GithubWebView> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.githubUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GitHub Profile"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
