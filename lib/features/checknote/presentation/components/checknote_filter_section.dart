import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_icons.dart';
import '../../../../../constants/app_typography.dart';
import '../../../../../constants/app_spacing.dart';

/// 체크노트 필터 및 정렬 컨트롤 섹션
/// 즐겨찾기, 싱글/멀티 필터, 정렬 옵션을 제공
class ChecknoteFilterSection extends StatefulWidget {
  final bool isApprovalOnly;
  final String sortType;
  final bool isFavoriteFilter;
  final bool isSingleFilter;
  final bool isMultiFilter;
  final ValueChanged<bool> onApprovalOnlyChanged;
  final ValueChanged<String> onSortTypeChanged;
  final ValueChanged<bool> onFavoriteFilterChanged;
  final ValueChanged<bool> onSingleFilterChanged;
  final ValueChanged<bool> onMultiFilterChanged;
  final bool isSortDropdownOpen;
  final ValueChanged<bool> onSortDropdownToggle;

  const ChecknoteFilterSection({
    Key? key,
    required this.isApprovalOnly,
    required this.sortType,
    required this.isFavoriteFilter,
    required this.isSingleFilter,
    required this.isMultiFilter,
    required this.onApprovalOnlyChanged,
    required this.onSortTypeChanged,
    required this.onFavoriteFilterChanged,
    required this.onSingleFilterChanged,
    required this.onMultiFilterChanged,
    required this.isSortDropdownOpen,
    required this.onSortDropdownToggle,
  }) : super(key: key);

  @override
  State<ChecknoteFilterSection> createState() => _ChecknoteFilterSectionState();
}

class _ChecknoteFilterSectionState extends State<ChecknoteFilterSection> {
  OverlayEntry? _dropdownOverlay;
  final GlobalKey _sortButtonKey = GlobalKey();

