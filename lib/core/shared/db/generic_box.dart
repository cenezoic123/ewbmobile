import 'package:bridal_project/core/shared/db/hive_db_helper.dart';
import 'package:hive/hive.dart';

class GenericBox {
  Box get genericBox {
    final genericBox = Hive.box(Boxes.genericBox);
    return genericBox;
  }

  Future<int> clearGenericBox() async {
    return await genericBox.clear();
  }

  Future<void> clearGenericBoxKey({required String key}) async {
    return await genericBox.delete(key);
  }

  Future<void> putGenericBox({
    required String key,
    required dynamic value,
  }) async {
    genericBox.put(key, value);
  }

  getGenericValue({required String key}) {
    return genericBox.get(key);
  }

  getGenerics() {
    return genericBox.values.toList();
  }
}
