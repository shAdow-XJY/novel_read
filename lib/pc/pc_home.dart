import 'package:flutter/material.dart';

class PCHomePage extends StatefulWidget {
  const PCHomePage({super.key});
  @override
  State<PCHomePage> createState() => _PCHomePageState();
}

class _PCHomePageState extends State<PCHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("widget.title")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // 一行显示两个卡片
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8, // 卡片的宽高比
        ),
        itemCount: 10, // 假设有10个卡片
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // 在这里处理点击事件
              Navigator.pushNamed(context, '/read');
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('https://example.com/image_$index.jpg'), // 替换为您的图片URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
