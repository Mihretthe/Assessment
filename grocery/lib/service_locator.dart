import 'package:get_it/get_it.dart';
import 'package:grocery/core/network/network_info.dart';
import 'package:grocery/features/grocery/data/data_source/local_data_source.dart';
import 'package:grocery/features/grocery/data/data_source/remote_data_source.dart';
import 'package:grocery/features/grocery/data/repositories/grocery_repository_impl.dart';
import 'package:grocery/features/grocery/domain/repositories/grocery_repository.dart';
import 'package:grocery/features/grocery/domain/usecases/get_all_groceries.dart';
import 'package:grocery/features/grocery/domain/usecases/get_grocery.dart';
import 'package:grocery/features/grocery/presentation/bloc/blocs.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
final getIt = GetIt.instance;

Future <void> setUp() async{
  final client = http.Client();
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<InternetConnectionChecker>(() => connectionChecker);
  getIt.registerLazySingleton<http.Client>(() => client);
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt<InternetConnectionChecker>())); 

  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()));

  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: getIt<http.Client>()));

  getIt.registerLazySingleton<GroceryRepository>(() => GroceryRepositoryImpl(remoteDataSource: getIt<RemoteDataSource>(), localDataSource: getIt<LocalDataSource>(), networkInfo: getIt<NetworkInfo>()));

  getIt.registerLazySingleton<GetGroceryUseCase>(() => GetGroceryUseCase(groceryRepository:  getIt<GroceryRepository>()));
  getIt.registerLazySingleton<GetAllGroceriesUseCase>(() => GetAllGroceriesUseCase(groceryRepository:  getIt<GroceryRepository>()));

  getIt.registerLazySingleton<GroceryBloc>(() => GroceryBloc(getAllGroceriesUseCase: getIt<GetAllGroceriesUseCase>()));

}

