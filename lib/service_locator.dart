// // import 'package:connect_guide/data/repository/auth/auth_repository_impl.dart';
// // import 'package:connect_guide/data/repository/business/business_repository_impl.dart';
// // import 'package:connect_guide/data/sources/auth/auth_firebase_service.dart';
// // import 'package:connect_guide/data/sources/business/business_api_service.dart';
// // import 'package:connect_guide/domain/repository/auth/auth.dart';
// // import 'package:connect_guide/domain/repository/business/business.dart';
// // import 'package:connect_guide/domain/usecases/auth/get_user.dart';
// // import 'package:connect_guide/domain/usecases/auth/signin.dart';
// // import 'package:connect_guide/domain/usecases/auth/signup.dart';
// // import 'package:connect_guide/domain/usecases/business/get_business.dart';
// // import 'package:get_it/get_it.dart';

// // final sl = GetIt.instance;

// // Future<void> initializeDependencies() async {
// // //firebase service
// //   sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
// //   sl.registerSingleton<BusinessDataService>(BusinessDataServiceImpl());

// //   //repository
// //   sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
// //   sl.registerSingleton<BusinessRepository>(BusinessRepositoryImpl());

// //   sl.registerSingleton<SignupUseCase>(SignupUseCase());
// //   sl.registerSingleton<SigninUseCase>(SigninUseCase());
// //   sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
// //   sl.registerSingleton<GetBusinessUseCase>(GetBusinessUseCase());
// // }

// import 'package:connect_guide/data/repository/auth/auth_repository_impl.dart';
// import 'package:connect_guide/data/repository/business/business_repository_impl.dart';
// import 'package:connect_guide/data/sources/auth/auth_firebase_service.dart';
// import 'package:connect_guide/data/sources/business/business_api_service.dart';
// import 'package:connect_guide/domain/repository/auth/auth.dart';
// import 'package:connect_guide/domain/repository/business/business.dart';
// import 'package:connect_guide/domain/usecases/auth/get_user.dart';
// import 'package:connect_guide/domain/usecases/auth/signin.dart';
// import 'package:connect_guide/domain/usecases/auth/signup.dart';
// import 'package:connect_guide/domain/usecases/business/get_business.dart';
// import 'package:get_it/get_it.dart';

// final sl = GetIt.instance;

// Future<void> initializeDependencies() async {
//   // Firebase service
//   sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
//   sl.registerSingleton<BusinessDataService>(BusinessDataServiceImpl());

//   // Repository
//   sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
//   sl.registerSingleton<BusinessRepository>(BusinessRepositoryImpl());

//   // Use cases
//   sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
//   sl.registerSingleton<SigninUseCase>(SigninUseCase());
//   sl.registerSingleton<SignupUseCase>(SignupUseCase());
//   sl.registerSingleton<GetBusinessUseCase>(GetBusinessUseCase());
// }

import 'package:connect_guide/data/repository/auth/auth_repository_impl.dart';
import 'package:connect_guide/data/repository/business/business_repository_impl.dart';
import 'package:connect_guide/data/sources/auth/auth_firebase_service.dart';
import 'package:connect_guide/data/sources/business/business_api_service.dart';
import 'package:connect_guide/domain/repository/auth/auth.dart';
import 'package:connect_guide/domain/repository/business/business.dart';
import 'package:connect_guide/domain/usecases/auth/get_user.dart';
import 'package:connect_guide/domain/usecases/auth/signin.dart';
import 'package:connect_guide/domain/usecases/auth/signup.dart';
import 'package:connect_guide/domain/usecases/business/get_business.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Firebase service
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<BusinessDataService>(BusinessDataServiceImpl());

  // Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<BusinessRepository>(BusinessRepositoryImpl());

  // Use cases
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetBusinessUseCase>(GetBusinessUseCase());
}
