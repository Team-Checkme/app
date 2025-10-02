import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/checknote_detail_entity.dart';
import '../../domain/entities/checknote_entity.dart';

part 'checknote_detail_provider.freezed.dart';

/// 체크노트 상세 정보 Provider
final checknoteDetailProvider =
    StateNotifierProvider<ChecknoteDetailNotifier, ChecknoteDetailState>((ref) {
  return ChecknoteDetailNotifier();
});

/// 체크노트 상세 상태
@freezed
class ChecknoteDetailState with _$ChecknoteDetailState {
  const factory ChecknoteDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    String? errorMessage,
    ChecknoteDetailEntity? checknoteDetail,
    @Default(0) int activeTabIndex,
    @Default(false) bool isAccordionExpanded,
    @Default(false) bool isStarred,
    @Default(false) bool isMenuOpen,
  }) = _ChecknoteDetailState;
}

/// 체크노트 상세 Notifier
class ChecknoteDetailNotifier extends StateNotifier<ChecknoteDetailState> {
  ChecknoteDetailNotifier() : super(const ChecknoteDetailState());

  /// 체크노트 상세 정보 로드
  Future<void> loadChecknoteDetail(String checknoteId) async {
    state = state.copyWith(isLoading: true, isError: false);

    try {
      // TODO: 실제 API 호출로 대체
      await Future.delayed(const Duration(seconds: 1));

      final checknoteDetail = _createMockChecknoteDetail(checknoteId);

      state = state.copyWith(
        isLoading: false,
        checknoteDetail: checknoteDetail,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      );
    }
  }

  /// 탭 변경
  void changeTab(int index) {
    state = state.copyWith(activeTabIndex: index);
  }

  /// 아코디언 토글
  void toggleAccordion() {
    state = state.copyWith(isAccordionExpanded: !state.isAccordionExpanded);
  }

  /// 별표 토글
  void toggleStar() {
    state = state.copyWith(isStarred: !state.isStarred);
  }

  /// 메뉴 토글
  void toggleMenu() {
    state = state.copyWith(isMenuOpen: !state.isMenuOpen);
  }

  /// 체크 아이템 체크
  void checkItem(String itemId) {
    if (state.checknoteDetail == null) return;

    final updatedCheckItems = state.checknoteDetail!.checkItems.map((item) {
      if (item.id == itemId) {
        return item.copyWith(
          isCompleted: !item.isCompleted,
          completedAt: !item.isCompleted ? DateTime.now() : null,
        );
      }
      return item;
    }).toList();

    final updatedCheckInfo = state.checknoteDetail!.checkInfo.copyWith(
      currentCount: updatedCheckItems.where((item) => item.isCompleted).length,
    );

    final updatedChecknoteDetail = state.checknoteDetail!.copyWith(
      checkItems: updatedCheckItems,
      checkInfo: updatedCheckInfo,
    );

    state = state.copyWith(checknoteDetail: updatedChecknoteDetail);
  }

