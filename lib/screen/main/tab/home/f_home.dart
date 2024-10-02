import 'dart:convert';
import 'dart:isolate';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/tab/home/s_number.dart';
import 'package:fast_app_base/screen/main/tab/home/w_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_rive_like_button.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttoss_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:live_background/live_background.dart';
import 'package:live_background/widget/live_background_widget.dart';

import '../../../../common/widget/w_big_button.dart';
import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';
import '../../s_main.dart';
import 'bank_accounts_dummy.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late final stream = countStream(5).asBroadcastStream();

  //int count = 0;

  @override
  void initState() {
    // countStream(5).listen((event) {
    //   setState(() {
    //     count = event;
    //   });
    // });
    super.initState();
  }

  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          // const LiveBackgroundWidget(
          //   palette: Palette(colors: [Colors.red, Colors.green]),
          //   velocityX: 1,
          //   particleMaxSize: 20,
          // ),
          RefreshIndicator(
            //새로고침
            edgeOffset: TtossAppBar.appBarHeight,
            onRefresh: () async {
              await sleepAsync(500.ms);
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  top: TtossAppBar.appBarHeight,
                  bottom: MainScreenState.bottomNavigatorHeight),
              child: Column(
                children: [
                  //   StreamBuilder(
                  //     builder: (context, snapshot) {
                  //       final count = snapshot.data;
                  //
                  //       switch(snapshot.connectionState) {
                  //         case ConnectionState.active:
                  //           if(count == null) {
                  //             return const CircularProgressIndicator();
                  //           }else{
                  //             return count!.text.size(30).bold.make();
                  //           }
                  //
                  //         case ConnectionState.waiting:
                  //         case ConnectionState.none:
                  //           return const CircularProgressIndicator();
                  //
                  //           case ConnectionState.done:
                  //           return '완료'.text.size(30).bold.make();
                  //       }
                  //     },
                  //     stream: stream,
                  // ),
                  //   StreamBuilder(
                  //     builder: (context, snapshot) {
                  //       final count = snapshot.data;
                  //
                  //       switch(snapshot.connectionState) {
                  //         case ConnectionState.active:
                  //           if(count == null) {
                  //             return const CircularProgressIndicator();
                  //           }else{
                  //             return count!.text.size(30).bold.make();
                  //           }
                  //
                  //         case ConnectionState.waiting:
                  //         case ConnectionState.none:
                  //           return const CircularProgressIndicator();
                  //
                  //         case ConnectionState.done:
                  //           return '완료'.text.size(30).bold.make();
                  //       }
                  //     },
                  //     stream: stream,
                  //   ),

                  SizedBox(
                      height: 250,
                      width: 250,
                      child: RiveLikeButton(
                        isLike,
                        onTapLike: (isLike) {
                          setState(() {
                            this.isLike = isLike;
                          });
                          delay(() {
                            veryHeavyComputationWorkWithIsolateSpawn();
                          }, 250.ms);
                        },
                      )),
                  BigButton(
                    "토스뱅크",
                    onTap: () async {
                      print('start');
                      final result = await Nav.push(NumberScreen());
                      print(result);
                      print('end');
                    },
                  ),
                  height10,
                  RoundedContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "자산".text.bold.white.size(20).make(),
                          height5,
                          ...bankAccounts.map((e) => BankAccountWidget(e))
                              .toList(),
                          //list함수를 매핑해서 가져오기
                        ],
                      )),
                ],
              ).pSymmetric(
                  h: 20), //).pSymmetric(h: 20).animate().slideY(duration: 3000.ms).fadeIn(), //애니메이션 연습
            ),
          ),
          const TtossAppBar(),
        ],
      ),
    );
  }

  Stream<int> countStream(int max) async* {
    await sleepAsync(2.seconds);
    for (int i = 1; i <= max; i++) {
      yield i; //스트림에서는 return 대신 yield를 사용하여 데이터를 생산합니다.
      await sleepAsync(1.seconds);
    }
  }

  void showSnackbar(BuildContext context) {
    context.showSnackbar('snackbar 입니다.',
        extraButton: Tap(
          onTap: () {
            context.showErrorSnackbar('error');
          },
          child: '에러 보여주기 버튼'
              .text
              .white
              .size(13)
              .make()
              .centered()
              .pSymmetric(h: 10, v: 5),
        ));
  }

  Future<void> showConfirmDialog(BuildContext context) async {
    final confirmDialogResult = await ConfirmDialog(
      '오늘 기분이 좋나요?',
      buttonText: "네",
      cancelButtonText: "아니오",
    ).show();
    debugPrint(confirmDialogResult?.isSuccess.toString());

    confirmDialogResult?.runIfSuccess((data) {
      ColorBottomSheet(
        '❤️',
        context: context,
        backgroundColor: Colors.yellow.shade200,
      ).show();
    });

    confirmDialogResult?.runIfFailure((data) {
      ColorBottomSheet(
        '❤️힘내여',
        backgroundColor: Colors.yellow.shade300,
        textColor: Colors.redAccent,
      ).show();
    });
  }

  Future<void> showMessageDialog() async {
    final result = await MessageDialog("안녕하세요").show();
    debugPrint(result.toString());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  Future<void> veryHeavyComputationWorkWithIsolateSpawn() async {
    final errorPort = ReceivePort();
    errorPort.listen((element) {
      debugPrint('Isolate Error!');
      debugPrint(element);
    });
    final exitPort = ReceivePort();
    exitPort.listen((message) {
      debugPrint('Exit - Done');
    });
    final progressListenPort = ReceivePort();
    progressListenPort.listen((message) {
      debugPrint('received from isolate');
      debugPrint(message.toString());
    });
    final isolate = await Isolate.spawn(
          (wrappedMessage) {
        final data = wrappedMessage["data"];
        final color = wrappedMessage["color"];
        final sendPort = wrappedMessage["port"] as SendPort;
        print(data);
        print(color);

        int count = 0;
        debugPrint('Isolate Count Start');
        final startTime = DateTime.now();
        for (int i = 0; i <= 1500000000; i++) {
          count += 1;

          // if (i % 100000 == 0) {
          //   debugPrint(
          //       "${DateTime.now().difference(startTime).inMilliseconds / 1000}sec");
          //   throw Exception('error');
          // }

          if (i % 150000000 == 0) {
            sendPort.send(count);
            debugPrint(
                "${DateTime
                    .now()
                    .difference(startTime)
                    .inMilliseconds / 1000}sec");
          }
        }
        debugPrint(count.toString());
        debugPrint(
            "${DateTime
                .now()
                .difference(startTime)
                .inMilliseconds / 1000}sec");
      },
      {
        "data": "filePath.mp4",
        "color": Colors.green,
        "port": progressListenPort.sendPort
      },
      //progressListenPort.sendPort,
      onError: errorPort.sendPort,
      onExit: exitPort.sendPort,
    );

    debugPrint('spawn done');
    delay(() {
      debugPrint('force kill');
      //isolate.kill(priority: Isolate.immediate);

      // debugPrint('force exit isolate');
      //Isolate.exit(isolate.controlPort);
    }, 1000.ms);
  }

  ///Flutter 3.7 이상
  void veryHeavyComputationWorkWithIsolateRun() async {
    const message = '{"message": "Flutter is good"}';

    try {
      final isolateResult = await Isolate.run<String>(() {
        final jsonObject = json.decode(message);
        debugPrint(jsonObject["message"]);
        int count = 0;
        debugPrint('Isolate Count Start');
        final startTime = DateTime.now();
        for (int i = 0; i <= 1500000000; i++) {
          count += 1;
        }
        debugPrint(count.toString());
        debugPrint(
            "${DateTime
                .now()
                .difference(startTime)
                .inMilliseconds / 1000}sec");
        return "Run Isolate Done";
      });
      debugPrint(isolateResult);
    } catch (e) {

    }}}


  Future<void> veryHeavyComputationWork() async {
    int count = 0;
    debugPrint('count start');
    final startTime = DateTime.now();

    ///60fps frame per second : 애니메이션이 부드러운 정도
    ///1/60 => 0.01666초
    ///120fps => 0.008333초
    for (int i = 0; i < 1500000000; i++) {
      count++;
      if (count % 150000000 == 0) {
        debugPrint('progress: ${count.toString()}');
        debugPrint(
            '${DateTime
                .now()
                .difference(startTime)
                .inMilliseconds / 1000} sec');
      }
    }
    debugPrint('result: ${count.toString()}');
    debugPrint('done');
    debugPrint(
        '${DateTime
            .now()
            .difference(startTime)
            .inMilliseconds / 1000} sec');
    //print(count);
  }
