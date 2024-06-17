import 'package:flutter/material.dart';

import '../view_model/book_model.dart';

class PCReadPage extends StatefulWidget {
  final BookModel bookModel;

  const PCReadPage({
    super.key,
    required this.bookModel
  });

  @override
  State<PCReadPage> createState() => _PCReadPageState();
}

class _PCReadPageState extends State<PCReadPage> {
  /// 页面切换初始化
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _selectedFont = 'NotoSerifSC';
  int currentButtonIndex = -1;
  bool showSettingArea = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("chapter name"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // 打开左侧 Drawer
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // 打开右侧 Drawer
              scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text('book name'),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('chapter $index'),
                    onTap: () {
                      // 更新状态或执行其他操作
                      Navigator.pop(context);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.3), // 使用浅色
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('右侧 Drawer 头部'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('项目 A'),
              onTap: () {
                // 更新状态或执行其他操作
                Navigator.pop(context);
              },
            ),
            // 其他 ListTile...
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '这里是很长的文本...这里是很长的文本...这里是很长的文本...\n\n' * 100, // 示例文本
                      style: TextStyle(fontFamily: _selectedFont),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Text('这里是底部的内容。'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
