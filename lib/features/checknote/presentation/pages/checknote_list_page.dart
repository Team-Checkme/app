import 'package:flutter/material.dart';
import '../../../../../constants/app_colors.dart';
import '../components/checknote_list_app_bar.dart';
import '../components/checknote_empty_state.dart';
import '../components/checknote_filter_section.dart';

/// 체크노트 리스트 페이지
/// 사용자가 생성한 체크노트들을 보여주는 메인 화면
class ChecknoteListPage extends StatefulWidget {
  const ChecknoteListPage({Key? key}) : super(key: key);

  @override
  State<ChecknoteListPage> createState() => _ChecknoteListPageState();
}

class _ChecknoteListPageState extends State<ChecknoteListPage> {
  bool _isApprovalOnly = false;
  String _sortType = '최신순';
  bool _isFavoriteFilter = false;
  bool _isSingleFilter = true;
  bool _isMultiFilter = true;
  bool _isSortDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
      appBar: const ChecknoteListAppBar(),
      body: GestureDetector(
        onTap: () {
          // 드롭다운이 열려있으면 닫기
          if (_isSortDropdownOpen) {
            setState(() {
              _isSortDropdownOpen = false;
            });
          }
        },
        child: Column(
          children: [
            // 필터 및 정렬 섹션
            ChecknoteFilterSection(
              isApprovalOnly: _isApprovalOnly,
              sortType: _sortType,
              isFavoriteFilter: _isFavoriteFilter,
              isSingleFilter: _isSingleFilter,
              isMultiFilter: _isMultiFilter,
              onApprovalOnlyChanged: (value) {
                setState(() {
                  _isApprovalOnly = value;
                });
              },
              onSortTypeChanged: (value) {
                setState(() {
                  _sortType = value;
                });
              },
              onFavoriteFilterChanged: (value) {
                setState(() {
                  _isFavoriteFilter = value;
                });
              },
              onSingleFilterChanged: (value) {
                setState(() {
                  _isSingleFilter = value;
                });
              },
              onMultiFilterChanged: (value) {
                setState(() {
                  _isMultiFilter = value;
                });
              },
              isSortDropdownOpen: _isSortDropdownOpen,
              onSortDropdownToggle: (value) {
                setState(() {
                  _isSortDropdownOpen = value;
                });
              },
            ),

            // 메인 콘텐츠 영역
            Expanded(
              child: Container(
                color: AppColors.gray50,
                child: const ChecknoteEmptyState(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
