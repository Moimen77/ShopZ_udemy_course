import 'dart:convert';

List<String> categoriesFromJson(String str) => List<String>.from(
      jsonDecode(str).map((x) => x as String),
    );

String categoriesToJson(List<String> data) => jsonEncode(data);
