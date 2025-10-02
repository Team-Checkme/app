/// App 전체에서 사용하는 아이콘 경로 상수
class AppIcons {
  AppIcons._(); // static 전용

  // ===== 기본 경로 =====
  static const String _basePath = 'assets/icons';

  // ===== etc 폴더 아이콘들 =====

  // 시간 관련
  static const String timeOutline =
      '$_basePath/etc/icon=time, type=outline.svg';
  static const String timeFilled = '$_basePath/etc/icon=time, type=filled.svg';
  static const String hourglassFilled =
      '$_basePath/etc/icon=hourglass, type=filled.svg';
  static const String alarmOutline =
      '$_basePath/etc/icon=alarm, type=outline.svg';

  // 별점/하트 관련
  static const String starOutline =
      '$_basePath/etc/icon=star, type=outline.svg';
  static const String starFilled = '$_basePath/etc/icon=star, type=filled.svg';
  static const String heartOutline =
      '$_basePath/etc/icon=heart, type=outline.svg';
  static const String heartFilled =
      '$_basePath/etc/icon=heart, type=filled.svg';

  // 공유/검색 관련
  static const String shareOutline =
      '$_basePath/etc/icon=share, type=outline.svg';
  static const String searchOutline =
      '$_basePath/etc/icon=search, type=outline.svg';

  // 추가/메뉴 관련
  static const String plusOutline =
      '$_basePath/etc/icon=plus, type=outline.svg';
  static const String addOutline = '$_basePath/etc/icon=add, type=outline.svg';
  static const String menuThreedotOutline =
      '$_basePath/etc/icon=menu-threedot, type=outline.svg';
  static const String menuThreedotHorizonFilled =
      '$_basePath/etc/icon=menu-threedot-horizon, type=filled.svg';

  // 체크/닫기 관련
  static const String checkOutline =
      '$_basePath/etc/icon=check, type=outline.svg';
  static const String checkFatFilled =
      '$_basePath/etc/icon=check-fat, type=filled.svg';
  static const String checkCircleFilled =
      '$_basePath/etc/icon=check-circle, type=filled.svg';
  static const String closeOutline =
      '$_basePath/etc/icon=close, type=outline.svg';
  static const String closeFilled =
      '$_basePath/etc/icon=close, type=filled.svg';

  // 기타
  static const String crownFilled =
      '$_basePath/etc/icon=crown, type=filled.svg';
  static const String banFilled = '$_basePath/etc/icon=ban, type=filled.svg';
  static const String banFilled1 = '$_basePath/etc/icon=ban, type=filled-1.svg';
  static const String banFatFilled =
      '$_basePath/etc/icon=ban-fat, type=filled.svg';
  static const String arrayOutline =
      '$_basePath/etc/icon=array, type=outline.svg';
  static const String editOutline =
      '$_basePath/etc/icon=edit, type=outline.svg';
  static const String filterFilled =
      '$_basePath/etc/icon=filter, type=filled.svg';
  static const String filterOutline =
      '$_basePath/etc/icon=filter, type=outline.svg';
  static const String fireFilled = '$_basePath/etc/icon=fire, type=filled.svg';
  static const String fireOutline =
      '$_basePath/etc/icon=fire, type=outline.svg';
  static const String infiniteOutline =
      '$_basePath/etc/icon=infinite, type=outline.svg';
  static const String warningFilled =
      '$_basePath/etc/icon=warning, type=filled.svg';
  static const String warningOutline =
      '$_basePath/etc/icon=warning, type=outline.svg';
  static const String closeCircleOutline =
      '$_basePath/etc/icon=close-circle, type=outline.svg';

  // 신고/나가기 관련
  static const String reportOutline =
      '$_basePath/etc/icon=report, type=outline.svg';
  static const String outOutline = '$_basePath/etc/icon=out, type=outline.svg';

  // 추천/좋아요 관련
  static const String thumbsupOutline =
      '$_basePath/etc/icon=thumbs-up, type=outline.svg';

  // 화살표 관련
  static const String arrowTopOutline =
      '$_basePath/etc/icon=arrow-top, type=outline.svg';
  static const String arrowRightOutline =
      '$_basePath/etc/icon=arrow-right, type=outline.svg';
  static const String arrowLeftOutline =
      '$_basePath/etc/icon=arrow-left, type=outline.svg';
  static const String arrowDownOutline =
      '$_basePath/etc/icon=arrow-down, type=outline.svg';

