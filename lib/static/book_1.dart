import '../view_model/book_model.dart';

final BookModel model1 = BookModel(
  bookId: '1',
  bookName: 'bookName 1',
  imageUrl: '',
  attachments: [
    BookAttachments(
      platform: '',
      website: '',
    ),
  ],
  chapterList: [
    BookChapter(
        chapterId: '0',
        chapterName: 'chapterName 1',
        chapterContent: 'chapterContent 1'),
    BookChapter(
        chapterId: '1',
        chapterName: 'chapterName 2',
        chapterContent: 'chapterContent 2'),
  ],
);
