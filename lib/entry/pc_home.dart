import 'package:flutter/material.dart';

class PCHomePage extends StatefulWidget {
  const PCHomePage({super.key, required this.title});

  final String title;

  @override
  State<PCHomePage> createState() => _PCHomePageState();
}

class _PCHomePageState extends State<PCHomePage> {
  String _selectedFont = 'NotoSerifSC';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: <Widget>[
          // 左侧按钮区域
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: Container(
              width: 100,  // 按钮区域宽度
              child: Column(
                children: List<Widget>.generate(6, (index) => ElevatedButton(
                    onPressed: () {},
                    child: Text('按钮 ${index + 1}')
                )),
              ),
            ),
          ),
          // 右侧滚动区域
          Positioned(
            top: 0,
            bottom: 0,
            left: 100,  // 等于左侧按钮区域宽度
            right: 0,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '这里是很长的文本...\n\n' * 100,  // 示例文本
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