  // ===== number 폴더 아이콘들 =====
  static const String number0 = '$_basePath/number/number=0.svg';
  static const String number1 = '$_basePath/number/number=1.svg';
  static const String number2 = '$_basePath/number/number=2.svg';
  static const String number3 = '$_basePath/number/number=3.svg';
  static const String number4 = '$_basePath/number/number=4.svg';
  static const String number5 = '$_basePath/number/number=5.svg';
  static const String number6 = '$_basePath/number/number=6.svg';
  static const String number7 = '$_basePath/number/number=7.svg';
  static const String number8 = '$_basePath/number/number=8.svg';
  static const String number9 = '$_basePath/number/number=9.svg';

  // ===== 편의 메서드 =====

  /// 숫자 아이콘 경로를 동적으로 가져오기
  static String getNumberIcon(int number) {
    if (number < 0 || number > 9) {
      throw ArgumentError('Number must be between 0 and 9');
    }

    switch (number) {
      case 0:
        return number0;
      case 1:
        return number1;
      case 2:
        return number2;
      case 3:
        return number3;
      case 4:
        return number4;
      case 5:
        return number5;
      case 6:
        return number6;
      case 7:
        return number7;
      case 8:
        return number8;
      case 9:
        return number9;
      default:
        return number0;
    }
  }

  /// 모든 아이콘 경로 리스트 가져오기
  static List<String> getAllIcons() {
    return [
      // etc 폴더
      timeOutline, timeFilled, hourglassFilled, alarmOutline,
      starOutline, starFilled, heartOutline, heartFilled,
      shareOutline, searchOutline, plusOutline, addOutline,
      menuThreedotOutline, menuThreedotHorizonFilled,
      checkOutline, checkFatFilled, checkCircleFilled,
      closeOutline, closeFilled, closeCircleOutline, crownFilled,
      banFilled, banFilled1, banFatFilled, arrayOutline, editOutline,
      filterFilled, filterOutline, fireFilled, fireOutline, infiniteOutline,
      warningFilled, warningOutline,
      reportOutline, outOutline,
      arrowTopOutline, arrowRightOutline, arrowLeftOutline, arrowDownOutline,

      // number 폴더
      number0, number1, number2, number3, number4,
      number5, number6, number7, number8, number9,
    ];
  }

  /// 카테고리별 아이콘 가져오기
  static List<String> getIconsByCategory(String category) {
    switch (category.toLowerCase()) {
      case 'time':
        return [timeOutline, timeFilled, hourglassFilled, alarmOutline];
      case 'star':
        return [starOutline, starFilled];
      case 'heart':
        return [heartOutline, heartFilled];
      case 'arrow':
        return [
          arrowTopOutline,
          arrowRightOutline,
          arrowLeftOutline,
          arrowDownOutline
        ];
      case 'number':
        return [
          number0,
          number1,
          number2,
          number3,
          number4,
          number5,
          number6,
          number7,
          number8,
          number9
        ];
      case 'check':
        return [checkOutline, checkFatFilled, checkCircleFilled];
      case 'close':
        return [closeOutline, closeFilled];
      case 'menu':
        return [menuThreedotOutline, menuThreedotHorizonFilled];
      default:
        return [];
    }
  }
}

/// 카테고리별 네임스페이스 (가독성/자동완성 편의용)
class IconTime {
  IconTime._();
  static const outline = AppIcons.timeOutline;
  static const filled = AppIcons.timeFilled;
  static const hourglass = AppIcons.hourglassFilled;
  static const alarm = AppIcons.alarmOutline;
}

class IconStar {
  IconStar._();
  static const outline = AppIcons.starOutline;
  static const filled = AppIcons.starFilled;
}

class IconHeart {
  IconHeart._();
  static const outline = AppIcons.heartOutline;
  static const filled = AppIcons.heartFilled;
}

class IconArrow {
  IconArrow._();
  static const top = AppIcons.arrowTopOutline;
  static const right = AppIcons.arrowRightOutline;
  static const left = AppIcons.arrowLeftOutline;
  static const down = AppIcons.arrowDownOutline;
}

class IconNumber {
  IconNumber._();
  static const n0 = AppIcons.number0;
  static const n1 = AppIcons.number1;
  static const n2 = AppIcons.number2;
  static const n3 = AppIcons.number3;
  static const n4 = AppIcons.number4;
  static const n5 = AppIcons.number5;
  static const n6 = AppIcons.number6;
  static const n7 = AppIcons.number7;
  static const n8 = AppIcons.number8;
  static const n9 = AppIcons.number9;
}

class IconCheck {
  IconCheck._();
  static const outline = AppIcons.checkOutline;
  static const fat = AppIcons.checkFatFilled;
  static const circle = AppIcons.checkCircleFilled;
}

class IconClose {
  IconClose._();
  static const outline = AppIcons.closeOutline;
  static const filled = AppIcons.closeFilled;
}
