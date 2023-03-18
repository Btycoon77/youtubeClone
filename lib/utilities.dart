import 'package:path_provider/path_provider.dart';

class Utilis{
  static Future<String>getAssetFile(String fileName)async{
    final directory=await  getApplicationDocumentsDirectory();
    return "${directory.path}/$fileName";
  }
}


class Utilites{
  static Future<String>getFileUrl(String fileName)async{
    final directory=await getApplicationDocumentsDirectory();
    return "${directory.path}/$fileName";
  }
}