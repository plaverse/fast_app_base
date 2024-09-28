class Bank {
  final String name;
  final String logoImagePath;

  Bank(this.name, this.logoImagePath);

  @override
  String toString() {
    return 'Bank(name: $name, logoPath: $logoImagePath)';
  }
}


  //아래는 @freezed라이브러리로 더 간단해질수 있다
//   @override
//   String toString() {
//     return name;
//   }
//
//
//   @override
//   bool operator ==(Object other) {
//     if(identical(this, other)) {
//       return true;
//     }
//     if(other.runtimeType != runtimeType) {
//       return false;
//     }
//     return other is Bank && other.name == name;
//   }
// }

//final bank1 = Bank("카카오뱅크", "assets/image/bank1.png");



