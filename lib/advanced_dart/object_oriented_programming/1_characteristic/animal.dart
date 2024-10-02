abstract class Animal {
  Animal(this._age);

  int _age;

  int get age => _age;

  void addAge() {
    _age++;
  }

  void eat() {
    print('기본 eat');
  }
}

abstract mixin class CanFly {
  String wings = "wings";

  void fly() {
    print('훨훨');
  }
}

// abstract mixin class CanRun {
//   String legs = "legs";
//
//   void run() {
//     print('후다닥');
//   }
// }

//mixin은 implements로 확장
abstract mixin class CanFlyUpgrade implements CanFly {
  String wings = "wings";

  void fly() {
    print('훨훨');
  }
}

abstract interface class CanRun {
  String get legs;

  set legs(String value);

  int run(String raceName);
}

//interface확장은 extends로!  CanRun이 그대로 run3에 들어온다.
abstract interface class CanRunUpgrade extends CanRun {
  void run3();
}

class Dog extends Animal implements CanRun {
  Dog(super.age, this.legs);

  @override
  void eat() {
    print('촵촵');
  }

  @override
  String legs;

  @override
  int run(String raceName) {
    print('$raceName 후다다다닥');
    return 5;
  }
}

class Bird extends Animal with CanFly implements CanRun {
  Bird(super.age, this.legs);


  @override
  void eat() {
    print('콕콕');
  }

  @override
  String legs;


  @override
  int run(String raceName) {
    print('$raceName 닥닥');
    return 2;
  }

  @override
  void run3() {
    // TODO: implement run3
  }
}



