class Instructions {
  String step;
  int id, number;

  Instructions({this.step, this.id, this.number});

  static Map<String, dynamic> toJson(Instructions instructions) {
    return {
      'step': instructions.step,
      'id': instructions.id,
      'number': instructions.number,
    };
  }

  static Instructions fromJson(Map<String, dynamic> json) {
    return Instructions(
        step: json['step'], id: json['id'], number: json['number']);
  }
}
