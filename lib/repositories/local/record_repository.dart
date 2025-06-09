import 'package:migrant_profile/data/local/db_helper.dart';
import 'package:migrant_profile/models/data.dart';
import 'package:sqflite/sqflite.dart';

class RecordRepository{
  get _db => DBHelper.getInstance;

  Future<int> insertRecordPart1(String name,String address1,String address2,String ward,String gender,String phone) async{
    var db = await _db.getDB();
    int rowEffected = await db.insert(DBHelper.TABLE_HOUSE_REPRESENTATIVE,
        {
          'name':name,
          'ward_no':ward,
          'gender':gender,
          'contact_no':phone,
          'toll_name':address1,
          'toll_no':address2,
          'house_no':address2,
          'created_at':DateTime.now().toIso8601String(),
          'updated_at' : DateTime.now().toIso8601String(),
        },conflictAlgorithm: ConflictAlgorithm.replace);
    return rowEffected;
  }

  Future<int> insertRecordPart2(int recordId,int totalMale,int totalFemale,int countMale,int countFemale,String type,
      String occupation,String name,String relation,String caste,String motherTongue,String religion) async{
    var db = await _db.getDB();
    int rowEffected1 = await db.update(DBHelper.TABLE_HOUSE_REPRESENTATIVE,
        {
          'family_members_male_count':totalMale,
          'family_members_female_count':totalFemale,
          'family_members_migration_male_count':countMale,
          'family_members_migration_female_count':countFemale,
          'occupation':occupation,
          'information_provider_name':name,
          'ip_relation_to_hr':relation,
          'information_provider_caste':caste,
          'information_provider_mother_tongue':motherTongue,
          'religion':religion,
          'updated_at' : DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
    int rowEffected = await db.insert(DBHelper.TABLE_RECORD, {
      'house_representative_id':rowEffected1,
      'type':type,
      'is_completed': 0,
      'created_at':DateTime.now().toIso8601String(),
      'updated_at' : DateTime.now().toIso8601String(),
    },conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return rowEffected;
  }

   Future<void> updateRecordGroupAPart1(int recordId,String name,int age,String country,String visitTime,String gender, String caste,String maritalStatus,String educationStatus) async{
   var db = await _db.getDB();
   await db.update(DBHelper.TABLE_RECORD,
       {
         'name':name,
         'gender':gender,
         'age':age,
         'relation_to_hr':caste,
         'marital_status':maritalStatus,
         'education_status':educationStatus,
         'migrated_country':country,
         'migrated_times':visitTime,
         'updated_at': DateTime.now().toIso8601String(),
       },
       where: 'id = ?',
       whereArgs: [recordId]);
 }

  Future<void> updateRecordGroupAPart2(int recordId,String travelMethod,String travelRoad,String visaType,String travelFee,String feFeeMethod,
      int isSkilled,int havePermission,String haveDocumentInHome) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'travel_method': travelMethod,
          'travel_road':travelRoad,
          'visa_type':visaType,
          'is_skilled':isSkilled,
          // 'skilled_occupation': skillName,
          'have_document_in_home':haveDocumentInHome,
          'have_communication_permission':havePermission,
          'fe_fee':travelFee,
          'fe_fee_paid_method':feFeeMethod,
          // 'communication_permission_method':permissionMethod,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<void> updateRecordGroupAPart3(int recordId,String foreignOccupation,int facedProblemAbroad,String facedProblemType,int facedFamilyPmAb,String facedFamilyPmAbType) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'foreign_occupation': foreignOccupation,
          'faced_problems_abroad':facedProblemAbroad,
          'problem_type':facedProblemType,
          'home_problem':facedFamilyPmAb,
          'home_problem_type':facedFamilyPmAbType,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<void> updateRecordGroupBPart4(int recordId,int employeeOnBusiness,String businessHelpFromGovernment,String expectedHelpFromGovernment,String difficultiesToStartBusiness) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'employees_on_current_business': employeeOnBusiness,
          'business_help_government': businessHelpFromGovernment,
          'want_help_type_from_business': expectedHelpFromGovernment,
          'difficulties_to_start_business':difficultiesToStartBusiness,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<void> updateRecordGroupAPart4(int recordId,String covidHealthIssue,String foreignEmploymentFamilyIssue,String covidProblem) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'have_covid_related_problem':covidProblem.isNotEmpty,
          'covid_problem_type':covidProblem,
          'covid_health_issue':covidHealthIssue.isNotEmpty,
          'covid_health_issue_type': covidHealthIssue,
          'home_problem':foreignEmploymentFamilyIssue.isNotEmpty,
          'home_problem_type':foreignEmploymentFamilyIssue,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<void> updateRecordGroupAPart5(int recordId,String reMarriedGender,int isElderAloneOnHome,int isChildrenOutForStudy,String childrenOutForStudy,int haveSendMoney,String moneyNotSendProblem,String remittanceCount,String remittanceAmount) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'remarried_gender':reMarriedGender,
          'is_elder_only_home':isElderAloneOnHome,
          'is_children_out_for_study':isChildrenOutForStudy,
          'children_out_for_study':childrenOutForStudy,
          'have_send_money':haveSendMoney, //int
          'money_not_send_problem':moneyNotSendProblem, //string
          'remittance_count':remittanceCount, //int
          'remittance_amount':remittanceAmount,//string
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<void> updateRecordGroupAPart6(int recordId,String remittanceSpendSource,int landFromRemittance,String landFromRemittanceLocation,
      String remittanceSavedSource,String migrationPlanLocation,String planAfterReturn,String remittanceCollectMethod) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'remittance_spend_source':remittanceSpendSource,
          'is_land_purchased':landFromRemittance,
          'land_purchased_location':landFromRemittanceLocation,
          'remittance_saving_method': remittanceSavedSource,
          'migration_plan_location':migrationPlanLocation,
          'plan_after_return':planAfterReturn,
          'remittance_collect_method':remittanceCollectMethod,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<void> updateRecordGroupBPart1(int recordId,String name,String gender,int age,String maritalStatus,String relation,
      String homeReturnAfter,String homeReturnDuration,String homeReturnReason,String country, String educationStatus,
      int totalMaleReturn,int totalFeMaleReturn,String phone) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'name':name,
          'age':age,
          'gender':gender,
          'contact_no':phone,
          'relation_to_hr':relation,
          'education_status':educationStatus,
          'marital_status':maritalStatus,
          'migrated_country':country,
          'home_returned_after':homeReturnAfter,
          'home_returned_after_duration':homeReturnDuration,
          'home_return_reason':homeReturnReason,
          'total_family_returned':totalMaleReturn+totalFeMaleReturn,
          'total_family_returned_male':totalMaleReturn,
          'total_family_returned_female':totalFeMaleReturn,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<void> updateRecordGroupBPart2(int recordId,int wantTogoAgain, String isDisabled,String workOnForeign,String workExp,String skillTrainingAfterReturn,
      String occupationNow,String businessType) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'want_to_go_again':wantTogoAgain,
          'is_disabled_on_foreign':isDisabled,
          'work_on_foreign':workOnForeign,
          'work_exp_on_fe':workExp,
          'skill_training_after_return':skillTrainingAfterReturn,
          'occupation_now':occupationNow,
          'business_type':businessType,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<void> updateRecordGroupBPart3(int recordId,String difficulties,String desiredWork,String requirements) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'difficulties_to_start_business':difficulties,
          'desired_or_current_work_area_in_nepal':desiredWork,
          'requirements_for_employment_in_nepal':requirements,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<void> updateLocation(int recordId,String latitude,String longitude) async{
    var db = await _db.getDB();
    await db.update(DBHelper.TABLE_RECORD,
        {
          'is_completed': 1,
          'longitude':longitude,
          'latitude':latitude,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [recordId]);
  }

  Future<Map<String, int>> getCounts() async {
    var db = await _db.getDB();
    var draftCountResult = await db.rawQuery('SELECT COUNT(*) FROM ${DBHelper.TABLE_RECORD} WHERE is_completed = 0');
    var completedCountResult = await db.rawQuery('SELECT COUNT(*) FROM ${DBHelper.TABLE_RECORD} WHERE is_completed = 1');
    int draftCount = Sqflite.firstIntValue(draftCountResult) ?? 0;
    int completedCount = Sqflite.firstIntValue(completedCountResult) ?? 0;
    return {
      'drafts': draftCount,
      'completed': completedCount,
    };
  }


  Future<List<DataModel>> getCompletedRecords() async{
   var db = await _db.getDB();
   var result = await db.rawQuery('''SELECT id,name,contact_no,migrated_country,type FROM ${DBHelper.TABLE_RECORD} WHERE is_completed = 1 ORDER BY updated_at desc''');
   List<Map<String, dynamic>> recordMap = List<Map<String, dynamic>>.from(result);
   List<DataModel> records = recordMap.map((Map<String, dynamic> map) => DataModel.fromMap(map)).toList();
   return records;
 }

  Future<List<DataModel>> getDraftRecords() async{
    var db = await _db.getDB();
    var result = await db.rawQuery('''SELECT id,name,contact_no,migrated_country,type FROM ${DBHelper.TABLE_RECORD} WHERE is_completed = 0 ORDER BY updated_at desc''');
    List<Map<String, dynamic>> recordMap = List<Map<String, dynamic>>.from(result);
    List<DataModel> records = recordMap.map((Map<String, dynamic> map) => DataModel.fromMap(map)).toList();
    return records;
  }

  Future<bool> deleteRecord(int recordId) async{
    var db = await _db.getDB();
    try{
      await db.delete(
        DBHelper.TABLE_RECORD,
        where: 'id = ?',
        whereArgs: [recordId],
      );
      var result = await db.rawQuery('''SELECT house_representative_id FROM ${DBHelper.TABLE_RECORD} WHERE id = ?''', [recordId]);
      if (result.isNotEmpty) {
        var representativeId = result[0]['house_representative_id'];
        await db.delete(
          DBHelper.TABLE_HOUSE_REPRESENTATIVE,
          where: 'id = ?',
          whereArgs: [representativeId],
        );
      }
      return true;
    }catch(_){
      return false;
    }
  }

  Future<Map<String,dynamic>> retrieveRecordGroupAPart1(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id,name,age,relation_to_hr,marital_status,education_status,migrated_country,migrated_times,gender FROM 
    ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecordGroupAPart2(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id,travel_method,travel_road,visa_type,is_skilled,have_document_in_home,have_communication_permission,fe_fee,fe_fee_paid_method FROM
    ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecordGroupAPart3(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id,foreign_occupation,faced_problems_abroad,problem_type,home_problem,home_problem_type FROM
    ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecordGroupAPart4(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id,covid_health_issue,covid_health_issue_type,home_problem,home_problem_type,covid_problem_type FROM
    ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecordGroupAPart5(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id,remarried_gender,is_elder_only_home,is_children_out_for_study,children_out_for_study,have_send_money,money_not_send_problem,remittance_count,remittance_amount FROM
    ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecordGroupAPart6(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id, remittance_spend_source,is_land_purchased,land_purchased_location,remittance_saving_method,migration_plan_location,plan_after_return,remittance_collect_method FROM
    ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecordGroupBPart1(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id,name,age,gender,contact_no,relation_to_hr,education_status,marital_status,migrated_country,home_returned_after,home_returned_after_duration,home_return_reason,total_family_returned,total_family_returned_male,total_family_returned_female FROM
    ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecordGroupBPart2(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id,want_to_go_again,is_disabled_on_foreign,work_on_foreign,work_exp_on_fe,skill_training_after_return,occupation_now,business_type FROM
    ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecordGroupBPart3(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id,difficulties_to_start_business,desired_or_current_work_area_in_nepal,requirements_for_employment_in_nepal FROM ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecordGroupBPart4(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''
    SELECT id,employees_on_current_business,business_help_government,want_help_type_from_business,difficulties_to_start_business FROM ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveRecord(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''SELECT * FROM ${DBHelper.TABLE_RECORD} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String,dynamic>> retrieveHouseRepresentative(int recordId) async{
    var db = await _db.getDB();
    var result =  await db.rawQuery('''SELECT * FROM ${DBHelper.TABLE_HOUSE_REPRESENTATIVE} WHERE id = $recordId''');
    return result.isNotEmpty ? result.first : null;
  }
}