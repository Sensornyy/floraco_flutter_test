import 'package:floraco_flutter_test/core/service/storage_service.dart';

abstract class SummaryDataSource {
  Future<void> setChoice(String choice);

  Future<void> setDateOfBirth(String dateOfBirth);

  Future<String?> getChoice();

  Future<String?> getDateOfBirth();
}

class SummaryDataSourceImpl implements SummaryDataSource {
  final StorageService storageService;

  SummaryDataSourceImpl({
    required this.storageService,
  });

  @override
  Future<String?> getChoice() async {
    return await storageService.getChoice();
  }

  @override
  Future<String?> getDateOfBirth() async {
    return await storageService.getDateOfBirth();
  }

  @override
  Future<void> setChoice(String choice) async {
    await storageService.setChoice(choice);
  }

  @override
  Future<void> setDateOfBirth(String dateOfBirth) async {
    await storageService.setDateOfBirth(dateOfBirth);
  }
}
