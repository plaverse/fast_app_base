import 'dart:async';
import 'dart:convert';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/iterables.dart';

void main() {
  test('stream test', () async {
    final completer = Completer<void>(); //테스트가 먼저 종료되는 문제 해결
    final controller = StreamController<int>();
    final stream = controller.stream;

    ///Stream 기본 개념
    ///Future : 1번의 데이터를 가져옴
    ///Stream : 여러번의 데이터를 받을 수 있음

    /// Stream 생성과 수행
    /// 1. async*
    /// 2. streamController

    // [1,2,3,4,5,6,7,8,9,10].forEach((element) {
    //   print(element);
    // });

    // 스트림 리스닝
    // stream.listen((event) {
    //   print(event);
    // });

    // 데이터 추가 시작
    addDataToTheSink(controller);

    /// Stream 데이터 변환
    // countStream(4).map((event) => '$event 초가 지났습니다.').listen((event) {
    //   print(event);
    // });

    // countStream(4).transform(utf8.decoder).listen((event) {
    //   print(event);
    // });

    /// 위젯에서 Stream Data 표현하기: f_home에서 구현

    /// Stream 데이터 관찰2 - BrodcastStream
    // final broadCastStream = countStream(4).asBroadcastStream();
    // broadCastStream.listen((event) {
    //   print(event);
    // });
    //
    // Future.delayed(2.seconds, () {
    //   broadCastStream.listen((event) {
    //     print('방송 2초 후: $event');
    //   });
    // });

    /// 2개의 위젯에서 하나의 BrodcastStream Data 표현하기: f_home에서 구현

    /// Stream Error Handling
    // countStream(5).listen((event) {
    //   print(event);
    // }, cancelOnError: false).onError((e, trace) {
    //   print(e.toString());
    // });

    //error를 앞에서 정의해준 경우 : 위와 결과는 같다. 상황에 따라 결정하면 됨
    countStream(5).handleError((e) {
      print(e);
    }).listen((event) {
      print(event);
    }, cancelOnError: false);


          //테스트완료될때까지 기다리는 함수
      onDone:
      ()
  {
    completer.complete();
  };
  await completer.future;
});
}

void addDataToTheSink(StreamController<int> controller) async {
  for (int i = 1; i <= 4; i++) {
    await sleepAsync(1.seconds);
    controller.sink.add(i);
  }
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    if (i == 2) {
      yield* Stream.error(Exception("에러 발생")); //에러 후 계속 진행
      //throw Exception("에러 발생"); //throw 에서 멈춤
    } else {
      yield i; //스트림에서는 return 대신 yield를 사용하여 데이터를 생산합니다.
    }
    await sleepAsync(1.seconds);
  }
}
