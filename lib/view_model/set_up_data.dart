import 'package:novel_read/static/book_1.dart';

import 'book_model.dart';

class BookManager {
  // 私有构造函数
  BookManager._privateConstructor();

  // 单例实例
  static final BookManager instance = BookManager._privateConstructor();

  // 书籍列表
  final List<BookModel> bookList = [
    model1,
  ];
}
