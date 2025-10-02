import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/checknote_entity.dart';

/// 체크 노트 로컬 데이터 소스
class ChecknoteLocalDataSource {
  const ChecknoteLocalDataSource();

  static const String _storageKey = 'checknotes';

  /// 체크 노트를 저장합니다.
  Future<void> saveChecknote(ChecknoteEntity checknote) async {
    final prefs = await SharedPreferences.getInstance();
    final checknotes = await getChecknotes();

    // 기존 체크 노트가 있으면 업데이트, 없으면 추가
    final existingIndex = checknotes.indexWhere((c) => c.id == checknote.id);
    if (existingIndex >= 0) {
      checknotes[existingIndex] = checknote;
    } else {
      checknotes.add(checknote);
    }

    final jsonList = checknotes.map((c) => c.toJson()).toList();
    await prefs.setString(_storageKey, jsonEncode(jsonList));
  }

  /// 체크 노트 목록을 조회합니다.
  Future<List<ChecknoteEntity>> getChecknotes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList
          .map((json) => ChecknoteEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // JSON 파싱 오류 시 빈 리스트 반환
      return [];
    }
  }

  /// 체크 노트를 조회합니다.
  Future<ChecknoteEntity?> getChecknote(String id) async {
    final checknotes = await getChecknotes();
    try {
      return checknotes.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 체크 노트를 삭제합니다.
  Future<void> deleteChecknote(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final checknotes = await getChecknotes();

    checknotes.removeWhere((c) => c.id == id);

    final jsonList = checknotes.map((c) => c.toJson()).toList();
    await prefs.setString(_storageKey, jsonEncode(jsonList));
  }
}
