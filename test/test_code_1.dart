import 'package:lzstring/lzstring.dart';

void main() async {
  String originalText = """
  
  """;



  // 预编码文章内容
  print('Origin length: ${originalText.length}');

  // 使用LZString进行压缩
  String? compressedStringSync = LZString.compressSync(originalText);
  String lzString = compressedStringSync ?? "";
  // 打印压缩后的字符串
  print('Compressed length: ${lzString.length}');

  // compressedStringSync = LZString.compressSync(lzString);
  // lzString = compressedStringSync ?? "";
  // // 打印压缩后的字符串
  // print('Compressed length: ${lzString.length}');

  // 使用LZString解压缩
  String? decompressedStringSync = LZString.decompressSync(lzString);
  originalText = decompressedStringSync ?? "";
  print('DecompressedS length: ${originalText.length}');

  // decompressedStringSync = LZString.decompressSync(originalText);
  // originalText = decompressedStringSync ?? "";
  // print('DecompressedS length: ${originalText.length}');

  print('Origin: ${originalText}');

}
