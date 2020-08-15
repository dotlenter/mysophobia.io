import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/datasources/local_data_source.dart';
import 'app/data/datasources/location_info.dart';
import 'app/data/datasources/remote_data_source.dart';
import 'app/data/repositories/diseasesh_repository_impl.dart';
import 'app/domain/repositories/diseasesh_repository.dart';
import 'app/domain/usecases/fetch_country_totals.dart';
import 'app/domain/usecases/fetch_global_totals.dart';
import 'app/domain/usecases/fetch_risk_areas.dart';
import 'app/domain/usecases/fetch_vaccines.dart';
import 'app/domain/usecases/location_stream.dart';
import 'app/presentation/cubits/country/country_cubit.dart';
import 'app/presentation/cubits/disease_sh/diseasesh_cubit.dart';
import 'app/presentation/cubits/location/location_cubit.dart';
import 'app/presentation/cubits/risk_area/risk_area_cubit.dart';
import 'app/presentation/cubits/vaccine/vaccine_cubit.dart';
import 'core/network/network_info.dart';
import 'core/permissions/permission_info.dart';

GetIt g = GetIt.instance;

Future<void> configureInjection(String env) async {
  // Cubits/Blocs
  g.registerFactory<DiseaseshCubit>(() => DiseaseshCubit(g()));
  g.registerFactory<CountryCubit>(() => CountryCubit(g()));
  g.registerFactory<LocationCubit>(() => LocationCubit(g()));
  g.registerFactory<RiskAreaCubit>(() => RiskAreaCubit(g()));
  g.registerFactory<VaccineCubit>(() => VaccineCubit(g()));
  // Use cases
  g.registerLazySingleton(() => FetchGlobalTotals(g()));
  g.registerLazySingleton(() => FetchCountryTotals(g()));
  g.registerLazySingleton(() => LocationStream(g()));
  g.registerLazySingleton(() => FetchRiskAreas(g()));
  g.registerLazySingleton(() => FetchVaccines(g()));

  // Repositories
  g.registerLazySingleton<DiseaseSHRepo>(() => DiseaseSHRepoImpl(
        networkInfo: g(),
        remoteDataSource: g(),
        localDataSource: g(),
        permissionInfo: g(),
        locationInfo: g(),
      ));

  // `Data sources`
  //
  // Remote
  g.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(g()));
  // Local
  g.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(g()));
  // Other sources
  g.registerLazySingleton<LocationInfo>(() => LocationInfoImpl(g()));

  // Core
  g.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(g()));
  g.registerLazySingleton<PermissionInfo>(() => PermissionInfoImpl());

  //! External INJECTABLES
  final sharedPreferences = await SharedPreferences.getInstance();
  g.registerLazySingleton(() => sharedPreferences);
  g.registerLazySingleton(() => Dio());
  g.registerLazySingleton(() => DataConnectionChecker());
  g.registerLazySingleton(() => Geolocator());
}
