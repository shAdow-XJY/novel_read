class BookModel {
  final String bookId;
  final String bookName;
  final String imageUrl;
  int currentChapterIndex;
  final List<BookAttachments> attachments;
  final List<BookChapter> chapterList;

  BookModel({
    required this.bookId,
    required this.bookName,
    required this.imageUrl,
    this.currentChapterIndex = 0,
    required this.attachments,
    required this.chapterList,
  });
}

class BookAttachments {
  final String platform;
  final String website;

  BookAttachments({
    required this.platform,
    required this.website
  });
}

class BookChapter {
  final String chapterId;
  final String chapterName;
  final String chapterContent;

  BookChapter({
    required this.chapterId,
    required this.chapterName,
    required this.chapterContent
  });
}
