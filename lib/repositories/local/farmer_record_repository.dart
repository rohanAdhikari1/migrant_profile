// import 'package:avis/data/local/db_helper.dart';
// import 'package:avis/models/data.dart';
// import 'package:sqflite/sqflite.dart';
//
// class FarmerRecordRepository{
//   get _db => DBHelper.getInstance;
//
//   Future<List<DataModel>> getCompletedRecords() async{
//    var db = await _db.getDB();
//    var result = await db.rawQuery('''
//     SELECT fr.id,fm.name,fm.ward,fm.phone,fr.${DBHelper.COLUMN_REGISTRATION_NUMBER},
//     fr.${DBHelper.COLUMN_LATITUDE},fr.${DBHelper.COLUMN_LONGITUDE},
//     fm.${DBHelper.COLUMN_REGISTRATION_NUMBER} as farmer_registration_number,
//          SUM(CAST(frvc.total_count AS INT)) AS total_count_sum,
//          SUM(CAST(frvc.vaccinated_count AS INT)) AS vaccinated_count_sum
//   FROM ${DBHelper.TABLE_FARMER_RECORD} fr
//   JOIN ${DBHelper.TABLE_FARMER} fm
//     ON fm.${DBHelper.COLUMN_ID} = fr.farmer_id
//   JOIN ${DBHelper.TABLE_FARMER_RECORD_VACCINES} frvc
//     ON fr.${DBHelper.COLUMN_ID} = frvc.farmer_record_id
//   WHERE fr.${DBHelper.COLUMN_IS_COMPLETED} = 1
//   GROUP BY fr.${DBHelper.COLUMN_REGISTRATION_NUMBER}
//   ORDER BY fr.${DBHelper.COLUMN_UPDATED_AT_FARMER} desc
// ''');
//    List<Map<String, dynamic>> farmersRecordMap = List<Map<String, dynamic>>.from(result);
//    List<DataModel> farmersRecords = farmersRecordMap.map((Map<String, dynamic> map) => DataModel.fromMap(map)).toList();
//    return farmersRecords;
//  }
//
//   Future<List<DataModel>> getDraftsRecords() async{
//     var db = await _db.getDB();
//     var result = await db.rawQuery('''
//     SELECT fr.id,fm.name,fm.ward,fm.phone,fr.${DBHelper.COLUMN_REGISTRATION_NUMBER},${DBHelper.COLUMN_LATITUDE},${DBHelper.COLUMN_LONGITUDE},
//     fm.${DBHelper.COLUMN_REGISTRATION_NUMBER} as farmer_registration_number,
//          SUM(CAST(frvc.total_count AS INT)) AS total_count_sum,
//          SUM(CAST(frvc.vaccinated_count AS INT)) AS vaccinated_count_sum
//   FROM ${DBHelper.TABLE_FARMER_RECORD} fr
//   JOIN ${DBHelper.TABLE_FARMER} fm
//     ON fm.${DBHelper.COLUMN_ID} = fr.farmer_id
//   LEFT JOIN ${DBHelper.TABLE_FARMER_RECORD_VACCINES} frvc
//     ON fr.${DBHelper.COLUMN_ID} = frvc.farmer_record_id
//   WHERE fr.${DBHelper.COLUMN_IS_COMPLETED} = 0
//   GROUP BY fr.${DBHelper.COLUMN_REGISTRATION_NUMBER}
//   ORDER BY fr.${DBHelper.COLUMN_UPDATED_AT_FARMER} desc
// ''');
//     List<Map<String, dynamic>> farmersRecordMap = List<Map<String, dynamic>>.from(result);
//     List<DataModel> farmersRecords = farmersRecordMap.map((Map<String, dynamic> map) => DataModel.fromMap(map)).toList();
//     return farmersRecords;
//   }
//
//   Future<Map<String, int>> getCounts() async {
//     var db = await _db.getDB();
//     var draftCountResult = await db.rawQuery('SELECT COUNT(*) FROM ${DBHelper.TABLE_FARMER_RECORD} WHERE ${DBHelper.COLUMN_IS_COMPLETED} = 0');
//     var completedCountResult = await db.rawQuery('SELECT COUNT(*) FROM ${DBHelper.TABLE_FARMER_RECORD} WHERE ${DBHelper.COLUMN_IS_COMPLETED} = 1');
//     int draftCount = Sqflite.firstIntValue(draftCountResult) ?? 0;
//     int completedCount = Sqflite.firstIntValue(completedCountResult) ?? 0;
//     return {
//       'drafts': draftCount,
//       'completed': completedCount,
//     };
//   }
//
//  Future<void> updateFarmerRecord(int farmerRecordId,String latitude , String longitude) async{
//    var db = await _db.getDB();
//    await db.update(DBHelper.TABLE_FARMER_RECORD,
//        {
//          DBHelper.COLUMN_IS_COMPLETED: 1,
//          DBHelper.COLUMN_LONGITUDE:longitude,
//          DBHelper.COLUMN_LATITUDE:latitude,
//
//          DBHelper.COLUMN_UPDATED_AT_FARMER: DateTime.now().toIso8601String(),
//        },
//        where: 'id = ?',
//        whereArgs: [farmerRecordId]);
//  }
//
//  Future<List<Map<String,dynamic>>> getRecordWithAnimalAndVaccine(int farmerRecordId,int vaccineId) async{
//    var db = await _db.getDB();
//    var result =  await db.query(DBHelper.TABLE_FARMER_RECORD_VACCINES,where: 'farmer_record_id=? AND vaccine_id=?',
//        whereArgs: [farmerRecordId,vaccineId]);
//    return result;
//  }
//
//   Future<List<Map<String,dynamic>>> getRecordWithVaccines(int farmerRecordId) async{
//     var db = await _db.getDB();
//     var result =  await db.query(DBHelper.TABLE_FARMER_RECORD_VACCINES,where: 'farmer_record_id=?',
//         whereArgs: [farmerRecordId]);
//     return result;
//   }
//
//   Future<List<Map<String,dynamic>>> getRecordWithRemark(int farmerRecordId) async{
//     var db = await _db.getDB();
//     var result =  await db.query(DBHelper.TABLE_FARMER_VACCINES_REMARK,where: 'farmer_record_id=?',
//         whereArgs: [farmerRecordId]);
//     return result;
//   }
//
//   Future<bool> deleteFarmerRecord(int farmerRecordId) async{
//     var db = await _db.getDB();
//     try{
//       await db.delete(
//         DBHelper.TABLE_FARMER_RECORD_VACCINES,
//         where: 'farmer_record_id = ?',
//         whereArgs: [farmerRecordId],
//       );
//       await db.delete(
//         DBHelper.TABLE_FARMER_RECORD,
//         where: 'id = ?',
//         whereArgs: [farmerRecordId],
//       );
//       return true;
//     }catch(_){
//       return false;
//     }
//   }
//
//   Future<void> insertOrUpdateRecordWithAnimalAndVaccine(int farmerRecordId, int vaccineId, int animalId, String totalCount, String vaccinatedCount) async {
//     var db = await _db.getDB();
//     var existingRecord = await db.query(
//       DBHelper.TABLE_FARMER_RECORD_VACCINES,
//       where: 'farmer_record_id = ? AND vaccine_id = ? AND animal_id = ?',
//       whereArgs: [farmerRecordId, vaccineId, animalId],
//     );
//     if (existingRecord.isNotEmpty) {
//       await db.update(
//         DBHelper.TABLE_FARMER_RECORD_VACCINES,
//         {
//           DBHelper.COLUMN_TOTAL_COUNT: totalCount,
//           DBHelper.COLUMN_VACCINATED_COUNT: vaccinatedCount,
//           DBHelper.COLUMN_UPDATED_AT_FARMER: DateTime.now().toIso8601String(),
//         },
//         where: 'farmer_record_id = ? AND vaccine_id = ? AND animal_id = ?',
//         whereArgs: [farmerRecordId, vaccineId, animalId],
//       );
//     } else {
//       await db.insert(
//         DBHelper.TABLE_FARMER_RECORD_VACCINES,
//         {
//           'farmer_record_id': farmerRecordId,
//           'vaccine_id': vaccineId,
//           'animal_id': animalId,
//           DBHelper.COLUMN_TOTAL_COUNT: totalCount,
//           DBHelper.COLUMN_VACCINATED_COUNT: vaccinatedCount,
//           DBHelper.COLUMN_CREATED_AT_FARMER: DateTime.now().toIso8601String(),
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//   }
//
//   Future<void> insertOrUpdateRecordWithRemarks(int farmerRecordId, int vaccineId, String remarks) async {
//     var db = await _db.getDB();
//     var existingRecord = await db.query(
//       DBHelper.TABLE_FARMER_VACCINES_REMARK,
//       where: 'farmer_record_id = ? AND vaccine_id = ?',
//       whereArgs: [farmerRecordId, vaccineId],
//     );
//     if (existingRecord.isNotEmpty) {
//       await db.update(
//         DBHelper.TABLE_FARMER_VACCINES_REMARK,
//         {
//           DBHelper.COLUMN_REMARK: remarks,
//           DBHelper.COLUMN_UPDATED_AT_FARMER: DateTime.now().toIso8601String(),
//         },
//         where: 'farmer_record_id = ? AND vaccine_id = ?',
//         whereArgs: [farmerRecordId, vaccineId],
//       );
//     } else {
//       await db.insert(
//         DBHelper.TABLE_FARMER_VACCINES_REMARK,
//         {
//           'farmer_record_id': farmerRecordId,
//           'vaccine_id': vaccineId,
//           DBHelper.COLUMN_REMARK: remarks,
//           DBHelper.COLUMN_UPDATED_AT_FARMER: DateTime.now().toIso8601String(),
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//   }
//
// }