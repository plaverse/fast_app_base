import 'package:freezed_annotation/freezed_annotation.dart';

import 'vo_bank.dart';

part 'vo_bank_account.freezed.dart';

@freezed
class BankAccount with _$BankAccount {
  factory BankAccount(
      final int userId,
      final Bank bank,
      int balance, {
        final String? accountTypeName,
      }) = _BankAccount;
}

// class BankAccount {
//   final Bank bank; //은행 등 변하지 않는 것 앞에는  final
//   //final String accountNumber; //계좌번호
//   //final String accountHolderName; //소유주
//   int balance; //잔액은 변하니까 final 붙이지 않는다
//   final String? accountTypeName; //계좌별명 같이 꼭 필요한게 아니면 nullable "?"
//
//   BankAccount(
//     this.bank,
//     //this.accountNumber,
//     //this.accountHolderName,
//     this.balance,{
//     this.accountTypeName,
//   }); //중괄호속에 넣으면 옵션이란 뜻(선언해도되고, 안해도 되는)
//
//   @override
//   String toString() {
//     return 'BankAccount(bank: ${bank.name}, balance: $balance, accountTypeName: ${accountTypeName ?? "N/A"})';
//   }
// }
