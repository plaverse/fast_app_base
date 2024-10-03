import 'dart:isolate';

// class NormalObject {
//   int count = 0;
// }

class SingletonObject {
  int count = 0;

  SingletonObject._();

  static final SingletonObject instance = SingletonObject._();

  factory SingletonObject() {
    return instance;
  }
}

// main() {
//   final object1 = NormalObject();
//   object1.count++;  //806064052
//   print(object1.count);
//   final object2 = NormalObject();
//   print(object2.count); //2961596861
//   //final object3 = SingletonObject.instance;
//각각 hash값이 다르다. 각각의 객체
// }


main() {
  // final object1 = SingletonObject();
  // object1.count = 100;
  // final object2 = SingletonObject();
  // final object3 = SingletonObject.instance;
  //
  // // print(object1 == object2); //object1.hashCode == object2.hashCode == object3.hashCode == 1765565398 하나의 객체
  // // print(object2 == object3);
  // // print(object1 == object3);
  // print(object2.count);

  SingletonObject objectFromAnotherWorld = SingletonObject.instance;
  Isolate.run(() {
    final isolateObject = SingletonObject();
    final isolateObject2 = SingletonObject();
    print(isolateObject == isolateObject2);
    print(isolateObject == objectFromAnotherWorld);
  });
}
