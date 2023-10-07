import 'package:bubbles/features/vendor/model/laundry_opeining_hours_model.dart';
import 'package:bubbles/viewmodels/base_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LaundryOpeningHoursVM extends BaseViewModel {
  final Ref ref;
  LaundryOpeningHoursVM(this.ref) : super(ref);

  List<LaundryOpeningHoursModel> openingTime = [
    LaundryOpeningHoursModel(
        id: 01,
        name: "Monday",
        value: false,
        openingTime: "9",
        closingTime: "5"),
    LaundryOpeningHoursModel(
        id: 02,
        name: "Tuesday",
        value: false,
        openingTime: "9",
        closingTime: "5"),
    LaundryOpeningHoursModel(
        id: 03,
        name: "Wednesday",
        value: false,
        openingTime: "9",
        closingTime: "5"),
    LaundryOpeningHoursModel(
        id: 04,
        name: "Thursday",
        value: false,
        openingTime: "9",
        closingTime: "5"),
    LaundryOpeningHoursModel(
        id: 05,
        name: "Friday",
        value: false,
        openingTime: "9",
        closingTime: "5"),
    LaundryOpeningHoursModel(
        id: 06,
        name: "Saturday",
        value: false,
        openingTime: "9",
        closingTime: "5"),
    LaundryOpeningHoursModel(
        id: 07,
        name: "Sunday",
        value: false,
        openingTime: "9",
        closingTime: "5"),
  ];

  List<String> openingHours = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];

  void updateValue({required dynamic id}) {
    for (var element in openingTime) {
      if (element.id == id) {
        element.value = !element.value!;

        notifyListeners();
      }
    }
  }

  bool selectAll = false;

  void updateAllDayValue() {
    for (var element in openingTime) {
      if (selectAll) {
        element.value = false;

        notifyListeners();
      } else {
        element.value = true;

        notifyListeners();
      }
    }
    selectAll = !selectAll;
    notifyListeners();
  }

  void updateOpeningTime({required dynamic id, required String time}) {
    for (var element in openingTime) {
      if (element.id == id) {
        element.openingTime = time;

        notifyListeners();
      }
    }
  }

  void updateClosingTime({required dynamic id, required String time}) {
    for (var element in openingTime) {
      if (element.id == id) {
        element.closingTime = time;

        notifyListeners();
      }
    }
  }
}
