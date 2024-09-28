
import 'dart:collection';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 3000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(bankShinhan, 30000000, accountTypeName: "정기적금");
final bankAccountShinhan3 = BankAccount(bankShinhan, 300000000, accountTypeName: "정기예금");
final bankAccountToss = BankAccount(bankTtoss, 5000000);
final bankAccountKakao = BankAccount(bankKakao, 70000000, accountTypeName: "입출금통장");
final bankAccountKakao2 = BankAccount(bankKakao, 1000000000, accountTypeName: "특별통장");

// abstract class Animal {
//   void eat();
// }
//
// class Dog extends Animal {
//   void eat() {
//     print('dog');
//   }
// }
//
// class Cat extends Animal {
//   void eat() {
//     print('cat');
//   }
// }
//
// class Cow extends Animal {
//   void eat() {
//     print('cow');
//   }
// }



// main() {
//   final dog1 = Dog();
//   final dog2 = Dog();
//   final dog3 = Dog();
//   final dog4 = Dog();
//
//   final cat1 = Cat();
//   final cat2 = Cat();
//   final cat3 = Cat();
//   final cow1 = Cow();
//
//   final list = [dog1, dog2, dog3, dog4, cat1, cat2, cat3, cow1];
//   for(final animal in list) {
//       animal.eat();
//   }
// }


// main() {
//   final List list = bankAccounts;
//
//   int a;
//   int b;
//
//   a = 0;
//   b = ++a;
//   asset(a == b); //1==1
//
//   a = 0;
//   b = a++;
//   assert(a != b); // 1 != 0


//main() {
  //print(bankAccounts[1].accountTypeName);  //List 하나씩 물어보기

  // for(final item in bankAccounts) {     //List 순회시키기
  //   print(item.accountTypeName);
  // }

  // final shinhanBank = bankMap["shinhan1"];
  // //print(shinhanBank == bankAccountShinhan1); //Map 하나씩 물어보기 : 답변은 true or false
  //
  // for(final entry in bankMap.entries) {  //Map 순회시키기
  //   print(entry.key + ":" +(entry.value.accountTypeName ?? entry.value.bank.name));
  // }

  //print(bankSet.contains(bankAccountShinhan1)); //set 해시를 통해 즉시 참거짓 반환. 빠르다. 시간복잡도 0(1)

  //print(bankAccounts.contains(bankAccountShinhan1)); //List를 돌면서 판단. 리스트가 클수록 오래걸림. 시간복잡도 0(n)

  //bankAccounts.toSet()  //List함수를 Set형태로 바꾸기

  //bankSet.toList()     //Set함수를 List형태로 바꾸기
//}

//List (순회)
  final bankAccounts = [
    bankAccountShinhan1,
    bankAccountShinhan2,
    bankAccountShinhan3,
    bankAccountToss,
    bankAccountKakao,

  ];

//Map(중복을 허용하지 않는다)
  final bankMap = { //key: value,
    "shinhan1": bankAccountShinhan1,
    "shinhan2": bankAccountShinhan2
  };

//Set : 데이터가 존재하는지 판단할때 많이 사용(성능) 중복을 허용하지 않는다.
  final bankSet = {
    bankAccountShinhan1,
    bankAccountShinhan2,
    bankAccountShinhan3,
    bankAccountToss,
    bankAccountKakao
  };


void main() {
  //삽입
  bankAccounts.insert(1, bankAccountKakao2);

  //위치이동
  final temp = bankAccounts.removeAt(5);
  bankAccounts.insert(0, temp);

  //교환
  // final temp1 = bankAccounts.last;
  // bankAccounts[5] = bankAccounts[0];
  // bankAccounts[0] = temp1;

  //교환swap함수
  bankAccounts.swap(0, 5);

  //변환
  final banks = bankAccounts.mapIndexed((e, index) => Row(children:[(index+1).text.make()],)).toList();

  for (final bank in banks){
    print(bank.toString());
  }

  //map
  final map = HashMap();
  // if (banks[3] != banks[5]) {}
  //
  // final uniqueBanks = banks.toSet();
  // for (final bank in uniqueBanks) {
  //   print(bank.toString());
  // }

  //생성
  // final list = [];
  // final set = {};
  // final map = {};
}


//   for(final account in bankAccounts) {
//     print(account.toString());
//   }
// }