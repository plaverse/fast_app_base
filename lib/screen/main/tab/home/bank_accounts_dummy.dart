import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 3000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(bankShinhan, 30000000, accountTypeName: "정기적금");
final bankAccountShinhan3 = BankAccount(bankShinhan, 300000000, accountTypeName: "정기예금");
final bankAccountToss = BankAccount(bankTtoss, 5000000);
final bankAccountKakao = BankAccount(bankKakao, 70000000, accountTypeName: "입출금통장");

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
  bankAccountToss,
  bankAccountKakao,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3
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