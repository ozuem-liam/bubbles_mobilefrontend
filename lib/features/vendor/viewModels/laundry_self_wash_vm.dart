import 'package:bubbles/features/vendor/model/laundry_washing_machine_model.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/viewmodels/base_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LaundrySelfWashVM extends BaseViewModel {
  final Ref ref;
  LaundrySelfWashVM(this.ref) : super(ref);

  List<LaundryWashingMachineModel> localMachines = [];

  void addMachineToList({required LaundryWashingMachineModel data}) {
    bool isUnique = true;
    // AppLogger.logg("current lenght  ${localAppliances.length}");
    for (LaundryWashingMachineModel element in localMachines) {
      if (element.id == data.id) {
        // element.quantity = data.quantity;
        notifyListeners();
        isUnique = false;
        break;
      }
    }
    // If the item is unique, add it to the list.
    if (isUnique) {
      localMachines.add(data);
      notifyListeners();
    }
    // clearCurrentApplianceFiels();
  }

  void removeMachine(){
    localMachines.removeLast();
    notifyListeners();
  }

  void updateMachineType({required String type, required dynamic id}){
     for (var element in localMachines) {
       if (element.id == id) {
         element.machinType = type;
        
         notifyListeners();
       }
     }
  }

   void increaseMachinePrice({ required dynamic id}){
     for (var element in localMachines) {
       if (element.id == id) {
         element.amount = element.amount! + 100;
        
         notifyListeners();
       }
     }
  }
    void decreaseMachinePrice({ required dynamic id}){
     for (var element in localMachines) {
       if (element.id == id) {
         element.amount = element.amount! - 100;
        
         notifyListeners();
       }
     }
  }
}
