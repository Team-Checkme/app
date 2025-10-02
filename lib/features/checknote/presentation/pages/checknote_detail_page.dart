import 'package:app/constants/app_icons.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/design_system/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/design_system/widgets/app_checklist_color_card.dart';
import 'package:flutter_svg/svg.dart';
import '../components/layouts/checknote_preview_layout.dart';
import '../components/organisms/checknote_detail_navbar.dart';
import '../components/organisms/checknote_detail_hero.dart';
import '../components/organisms/checknote_detail_accordion_section.dart';
import '../components/organisms/checknote_detail_tab_menu.dart';
import '../components/atoms/label_tag.dart';
import '../providers/checknote_detail_provider.dart';
import '../../domain/entities/checknote_detail_entity.dart';
import '../../domain/entities/checknote_entity.dart';

/// 체크노트 상세 페이지 컴포넌트
/// - 체크노트 전체 정보를 표시하는 페이지
/// - 체크 리스트, 참여자 정보, 체크노트 관리 기능 포함
class ChecknoteDetailPage extends ConsumerStatefulWidget {
  const ChecknoteDetailPage({
    super.key,
    required this.checknoteId,
    this.onBack,
    this.onEdit,
    this.onDelete,
    this.onShare,
    this.onMenu,
  });

  /// 체크노트 ID
  final String checknoteId;

  /// 뒤로가기 콜백
  final VoidCallback? onBack;

  /// 수정 콜백
  final VoidCallback? onEdit;

  /// 삭제 콜백
  final VoidCallback? onDelete;

  /// 공유 콜백
  final VoidCallback? onShare;

  /// 메뉴 콜백
  final VoidCallback? onMenu;

  @override
  ConsumerState<ChecknoteDetailPage> createState() =>
      _ChecknoteDetailPageState();
}

