import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultForSearchPage extends StatefulWidget {
  const ResultForSearchPage({required this.searchedQuery, super.key});
  final String searchedQuery;
  @override
  State<ResultForSearchPage> createState() => _ResultForSearchPageState();
}

class _ResultForSearchPageState extends State<ResultForSearchPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.shade50,
        title: Text(
          widget.searchedQuery.toString(),
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 2),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red.shade100,
                ),
                width: size.width * .4,
              );
            }),
      ),
    );
  }
}
