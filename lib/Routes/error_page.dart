import 'package:flutter/material.dart';
import 'package:pragati_v1/main.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key, this.exception}) : super(key: key);

  final Exception? exception;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body: Center(
        child: Text(widget.exception.toString()),
      ),
    );
  }
}
