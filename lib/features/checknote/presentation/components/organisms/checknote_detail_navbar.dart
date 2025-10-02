import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/constants/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 체크노트 상세 네비게이션 바 컴포넌트
/// - 뒤로가기, 별, 공유, 메뉴 버튼들을 포함
class ChecknoteDetailNavbar extends StatefulWidget {
  const ChecknoteDetailNavbar({
    super.key,
    required this.onBack,
    this.onStar,
    this.onShare,
    this.onMenu,
    this.onReport,
    this.onLeave,
    this.isStarred = false,
    this.backgroundColor = AppColors.white,
    this.height = 44,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
  });

  /// 뒤로가기 콜백
  final VoidCallback onBack;

  /// 별 버튼 콜백 (선택사항)
  final VoidCallback? onStar;

  /// 공유 버튼 콜백 (선택사항)
  final VoidCallback? onShare;

  /// 메뉴 버튼 콜백 (선택사항)
  final VoidCallback? onMenu;

  /// 신고하기 콜백 (선택사항)
  final VoidCallback? onReport;

  /// 나가기 콜백 (선택사항)
  final VoidCallback? onLeave;

  /// 별표 상태
  final bool isStarred;

  /// 배경색
  final Color backgroundColor;

  /// 높이
  final double height;

  /// 좌우 패딩
  final EdgeInsets padding;

  @override
  State<ChecknoteDetailNavbar> createState() => _ChecknoteDetailNavbarState();
}

class _ChecknoteDetailNavbarState extends State<ChecknoteDetailNavbar> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 뒤로가기 버튼
          _buildIconButton(
            icon: AppIcons.arrowLeftOutline,
            onPressed: widget.onBack,
            iconColor: AppColors.gray800,
          ),

          // 오른쪽 버튼들
          Row(
            children: [
              // 별 버튼
              if (widget.onStar != null) ...[
                _buildIconButton(
                  icon: widget.isStarred
                      ? AppIcons.starFilled
                      : AppIcons.starOutline,
                  onPressed: widget.onStar!,
                  iconColor:
                      widget.isStarred ? AppColors.blue600 : AppColors.gray800,
                ),
                const SizedBox(width: AppSpacing.s8),
              ],

              // 공유 버튼
              if (widget.onShare != null) ...[
                _buildIconButton(
                  icon: AppIcons.shareOutline,
                  onPressed: widget.onShare!,
                  iconColor: AppColors.gray800,
                ),
                const SizedBox(width: AppSpacing.s8),
              ],

              // 메뉴 버튼
              if (widget.onMenu != null ||
                  widget.onReport != null ||
                  widget.onLeave != null)
                _buildMenuButton(),
            ],
          ),
        ],
      ),
    );
  }

  /// 메뉴 버튼 빌드 메서드
  Widget _buildMenuButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isMenuOpen = !_isMenuOpen;
        });
        // 부모에게 메뉴 상태 변경 알림
        widget.onMenu?.call();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              _isMenuOpen ? Colors.black.withOpacity(0.08) : Colors.transparent,
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIcons.menuThreedotOutline,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppColors.gray800,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }

  /// 아이콘 버튼 빌드 메서드
  Widget _buildIconButton({
    required String icon,
    required VoidCallback onPressed,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              iconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

/// 체크 상세 네비게이션 바 변형들
class ChecknoteDetailNavbarVariants {
  /// 기본 네비게이션 바 (뒤로가기만)
  static ChecknoteDetailNavbar basic({
    Key? key,
    required VoidCallback onBack,
  }) {
    return ChecknoteDetailNavbar(
      key: key,
      onBack: onBack,
    );
  }

  /// 전체 기능 네비게이션 바
  static ChecknoteDetailNavbar full({
    Key? key,
    required VoidCallback onBack,
    VoidCallback? onStar,
    VoidCallback? onShare,
    VoidCallback? onMenu,
    VoidCallback? onReport,
    VoidCallback? onLeave,
    bool isStarred = false,
  }) {
    return ChecknoteDetailNavbar(
      key: key,
      onBack: onBack,
      onStar: onStar,
      onShare: onShare,
      onMenu: onMenu,
      onReport: onReport,
      onLeave: onLeave,
      isStarred: isStarred,
    );
  }

  /// 간소화된 네비게이션 바 (뒤로가기 + 메뉴)
  static ChecknoteDetailNavbar simple({
    Key? key,
    required VoidCallback onBack,
    VoidCallback? onMenu,
  }) {
    return ChecknoteDetailNavbar(
      key: key,
      onBack: onBack,
      onMenu: onMenu,
    );
  }
}
