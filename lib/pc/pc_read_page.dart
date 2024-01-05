import 'package:flutter/material.dart';

class PCReadPage extends StatefulWidget {
  const PCReadPage({super.key});
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
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('左侧 Drawer 头部'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('项目 1'),
              onTap: () {
                // 更新状态或执行其他操作
                Navigator.pop(context);
              },
            ),
            // 其他 ListTile...
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
                      '这里是很长的文本...这里是很长的文本...这里是很长的文本...\n\n' * 100,  // 示例文本
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
