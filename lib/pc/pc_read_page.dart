import 'package:flutter/material.dart';

class PCReadPage extends StatefulWidget {
  const PCReadPage({super.key});
  @override
  State<PCReadPage> createState() => _PCReadPageState();
}

class _PCReadPageState extends State<PCReadPage> {
  String _selectedFont = 'NotoSerifSC';
  int currentButtonIndex = -1;
  bool showSettingArea = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("widget.title")),
      body: Stack(
        children: <Widget>[
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
          // 左侧按钮区域
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: 100,  // 按钮区域宽度
              child: Column(
                children: List<Widget>.generate(6, (index) => ElevatedButton(
                    onPressed: () {
                      debugPrint("click按钮 ${index + 1}");
                      if (currentButtonIndex != index) {
                        setState(() {
                          currentButtonIndex = index;
                          showSettingArea = true;
                        });
                      } else {
                        setState(() {
                          showSettingArea = !showSettingArea;
                        });
                      }
                    },
                    child: Text('按钮 ${index + 1}')
                )),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 100,
            child: Visibility(
              visible: showSettingArea,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: AnimatedOpacity(
                opacity: showSettingArea ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Container(
                  width: size.width * 0.66,
                  height: size.height * 0.66,
                  color: Colors.red,
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
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
            ),
          ),
        ],
      ),
    );
  }
}
