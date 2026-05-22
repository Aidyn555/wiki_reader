import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

const summaryHiveBox = "summaryHiveBox";

class SummaryHiveBox {
  static final summaryBox = Hive.box<Article>(summaryHiveBox);
  static void create(key, summary) {
    summaryBox.put(key, summary);
  }

  static Article? get(key) {
    return summaryBox.get(key);
  }

  static List<Article?> getAll() {
    return summaryBox.keys.map((key) => summaryBox.get(key)).toList();
  }
}

@HiveType(typeId: 1)
class Article {
  @HiveField(0)
  final String titles;
  @HiveField(1)
  final String? imageSource;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final String extract;
  const Article({
    required this.id,
    required this.titles,
    this.description,
    this.imageSource,
    required this.extract,
  });
}

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final typeId = 1;
  @override
  Article read(BinaryReader reader) {
    return Article(
      titles: reader.read() as String,
      imageSource: reader.read() as String,
      description: reader.read() as String,
      id: reader.read() as int,
      extract: reader.read() as String,
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer.write(obj.titles);
    writer.write(obj.imageSource);
    writer.write(obj.description);
    writer.write(obj.id);
    writer.write(obj.extract);
  }
}
