main() {
  final Command selectedCommand = SaveCommand();

  selectedCommand.execute();
}

abstract interface class Command {
  void execute();
  // void undo(); //실행쥐소
  // void redo(); //undo 되돌리기
}

class SaveCommand implements Command {
  @override
  void execute() {
    // TODO: implement execute
  }
}

class OpenCommand implements Command {
  @override
  void execute() {
    // TODO: implement execute
  }
}

class CopyCommand implements Command {
  @override
  void execute() {
    // TODO: implement execute
  }
}
