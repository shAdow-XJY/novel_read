import 'package:flutter/material.dart';
import 'package:novel_read/pc/pc_read_page.dart';

import '../../pc/pc_chapter_page.dart';
import '../../pc/pc_home.dart';
import '../../view_model/book_model.dart';

/// 需要引入跳转页面地址

/// 配置路由
// final routes = {
//   /// 前面是自己的命名 后面是加载的方法
//   /// 不用传参的写法
//   '/': (context) => const PCHomePage(),
//   '/home': (context) => const PCHomePage(),
//   '/chapterDirectory': (context) => (context, {arguments}) => PCChapterPage(bookId: arguments as String),
//   '/read': (context) => (context, {arguments}) => PCReadPage(chapterId: arguments as String),
// };
//
// /// 固定写法，统一处理，无需更改
// var pcGenerateRoute = (RouteSettings settings) {
//   final String? name = settings.name;
//   if (name != null) {
//     final Function? pageContentBuilder = routes[name];
//     if (pageContentBuilder != null) {
//       if (settings.arguments != null) {
//         final Route route = MaterialPageRoute(
//             builder: (context) =>
//                 pageContentBuilder(context, arguments: settings.arguments));
//         return route;
//       } else {
//         final Route route = MaterialPageRoute(
//             builder: (context) => pageContentBuilder(context));
//         return route;
//       }
//     }
//   }
// };
final routes = {
  '/': (context) => const PCHomePage(),
  '/home': (context) => const PCHomePage(),
  // 路由表中的函数不需要处理参数
};

Route<dynamic>? pcGenerateRoute(RouteSettings settings) {
  final String? name = settings.name;
  final Object? arguments = settings.arguments;

  switch (name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const PCHomePage());
    case '/home':
      return MaterialPageRoute(builder: (context) => const PCHomePage());
    case '/chapterDirectory':
      if (arguments is BookModel) {
        return MaterialPageRoute(builder: (context) => PCChapterPage(bookModel: arguments,));
      }
      return _errorRoute();
    case '/read':
      if (arguments is BookModel) {
        return MaterialPageRoute(builder: (context) => PCReadPage(bookModel: arguments,));
      }
      return _errorRoute();
    default:
      return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    );
  });
}