  @override
  void dispose() {
    _hideDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(AppSpacing.s16),
      child: Column(
        children: [
          // 상단 필터 섹션
          Row(
            children: [
              // 좌측 필터 그룹
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 즐겨찾기 필터
                  _buildFilterChip(
                    icon: AppIcons.starFilled,
                    isSelected: widget.isFavoriteFilter,
                    onTap: () {
                      widget.onFavoriteFilterChanged(!widget.isFavoriteFilter);
                    },
                  ),

                  const SizedBox(width: AppSpacing.s8),

                  // 싱글 필터
                  _buildFilterChip(
                    icon: AppIcons.checkOutline,
                    label: '싱글',
                    isSelected: widget.isSingleFilter,
                    onTap: () {
                      widget.onSingleFilterChanged(!widget.isSingleFilter);
                    },
                  ),

                  const SizedBox(width: AppSpacing.s8),

                  // 멀티 필터
                  _buildFilterChip(
                    icon: AppIcons.checkOutline,
                    label: '멀티',
                    isSelected: widget.isMultiFilter,
                    onTap: () {
                      widget.onMultiFilterChanged(!widget.isMultiFilter);
                    },
                  ),
                ],
              ),

              // 우측 정렬 버튼을 위한 Spacer
              const Spacer(),

              // 정렬 버튼 (우측 정렬)
              _buildSortButtonWithDropdown(context),
            ],
          ),

          const SizedBox(height: AppSpacing.s16),

          // 하단 체크박스 섹션 (전체를 하나의 버튼으로)
          GestureDetector(
            onTap: () {
              widget.onApprovalOnlyChanged(!widget.isApprovalOnly);
            },
            child: Row(
              children: [
                // 체크박스
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: widget.isApprovalOnly
                        ? AppColors.gray800
                        : AppColors.gray200,
                    borderRadius: BorderRadius.circular(AppSpacing.s8),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.checkOutline,
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                const SizedBox(width: AppSpacing.s8),

                // 체크박스 라벨
                Expanded(
                  child: Text(
                    '승인 중인 체크 노트만 보기',
                    style: AppTypography.body14B.copyWith(
                      color: AppColors.gray600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 필터 칩 위젯 빌드
  Widget _buildFilterChip({
    required String icon,
    String? label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s8,
          vertical: AppSpacing.s8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue200 : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.blue200 : AppColors.gray200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.s8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.blue500 : AppColors.gray500,
                BlendMode.srcIn,
              ),
            ),
            if (label != null) ...[
              const SizedBox(width: AppSpacing.s4),
              Text(
                label,
                style: AppTypography.body14B.copyWith(
                  color: isSelected ? AppColors.blue500 : AppColors.gray500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// 정렬 버튼과 드롭다운 위젯 빌드
  Widget _buildSortButtonWithDropdown(BuildContext context) {
    return Stack(
      children: [
        // 정렬 버튼
        GestureDetector(
          onTap: () {
            if (widget.isSortDropdownOpen) {
              _hideDropdown();
              widget.onSortDropdownToggle(false);
            } else {
              _showDropdown(context);
              widget.onSortDropdownToggle(true);
            }
          },
          key: _sortButtonKey,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s8,
              vertical: AppSpacing.s8,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.gray200,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(AppSpacing.s8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  widget.sortType == '최신순'
                      ? AppIcons.arrayOutline
                      : AppIcons.thumbsupOutline,
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.gray600,
                    BlendMode.srcIn,
                  ),
                  placeholderBuilder: (context) => Container(
                    width: 16,
                    height: 16,
                    color: Colors.red.withOpacity(0.3),
                    child: const Center(
                      child: Text('?', style: TextStyle(fontSize: 10)),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.s4),
                Text(
                  widget.sortType,
                  style: AppTypography.body14B.copyWith(
                    color: AppColors.gray600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 드롭다운 표시
  void _showDropdown(BuildContext context) {
    _hideDropdown(); // 기존 드롭다운이 있으면 제거

    final RenderBox? renderBox =
        _sortButtonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _dropdownOverlay = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          _hideDropdown();
          widget.onSortDropdownToggle(false);
        },
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              // 전체 화면을 덮는 투명한 영역
              Positioned.fill(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              // 드롭다운 메뉴
              Positioned(
                left: position.dx + size.width - 120, // 우측 정렬
                top: position.dy + size.height + 8, // 버튼 아래
                child: Material(
                  color: Colors.transparent,
                  child: _buildSortDropdown(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_dropdownOverlay!);
  }

  /// 드롭다운 숨기기
  void _hideDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
  }

  /// 정렬 드롭다운 메뉴 빌드
  Widget _buildSortDropdown() {
    return Container(
      width: 120, // 고정 너비 설정
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.s16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.s8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 최신순 옵션
            _buildSortOption(
              icon: AppIcons.arrayOutline,
              text: '최신순',
              onTap: () {
                widget.onSortTypeChanged('최신순');
                _hideDropdown();
                widget.onSortDropdownToggle(false);
              },
            ),

            // 추천순 옵션
            _buildSortOption(
              icon: AppIcons.thumbsupOutline,
              text: '추천순',
              onTap: () {
                widget.onSortTypeChanged('추천순');
                _hideDropdown();
                widget.onSortDropdownToggle(false);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 정렬 옵션 아이템 빌드
  Widget _buildSortOption({
    required String icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return _SortOptionItem(
      icon: icon,
      text: text,
      onTap: onTap,
    );
  }
}

/// 정렬 옵션 아이템 (hover 효과 포함)
class _SortOptionItem extends StatefulWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;

  const _SortOptionItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<_SortOptionItem> createState() => _SortOptionItemState();
}

class _SortOptionItemState extends State<_SortOptionItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(AppSpacing.s8),
        splashColor: Colors.black.withOpacity(0.08), // hover 시 배경색
        highlightColor: Colors.black.withOpacity(0.08), // hover 시 배경색
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s8, vertical: AppSpacing.s12), // 8px 패딩
          decoration: BoxDecoration(
            // 기본값은 배경색 없음
            borderRadius: BorderRadius.circular(AppSpacing.s8),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                widget.icon,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.gray900, // #191F2A
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppSpacing.s8),
              Text(
                widget.text,
                style: AppTypography.body14B.copyWith(
                  color: AppColors.gray900, // #191F2A
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
