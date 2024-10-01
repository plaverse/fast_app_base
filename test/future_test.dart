import 'dart:async';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Future test', () async {
    // Future의 기본 개념
    ///시간이 걸리는 Computation작업  또는 유저의 응답을 기다려야되는 상태

    // Future의 생성과 수행
    // print('Start');
    // final account = await getBankAccounts();
    // // getBankAccounts().then((value) {  //async는 await를 호출하고 await는 then함수를 가져온다
    // //   print(value.toString());
    // // });
    // print(account.toString());
    // print('End');

    // // Future Timeout
    // print('Start');
    // final result = await getBankAccounts().timeout(1.seconds).onError((error, stackTrace) => []);
    // print(result);
    // print('End');

    // Future Error handling
    //   print('Start');
    //   try {
    //     getBankAccounts().timeout(1.seconds).then((value) {
    //       print(value);
    //     }).catchError((error,
    //         stackTrace) { //awit대신 then에서는 catchError로 핸들링할 수도 있다. 이걸 누락하면 예외가 잡히지 않는다.
    //       print(error);
    //       print(stackTrace);
    //     });
    //     // final result = await getBankAccounts().timeout(1.seconds); //try~catch는 꼭 await와 묶어야 예외가 디버그에 잡힌다.***then보다 await가 편리
    //     // print(result);
    //     } catch (e) {
    //       print(e);
    //     }
    //
    //     print('End');
    //   }
    // );
  });
}

// FutureOr : sync와 async를 모두 쓸수있다.
abstract class DoWorkInterface {
  FutureOr<String> doWork();
}

class SyncWork extends DoWorkInterface{
  @override
  String doWork(){
    return "wow";
  }
}

class AsyncWork extends DoWorkInterface{
  @override
  Future<String> doWork() async{
    return "";
  }
}


Future<List<BankAccount>?> getBankAccounts() async {
  await sleepAsync(2.seconds);
  return bankAccounts;
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}
