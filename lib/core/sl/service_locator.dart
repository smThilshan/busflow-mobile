// import 'package:get_it/get_it.dart';

// final sl = GetIt.instance;

// Future<void> initDependencyInjection({
//   required String baseUrl,
//   required int driverId,
// }) async {
//   sl.registerLazySingleton(() => DioClient(baseUrl));

//   sl.registerLazySingleton<LocationRemoteDataSource>(
//     () => LocationRemoteDataSource(dio: sl<DioClient>().dio),
//   );

//   sl.registerLazySingleton<LocationRepository>(
//     () => LocationRepositoryImpl(sl<LocationRemoteDataSource>()),
//   );

//   sl.registerLazySingleton(
//     () => UpdateDriverLocationUseCase(sl<LocationRepository>()),
//   );
// }
