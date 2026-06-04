import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unitask/core/enum/priority.dart';
import 'package:unitask/core/models/assignment.dart';
import 'package:unitask/core/models/result.dart';
import 'package:unitask/features/auth/auth_provider.dart';
import 'package:unitask/services/assignment_api_service.dart';

final assignmentApiServiceProvider = Provider((ref) => AssignmentApiService());

//전체 과제 목록, 나머지 분기
final assignmentProvider = AsyncNotifierProvider(AssignmentNotifier.new);

// 진행 중인 과제 (필터링)
final inProgressAssignmentProvider = Provider(
  (ref) => ref
      .watch(assignmentProvider)
      .whenData((l) => l.where((a) => !a.status.isCompleted).toList()),
);

// 완료 과제
final completedAssignmentProvider = Provider(
  (ref) => ref
      .watch(assignmentProvider)
      .whenData((l) => l.where((a) => !a.status.isCompleted).toList()),
);

class AssignmentNotifier extends AsyncNotifier<List<Assignment>> {
  // 로그인 토큰, 미인증 시 예외처리 필요.
  String get _token {
    final token = ref.read(authProvider).value?.accessToken;
    if (token == null) throw Exception('로그인이 필요합니다.');
    return token;
  }

  AssignmentApiService get _api => ref.read(assignmentApiServiceProvider);

  @override
  /// 과제 생성
  ///
  /// [subjectId] : 과목명
  /// [title] : 과제명
  /// [description] : 설명
  /// [dueDate] : 마감일
  /// [priority] : 순위
  FutureOr<List<Assignment>> build() async {
    final result = await _api.fetchAll(_token);
    return switch (result) {
      Success(:final value) => value,
      Failure(:final exception) => throw exception,
    };
  }

  // 과제 업데이트
  Future<Result<Assignment>> create({
    required String subjectId,
    required String title,
    required DateTime dueDate,
    String? description,
    Priority priority = .medium,
  }) async {
    final result = await _api.create(
      accessToken: _token,
      subjectId: subjectId,
      title: title,
      dueDate: dueDate,
      description: description,
      priority: priority,
    );
    if (result is Success) ref.invalidateSelf();
    return result;
  }

  // 과제 업데이트
  Future<Result<Assignment>> updateAssignment({
    required String id,
    String? subjectId,
    String? title,
    DateTime? dueDate,
    String? description,
    Priority? priority,
  }) async {
    final result = await _api.update(
      accessToken: _token,
      id: id,
      subjectId: subjectId,
      title: title,
      description: description,
      dueDate: dueDate,
      priority: priority,
    );
    if (result is Success) ref.invalidateSelf();
    return result;
  }

  // 과제 삭제
  Future<Result<void>> deletedAssignment(String id) async {
    final reslut = _api.delete(accessToken: _token, id: id);
    if (reslut is Success) ref.invalidateSelf();
    return reslut;
  }
}
