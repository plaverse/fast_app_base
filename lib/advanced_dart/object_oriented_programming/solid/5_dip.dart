import 'package:http/http.dart' as http;

class UserApi {
  //RemoteLogger logger = RemoteLogger();

  final Logger logger;

  UserApi(this.logger);

  void registerUser(String username, String password) {
    logger.log("User registered: $username");
  }
}
//2개이상의 implements가 필요할 때 추상화 클래스 활용
abstract interface class Logger{
  void log(String message);
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print("LOG: $message");
  }
}

class RemoteLogger implements Logger {
  @override
  void log(String message) {
    http.post(Uri.parse("https://api.todo.com/logger"), body: {"message": message});
  }
}

main() {
  final api = UserApi(RemoteLogger());
  final api2 = UserApi(ConsoleLogger());
  api.registerUser("홍길동", "abc123*");
}
