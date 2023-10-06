class LaundryWashingMachineModel {
   dynamic id;
   String? machinType;
   int? amount;
   String? image;

  LaundryWashingMachineModel({
     this.id,
     this.machinType,
     this.amount,
     this.image,
  });

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "machine_type": machinType,
      "amount": amount,
      "image": image,
    };
  }
}