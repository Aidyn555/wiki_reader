import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:wiki_reader/summary.dart';

const summaryHiveBox = "summaryHiveBox";
class SummaryHiveBox{
  static final summaryBox = Hive.box(summaryHiveBox);
  static void create(key, summary){
    summaryBox.put (key, summary);
  }
  static Summary get (key){
    return summaryBox.get (key);
  }
  static List getAll(){
    return summaryBox.keys.map((key) => summaryBox.get(key)).toList();
  }
}