import 'package:my_notes/shared/app_paths.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastController {
  Future<Database> initDb() async {
    DatabaseFactory dbFactory = databaseFactoryIo;

    var dbPath = await AppPaths.sembasDbPath();

    return await dbFactory.openDatabase(await AppPaths.sembasDbPath());
  }
}
