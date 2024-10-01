import 'dart:async';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('stream test', () async {
    ///Stream 기본 개념
    ///Future : 1번의 데이터를 가져옴
    ///Stream : 여러번의 데이터를 받을 수 있음

    /// Stream 생성과 수행
    /// 1. async*
    /// 2. streamController

    // [1,2,3,4,5,6,7,8,9,10].forEach((element) {
    //   print(element);
    // });
    final controller = StreamController<int>();
    final stream = controller.stream;

    // 스트림 리스닝
    stream.listen((event) {
      print(event);
    });

    // 데이터 추가 시작
    addDataToTheSink(controller);

    // 데이터 추가 함수
    void addDataToTheSink(StreamController<int> controller) async {
      for (int i = 1; i <= 4; i++) {
        await sleepAsync(1.seconds);
        controller.sink.add(i);
      }
      //   // 모든 데이터를 추가한 후 컨트롤러를 닫습니다.
      //   await controller.close();
      // }


      // // 스트림이 완료될 때까지 기다립니다.
      // await controller.done;

      // // 구독을 취소합니다.
      // await subscription.cancel();
      //
      // // 추가 테스트를 위한 카운트 스트림
      // final countStreamSubscription = countStream(3).listen((event) {
      //   print('Count: $event');
      // });

      // // countStream이 완료될 때까지 기다립니다.
      // await countStreamSubscription.asFuture();
      // await countStreamSubscription.cancel();
      //
      // // 테스트가 비동기 작업을 기다리도록 합니다.
      // await Future.delayed(Duration(seconds: 5));
    }
  });
}

/// Stream 데이터 관찰

/// 위젯에서 Stream Data 표현하기

/// Stream 데이터 관찰2 - BrodcastStream

/// 2개의 위젯에서 하나의 BrodcastStream Data 표현하기

/// Stream Error Handling


Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await sleepAsync(1.seconds);
    print('before yield');
    yield i;   //스트림에서는 return 대신 yield를 사용하여 데이터를 생산합니다.
    print('after yield');
  }
}