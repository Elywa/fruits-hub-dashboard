abstract class DataBaseService {
  Future addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });

  Future<bool> ifDataExists({required String path, required String documentId});
}
