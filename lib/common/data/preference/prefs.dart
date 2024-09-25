import 'package:fast_app_base/common/data/preference/item/nullable_preference_item.dart';
import 'package:fast_app_base/common/data/preference/item/preference_item.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'item/rx_preference_item.dart';
import 'item/rxn_preference_item.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
  static final isPushOn = PreferenceItem<bool>('isPushOn', false);
  static final isPushOnRx = RxPreferenceItem<bool, RxBool>('isPushOn', false);
  static final sliderPosition = RxPreferenceItem<double, RxDouble>('sliderPosition', 0.0);
  static final birthday = RxnPreferenceItem<DateTime, Rxn<DateTime>>('birthday'); //null값을 셋팅할때
  static final number = RxPreferenceItem<int, RxInt>('number', 0);
  //백엔드말고, 로컬에서 저장하는 함수
  // static final isPush2 = PreferenceItem<int>('isPushOn', 10); //숫자저장, 여기서 10은 default값
  // static final isPush3 = PreferenceItem<double>('isPushOn', 22.55); //소수점저장
  // static final isPush4 = PreferenceItem<String>('isPushOn', 'value'); //문자저장
  // static final isPush5 = NullablePreferenceItem<String>('isPushOn'); //null을 표현해야 할때, default값은 optional
  //static final appTheme = PreferenceItem<CustomTheme>('appTheme', CustomTheme.light); //강사님꺼
}