class _ChecknoteDetailPageState extends ConsumerState<ChecknoteDetailPage> {
  @override
  void initState() {
    super.initState();
    // 체크노트 상세 정보 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(checknoteDetailProvider.notifier)
          .loadChecknoteDetail(widget.checknoteId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checknoteDetailProvider);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.isError || state.checknoteDetail == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('오류')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(state.errorMessage ?? '데이터를 불러올 수 없습니다'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref
                    .read(checknoteDetailProvider.notifier)
                    .loadChecknoteDetail(widget.checknoteId),
                child: const Text('다시 시도'),
              ),
            ],
          ),
        ),
      );
    }

    final checknoteDetail = state.checknoteDetail!;

    return Stack(
      children: [
        ChecknotePreviewLayout(
          navbar: ChecknoteDetailNavbar(
            onBack: widget.onBack ?? () => Navigator.of(context).pop(),
            onStar: _handleStar,
            onShare: widget.onShare ?? _handleShare,
            onMenu: _handleMenuToggle,
            isStarred: state.isStarred,
          ),
          hero: ChecknoteDetailHero(
            title: checknoteDetail.title,
            hashtags: checknoteDetail.hashtags,
            masterName: checknoteDetail.master.name,
            participantCount: checknoteDetail.participants.currentCount,
            maxParticipants: checknoteDetail.participants.maxCount,
            imageUrls: checknoteDetail.imageUrls,
            currentCheckCount: checknoteDetail.checkInfo.currentCount,
            totalCheckCount: checknoteDetail.checkInfo.totalCount,
            labels: [
              LabelTagVariants.master(),
              checknoteDetail.type == ChecknoteType.single
                  ? LabelTagVariants.single()
                  : LabelTagVariants.multi(),
            ],
          ),
          tabMenu: ChecknoteDetailTabMenu(
            tabs: checknoteDetail.tabInfo.tabs,
            activeIndex: state.activeTabIndex,
            onChanged: _handleTabChange,
          ),
          content: _buildContent(checknoteDetail),
          bottomActions: const SizedBox.shrink(), // 체크노트 상세 페이지에서는 하단 액션 불필요
        ),

        // 드롭다운 메뉴 (오버레이)
        if (state.isMenuOpen) _buildDropdownMenu(),
      ],
    );
  }

  /// 콘텐츠 영역 빌드
  Widget _buildContent(ChecknoteDetailEntity checknoteDetail) {
    final state = ref.watch(checknoteDetailProvider);

    switch (state.activeTabIndex) {
      case 0: // 홈
        return _buildHomeContent(checknoteDetail);
      case 1: // 히스토리
        return _buildHistoryContent();
      case 2: // 대시보드
        return _buildDashboardContent();
      case 3: // 참여자
        return _buildParticipantsContent();
      case 4: // 참여신청
        return _buildApplicationContent();
      default:
        return _buildHomeContent(checknoteDetail);
    }
  }

  /// 홈 콘텐츠
  Widget _buildHomeContent(ChecknoteDetailEntity checknoteDetail) {
    final state = ref.watch(checknoteDetailProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.s16),

        // 체크 노트 소개 아코디언
        ChecknoteDetailAccordionSection(
          title: checknoteDetail.accordionInfo.title,
          content: checknoteDetail.accordionInfo.content,
          images: checknoteDetail.accordionInfo.images,
          isExpanded: state.isAccordionExpanded,
          onToggle: (isExpanded) {
            ref.read(checknoteDetailProvider.notifier).toggleAccordion();
          },
        ),

        const SizedBox(height: AppSpacing.s16),

        // 체크 리스트 섹션
        _buildCheckListSection(checknoteDetail),

        const SizedBox(height: AppSpacing.s24),
      ],
    );
  }

  /// 체크 리스트 섹션
  Widget _buildCheckListSection(ChecknoteDetailEntity checknoteDetail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 체크 리스트 아이템들
        ...checknoteDetail.checkItems
            .map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.s16),
                  child: AppChecklistColorCard(
                    title: item.title,
                    colorVariant: _convertCheckItemColor(item.color),
                    isCompleted: item.isCompleted,
                    isAvailable: item.isAvailable,
                    schedule: _formatSchedule(item.schedule),
                    time: _formatTime(item.time),
                    checkSchedule: item.checkSchedule,
                    remainingTime: item.remainingTime,
                    onTap: () => _handleCheckItemTap(item),
                    onCheck: item.isAvailable ? () => _handleCheck(item) : null,
                  ),
                ))
            .toList(),

        // 체크 추가 버튼
        AppButtonX.text(
            height: 48,
            width: double.infinity,
            textColor: AppColors.gray700,
            icon: SvgPicture.asset(
              AppIcons.plusOutline,
              width: 16,
              height: 16,
              colorFilter:
                  const ColorFilter.mode(AppColors.gray700, BlendMode.srcIn),
            ),
            text: "체크 추가하기",
            onPressed: _handleAddCheck),

        const SizedBox(height: AppSpacing.s16),

        AppButtonX.primary(
            onPressed: () => {},
            height: 48,
            width: double.infinity,
            text: "참여하기",
            icon: SvgPicture.asset(
              AppIcons.fireOutline,
              width: 16,
              height: 16,
              colorFilter:
                  const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ))
      ],
    );
  }

  /// 히스토리 콘텐츠
  Widget _buildHistoryContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 48,
            color: AppColors.gray400,
          ),
          SizedBox(height: AppSpacing.s16),
          Text(
            '히스토리',
            style: TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.gray600,
            ),
          ),
          SizedBox(height: AppSpacing.s8),
          Text(
            '체크 히스토리가 여기에 표시됩니다',
            style: TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.gray500,
            ),
          ),
        ],
      ),
    );
  }

  /// 대시보드 콘텐츠
  Widget _buildDashboardContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.dashboard,
            size: 48,
            color: AppColors.gray400,
          ),
          SizedBox(height: AppSpacing.s16),
          Text(
            '대시보드',
            style: TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.gray600,
            ),
          ),
          SizedBox(height: AppSpacing.s8),
          Text(
            '체크 통계가 여기에 표시됩니다',
            style: TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.gray500,
            ),
          ),
        ],
      ),
    );
  }

  /// 참여자 콘텐츠
  Widget _buildParticipantsContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
            size: 48,
            color: AppColors.gray400,
          ),
          SizedBox(height: AppSpacing.s16),
          Text(
            '참여자',
            style: TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.gray600,
            ),
          ),
          SizedBox(height: AppSpacing.s8),
          Text(
            '참여자 목록이 여기에 표시됩니다',
            style: TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.gray500,
            ),
          ),
        ],
      ),
    );
  }

  /// 참여신청 콘텐츠
  Widget _buildApplicationContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_add,
            size: 48,
            color: AppColors.gray400,
          ),
          SizedBox(height: AppSpacing.s16),
          Text(
            '참여신청',
            style: TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.gray600,
            ),
          ),
          SizedBox(height: AppSpacing.s8),
          Text(
            '참여 신청 목록이 여기에 표시됩니다',
            style: TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.gray500,
            ),
          ),
        ],
      ),
    );
  }

  /// 탭 변경 핸들러
  void _handleTabChange(int index) {
    ref.read(checknoteDetailProvider.notifier).changeTab(index);
  }

  /// 별 버튼 핸들러
  void _handleStar() {
    ref.read(checknoteDetailProvider.notifier).toggleStar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            ref.read(checknoteDetailProvider).isStarred ? '별표 추가됨' : '별표 제거됨'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  /// 공유 버튼 핸들러
  void _handleShare() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('공유 기능')),
    );
  }

  /// 메뉴 토글 핸들러
  void _handleMenuToggle() {
    ref.read(checknoteDetailProvider.notifier).toggleMenu();
  }

  /// 드롭다운 메뉴 빌드 메서드
  Widget _buildDropdownMenu() {
    return Positioned(
      top: 96, // SafeArea + navbar 높이
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.s8),
        width: 160,
        constraints: const BoxConstraints(
          maxWidth: 160,
          maxHeight: 200,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 신고하기
            _buildMenuItem(
              assetName: AppIcons.reportOutline,
              text: '신고하기',
              onTap: () {
                ref.read(checknoteDetailProvider.notifier).toggleMenu();
                _handleReport();
              },
            ),

            // 나가기
            _buildMenuItem(
              assetName: AppIcons.outOutline,
              text: '나가기',
              onTap: () {
                ref.read(checknoteDetailProvider.notifier).toggleMenu();
                _handleLeave();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 메뉴 아이템 빌드 메서드
  Widget _buildMenuItem({
    required String assetName,
    required String text,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          height: 48,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                assetName,
                width: 16,
                height: 16,
                colorFilter:
                    const ColorFilter.mode(AppColors.gray900, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  style: AppTypography.body14B.copyWith(
                    color: AppColors.gray900,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 신고하기 핸들러
  void _handleReport() {
    // TODO: 신고하기 액션 구현
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('신고하기 기능')),
    );
  }

  /// 나가기 핸들러
  void _handleLeave() {
    // TODO: 나가기 액션 구현
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('나가기'),
        content: const Text('정말로 이 체크노트에서 나가시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // 체크노트 상세 페이지에서 나가기
            },
            child: const Text('나가기'),
          ),
        ],
      ),
    );
  }

  /// 체크 아이템 탭 핸들러
  void _handleCheckItemTap(ChecknoteCheckItem item) {
    // TODO: 체크 아이템 상세 페이지로 이동
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item.title} 상세 페이지로 이동')),
    );
  }

  /// 체크하기 핸들러
  void _handleCheck(ChecknoteCheckItem item) {
    ref.read(checknoteDetailProvider.notifier).checkItem(item.id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item.title} 체크 완료!')),
    );
  }

  /// 체크 추가 핸들러
  void _handleAddCheck() {
    // TODO: 체크 추가 페이지로 이동
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('체크 추가 페이지로 이동')),
    );
  }

  /// 체크 아이템 색상 변환 헬퍼
  ChecklistColorVariant _convertCheckItemColor(ChecknoteCheckItemColor color) {
    switch (color) {
      case ChecknoteCheckItemColor.check01:
        return ChecklistColorVariant.check01;
      case ChecknoteCheckItemColor.check02:
        return ChecklistColorVariant.check02;
      case ChecknoteCheckItemColor.check03:
        return ChecklistColorVariant.check03;
      case ChecknoteCheckItemColor.check04:
        return ChecklistColorVariant.check04;
      case ChecknoteCheckItemColor.check05:
        return ChecklistColorVariant.check05;
      case ChecknoteCheckItemColor.check06:
        return ChecklistColorVariant.check06;
      case ChecknoteCheckItemColor.check07:
        return ChecklistColorVariant.check01; // fallback
      case ChecknoteCheckItemColor.check08:
        return ChecklistColorVariant.check02; // fallback
      case ChecknoteCheckItemColor.check09:
        return ChecklistColorVariant.check03; // fallback
      case ChecknoteCheckItemColor.check10:
        return ChecklistColorVariant.check04; // fallback
    }
  }

  /// 스케줄 포맷팅 헬퍼
  String? _formatSchedule(ChecknoteCheckSchedule? schedule) {
    if (schedule == null) return null;

    switch (schedule.type) {
      case ChecknoteScheduleType.daily:
        return '매일';
      case ChecknoteScheduleType.weekly:
        return '주 ${schedule.frequency}회';
      case ChecknoteScheduleType.monthly:
        return '월 ${schedule.frequency}회';
      case ChecknoteScheduleType.custom:
        return '커스텀';
    }
  }

  /// 시간 포맷팅 헬퍼
  String? _formatTime(ChecknoteCheckTime? time) {
    if (time == null) return null;
    return '${time.startTime} - ${time.endTime}';
  }
}

/// 체크노트 상세 페이지 변형들
class ChecknoteDetailPageVariants {
  /// 기본 체크노트 상세 페이지
  static ChecknoteDetailPage default_({
    Key? key,
    required String checknoteId,
    VoidCallback? onBack,
    VoidCallback? onEdit,
    VoidCallback? onDelete,
    VoidCallback? onShare,
    VoidCallback? onMenu,
  }) {
    return ChecknoteDetailPage(
      key: key,
      checknoteId: checknoteId,
      onBack: onBack,
      onEdit: onEdit,
      onDelete: onDelete,
      onShare: onShare,
      onMenu: onMenu,
    );
  }

  /// 간소화된 체크노트 상세 페이지 (뒤로가기만)
  static ChecknoteDetailPage simple({
    Key? key,
    required String checknoteId,
    VoidCallback? onBack,
  }) {
    return ChecknoteDetailPage(
      key: key,
      checknoteId: checknoteId,
      onBack: onBack,
    );
  }
}
