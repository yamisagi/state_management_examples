class MockApi {
  String? dateTime;

  Future<String> getTime() async {
    await Future.delayed(const Duration(seconds: 1));
    dateTime = DateTime.now().toIso8601String();
    return dateTime!;
  }
}
