import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/datasources/local_data_source.dart';
import 'app/data/datasources/remote_data_source.dart';
import 'app/data/repositories/diseasesh_repository_impl.dart';
import 'app/domain/repositories/diseasesh_repository.dart';
import 'app/domain/usecases/fetch_global_totals.dart';
import 'app/presentation/cubits/disease_sh/diseasesh_cubit.dart';
import 'core/network/network_info.dart';

GetIt g = GetIt.instance;

Future<void> configureInjection(String env) async {
  // Cubits
  g.registerLazySingleton(() => DiseaseshCubit(g()));

  // Use cases
  g.registerLazySingleton(() => FetchGlobalTotals(g()));

  // Repositories
  g.registerLazySingleton<DiseaseSHRepo>(() => DiseaseSHRepoImpl(
      networkInfo: g(), remoteDataSource: g(), localDataSource: g()));

  // `Data sources`
  //
  // Remote
  g.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(g()));
  // Local
  g.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(g()));

  // Core
  g.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(g()));

  //! External INJECTABLES
  final sharedPreferences = await SharedPreferences.getInstance();
  g.registerLazySingleton(() => sharedPreferences);
  g.registerLazySingleton(() => Dio());
  g.registerLazySingleton(() => DataConnectionChecker());
}
