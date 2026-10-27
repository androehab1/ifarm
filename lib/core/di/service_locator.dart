import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  // هنا هنسجل كل الـ Repositories والـ Blocs بتاعتنا
  // مثال لما نبدأ في الـ Feature:
  // sl.registerLazySingleton<FarmRepository>(() => MockFarmRepository());
}