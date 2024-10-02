import 'package:fast_app_base/advanced_dart/funtional_programming/functions/async_map.dart';
import 'package:fast_app_base/advanced_dart/funtional_programming/functions/fxDart.dart';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_user.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'fxDart.dart';

void main() {
  test('fp main', () async {
    //Functional Programming

    //프로그래밍 방법을 부르는 이름들

    //절차적 프로그래밍 - 명령형 프로그래밍
    //Accounts => Users => User.name => 출력
    // final accounts = await getAccounts();
    //
    // final list = <String>[];
    // for (final account in accounts) {
    //   final user = await getUser(account.userId);
    //   list.add(user.name);
    // }
    // print(list);

    //함수형 프로그래밍 - 선언형 프로그래밍
    // print('start');
    // final nameList = await (await getAccounts())
    //     .toStream()
    //     .map(accountToUserId)
    //     .asyncMap(userIdToFutureUser)
    //     .map(userToName)
    //     .toList();
    //
    //
    // // // final nameList = await getAccounts().then(
    // // //   (accounts) => Future.wait(accounts
    // // //       .map((account) => getUser(account.userId).then((user) => user.name))),
    // // // );
    // print(nameList);
    // print('end');

// final userList = list;
// print(userList);
// print('end');
//
// print('start');
// final list = await (await fetchAccounts())
//     .toStream()
//     .map((accounts) => accounts.userId)
//     .asyncMap((userId) => fetchUser(userId))
//     .map((user) => user.name)
//     .toList();
// print(list);
// print('end');

    print('start');
    await fxDart([
      await getAccounts(),
          mapAccountToUserId,
          asyncMapIdToUser,
          mapUserToName,
          printNames
    ]);
    print('end');
  }

  // String userToName(user) => user.name;
  //
  // FutureOr<User> userIdToFutureUser(userId) => getUser(userId);
  //
  // int accountToUserId(account) => account.userId;
//   print('start');
//   await fxDart([
//     await fetchAccounts(),
//     ...accountToEachFutureUser,
//     printNames,
//   ]);
//   print('end');
// }
//
// List get accountToEachFutureUser => [accountToUserId, idToFetchedUser, userToName];
//
// printNames(names) => runAll((names) => print(names.toList()), names);
//
// userToName(users) => map((User user) => user.name, users);
//
// idToFetchedUser(List<int> userIds) => futureMap(fetchUser, userIds);
//
// accountToUserId(accounts) => map((BankAccount account) => account.userId, accounts);
  );
}

printNames(names) => runAll((names) => print(names.toList()), names);

mapUserToName(users) => map((User user) => user.name, users);

asyncMapIdToUser(List<int> userIds) => asyncMap(getUser, userIds);

mapAccountToUserId(accounts) => map((BankAccount account) => account.userId, accounts);
//sync함수
// List<BankAccount> getAccounts() {
//   return bankAccounts;
// }
//
// User getUser(int id) {
//   //print('fetch User:$id');
//
//   return switch (id) {
//     1 => User(id, 'Jason'),
//     2 => User(id, 'Dart'),
//     3 => User(id, 'Baby'),
//     4 => User(id, 'Love'),
//     5 => User(id, 'Popcorn'),
//     _ => throw Exception('404 not found')
//   };
// }

//async함수
Future<List<BankAccount>> getAccounts() async {
  await sleepAsync(300.ms);
  return bankAccounts;
}

Future<User> getUser(int id) async {
  await sleepAsync(300.ms);
  print('getUser: $id');

  return switch (id) {
    1 => User(id, 'Jason'),
    2 => User(id, 'Dart'),
    3 => User(id, 'Baby'),
    4 => User(id, 'Love'),
    5 => User(id, 'Popcorn'),
    _ => throw Exception('404 not found')
  };
}
