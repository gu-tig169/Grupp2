class Instruction {
  String step;
  int number;

  Instruction({this.step, this.number});

  static Instruction fromJson(Map<String, dynamic> json) {
    return Instruction(step: json['step'], number: json['number']);
  }
}
