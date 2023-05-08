import 'package:flutter_sqflite_study_sample/src/model/sample.dart';
import 'package:flutter_sqflite_study_sample/src/repository/sql_database.dart';

class SqlSampleCrudRepository {
  // static Future<Sample> create(Sample sample) async {
  //   var db = await SqlDatabase().database;
  //   db.insert(Sample.tableName, Sample.toJson())
  // }

  static Future<Sample> create(Sample sample) async {
    var db = await SqlDataBase.instance.database;
    var id = await db.insert(Sample.tableName, sample.toJson());
    return sample.clone(id: id);
  }

  static Future<List<Sample>> getList() async {
    var db = await SqlDataBase.instance.database;
    var result = await db.query(Sample.tableName, columns: [
      SampleFields.id,
      SampleFields.name,
      SampleFields.yn,
      SampleFields.value,
      SampleFields.createdAt
    ]);

    return result.map(
      (data) {
        return Sample.fromJson(data);
      },
    ).toList();
  }

  //getSampleOne
  static Future<Sample?> getSampleOne(int id) async {
    var db = await SqlDataBase.instance.database;
    var result = await db.query(
      Sample.tableName,
      columns: [
        SampleFields.id,
        SampleFields.name,
        SampleFields.yn,
        SampleFields.value,
        SampleFields.createdAt
      ],
      where: '${SampleFields.id} = ?',
      whereArgs: [id],
    );
    var list = result.map(
      (data) {
        return Sample.fromJson(data);
      },
    ).toList();

    if (!list.isEmpty) {
      return list.first;
    } else {
      return null;
    }
  }

  static Future<int> update(Sample sample) async {
    print(sample.toJson());
    var db = await SqlDataBase.instance.database;
    return await db.update(
      Sample.tableName,
      sample.toJson(),
      where: '${SampleFields.id} = ?',
      whereArgs: [sample.id],
    );
  }

  static Future<int> delete(int id) async {
    var db = await SqlDataBase.instance.database;
    return await db.delete(
      Sample.tableName,
      where: '${SampleFields.id} = ?',
      whereArgs: [id],
    );
  }
}
