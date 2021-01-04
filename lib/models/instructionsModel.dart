class Instruction {
  String step, equipment;
  int number;

  Instruction({this.step, this.number});

  static Map<String, dynamic> toJson(Instruction instructions) {
    return {
      'step': instructions.step,
      'number': instructions.number,
    };
  }

  static Instruction fromJson(Map<String, dynamic> json) {
    return Instruction(step: json['step'], number: json['number']);
  }
}
