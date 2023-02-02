abstract class UserDatasource {
  Future<int> getNextData(int request, bool isAdd);
}

class UserDatasourceImpl implements UserDatasource {
  @override
  Future<int> getNextData(int request, bool isAdd) async {
    //http response time simulation
    await Future.delayed(const Duration(seconds: 1));
    //api call
    int response = request + (isAdd ? 1 : -1);
    return response;
  }
}