  /// 더미 데이터 생성
  ChecknoteDetailEntity _createMockChecknoteDetail(String checknoteId) {
    return ChecknoteDetailEntity(
      id: checknoteId,
      title: '3반 죽음의 다이어트',
      hashtags: const ['살고자하면죽고', '죽고자하면삼', '다이어드', '죽음의다이어트'],
      description: '우리 3반 이럴거야? 이거 맞아?\n무조건 다이어트 시작이다. 아무도 말릴 수 없어.',
      imageUrls: const [
        'https://picsum.photos/400/300?random=1',
        'https://picsum.photos/400/300?random=2',
        'https://picsum.photos/400/300?random=3',
        'https://picsum.photos/400/300?random=4',
      ],
      type: ChecknoteType.single,
      status: ChecknoteStatus.active,
      master: const ChecknoteMasterInfo(
        id: 'master1',
        name: '심혜나',
        profileImageUrl: null,
        bio: null,
      ),
      participants: ChecknoteParticipantInfo(
        currentCount: 3,
        maxCount: 4,
        participants: [
          ChecknoteParticipant(
            id: 'p1',
            name: '심혜나',
            profileImageUrl: null,
            status: ChecknoteParticipantStatus.active,
            joinedAt: DateTime.now().subtract(const Duration(days: 7)),
          ),
          ChecknoteParticipant(
            id: 'p2',
            name: '김철수',
            profileImageUrl: null,
            status: ChecknoteParticipantStatus.active,
            joinedAt: DateTime.now().subtract(const Duration(days: 5)),
          ),
          ChecknoteParticipant(
            id: 'p3',
            name: '이영희',
            profileImageUrl: null,
            status: ChecknoteParticipantStatus.active,
            joinedAt: DateTime.now().subtract(const Duration(days: 3)),
          ),
        ],
      ),
      checkInfo: ChecknoteCheckInfo(
        currentCount: 1,
        totalCount: 3,
        lastCheckAt: DateTime.now().subtract(const Duration(hours: 2)),
        schedule: null,
      ),
      checkItems: [
        const ChecknoteCheckItem(
          id: 'check1',
          title: '하루 5천보 걷고 인증하기(어뷰징 노노)',
          description: '',
          color: ChecknoteCheckItemColor.check01,
          isCompleted: false,
          isAvailable: true,
          schedule: ChecknoteCheckSchedule(
            type: ChecknoteScheduleType.weekly,
            frequency: 3,
            daysOfWeek: [1, 3, 5], // 월, 수, 금
            timeRange: ChecknoteCheckTime(
              startTime: '22:00',
              endTime: '23:00',
            ),
          ),
          time: ChecknoteCheckTime(
            startTime: '22:00',
            endTime: '23:00',
          ),
          checkSchedule: '25. 7. 9 22:00±1시간',
          remainingTime: '05:34:39',
          completedAt: null,
        ),
        ChecknoteCheckItem(
          id: 'check2',
          title: '물 8잔 마시기',
          description: '',
          color: ChecknoteCheckItemColor.check02,
          isCompleted: true,
          isAvailable: false,
          schedule: null,
          time: null,
          checkSchedule: null,
          remainingTime: null,
          completedAt: DateTime.now().subtract(const Duration(hours: 1)),
        ),
        const ChecknoteCheckItem(
          id: 'check3',
          title: '10분 스트레칭',
          description: '',
          color: ChecknoteCheckItemColor.check03,
          isCompleted: false,
          isAvailable: false,
          schedule: null,
          time: null,
          checkSchedule: null,
          remainingTime: null,
          completedAt: null,
        ),
      ],
      accordionInfo: const ChecknoteAccordionInfo(
        title: '체크 노트 소개',
        content: '''우리 3반 이럴거야? 이거 맞아?
무조건 다이어트 시작이다. 아무도 말릴 수 없어.

여기서 다이어트를 위해 모든 걸 할거야. 일단 이 방에 온 순간부터 너희는 아무것도 할 수 없어. 그냥 막 다이어트만 하는거야. 알지알지? 몰라? 말이 돼? 

정말이지 어이가 없어 다들. 
다들 모두 5kg 뺄때까지 아무도 못나가.
진심이야. 너희들 딱 긴장해''',
        images: [
          'https://picsum.photos/400/300?random=2',
          'https://picsum.photos/400/300?random=3',
          'https://picsum.photos/400/300?random=4',
        ],
        isExpanded: false,
      ),
      tabInfo: const ChecknoteTabInfo(
        tabs: ['홈', '히스토리', '대시보드', '참여자', '참여신청'],
        activeIndex: 0,
      ),
      stats: const ChecknoteStats(
        totalViews: 1234,
        totalLikes: 56,
        totalShares: 12,
        completionRate: 0.33,
        streakDays: 3,
      ),
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
    );
  }
}
