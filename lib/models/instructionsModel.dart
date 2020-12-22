class Instruction {
  String step;

  Instruction({this.step});

  static Map<String, dynamic> toJson(Instruction instructions) {
    return {
      'step': instructions.step,
    };
  }

  static Instruction fromJson(Map<String, dynamic> json) {
    return Instruction(step: json['step']);
  }
}
