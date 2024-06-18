import 'package:flutter/material.dart';

import '../view_model/book_model.dart';

class PCChapterPage extends StatefulWidget {
  final BookModel bookModel;

  const PCChapterPage({super.key, required this.bookModel});

  @override
  State<PCChapterPage> createState() => _PCChapterPageState();
}

class _PCChapterPageState extends State<PCChapterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookModel.bookName),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 3.0,
          childAspectRatio: 12.0,
        ),
        itemCount: widget.bookModel.chapterList.length,
        itemBuilder: (context, index) {
          return InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              widget.bookModel.currentChapterIndex = index;
              Navigator.pushNamed(
                context,
                '/read',
                arguments: widget.bookModel,
              );
            },
            child: Text("chapter ${index + 1}. ${widget.bookModel.chapterList.elementAt(index).chapterName}"),
          );
        },
      ),
    );
  }
}
