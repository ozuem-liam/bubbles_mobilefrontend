class LaundryOpeningHoursModel {
  dynamic id;
  String? name;
  bool? value;
  String? openingTime;
  String? closingTime;

  LaundryOpeningHoursModel({
    this.id,
    this.name,
    this.value,
    this.openingTime,
    this.closingTime,
  });

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "name": name,
      "value": value,
      "opening_time": openingTime,
      "closing_time": closingTime
    };
  }
}
