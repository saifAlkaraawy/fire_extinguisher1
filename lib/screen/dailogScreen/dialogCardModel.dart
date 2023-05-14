class DialogCardModel {
  String? title;
  String? firstTitleOption;
  String? secondTitleOption;
  bool? firstOptionStatus;
  bool? secondOptionStatus;
  List<String>? optionsValue;
  String? groubValue;

  DialogCardModel(
      {this.title,
      this.firstTitleOption,
      this.secondTitleOption,
      this.firstOptionStatus,
      this.secondOptionStatus,
      this.groubValue,
      this.optionsValue});
}
