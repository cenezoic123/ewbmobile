import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class HiveDBHelper {
  ///Initializes the boxes and registers its corresponding adapters.
  Future openAndRegisterBoxes() async {
    final appDocumentDir =
    await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    if (Hive.isBoxOpen(Boxes.genericBox) == false) {
      await Hive.openBox(Boxes.genericBox);
    }
  }

  ///Closes all the boxes used in the app, may be called during app close.
  closeBoxes() {
    Hive.close();
  }

  Future truncateBoxes() async {
    await Hive.deleteFromDisk();
  }
}

///Static box list.
///
/// All box names must be declared here, box name and box variable must be the same
class Boxes {
  static const String genericBox = 'genericBox';
}
