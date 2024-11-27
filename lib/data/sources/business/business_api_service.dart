// import 'package:connect_guide/data/models/business/business.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// abstract class BusinessDataService {
//   Future<Either> getNewBusiness();
// }

// class BusinessDataServiceImpl implements BusinessDataService {
//   final Dio? dio;

//   BusinessDataServiceImpl({this.dio});

//   @override
//   Future<Either> getNewBusiness() async {
//     try {
//       print('Making API call...');
//       final response = await dio!.post('localhost:4500/v1/business/paginated');
//       if (response.statusCode == 200) {
//         print('API call successful');
//         List<BusinessModel> businessList = (response.data as List)
//             .map((json) => BusinessModel.fromJson(json))
//             .toList();
//         return Right(businessList);
//       } else {
//         print('API call failed with status code: ${response.statusCode}');
//         return Left(Exception('Failed to load businesses'));
//       }
//     } catch (e) {
//       print('API call failed with exception: $e');
//       return Left(Exception('Failed to load businesses: $e'));
//     }
//   }
// }

// import 'package:connect_guide/domain/entities/business/business.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// abstract class BusinessDataService {
//   Future<Either<Exception, List<BusinessModelEntity>>> getNewBusiness();
// }

// class BusinessDataServiceImpl implements BusinessDataService {
//   final Dio? dio;

//   // Make sure Dio is properly initialized or passed as a parameter
//   BusinessDataServiceImpl({this.dio});

//   @override
//   Future<Either<Exception, List<BusinessModelEntity>>> getNewBusiness() async {
//     try {
//       print('Making API call...');
//       final response = await dio!.post(
//         'https://localhost:4500/v1/business/paginated', // Ensure you have the correct base URL
//       );

//       if (response.statusCode == 200) {
//         print('API call successful');
//         // Map the response data to your entity
//         List<BusinessModelEntity> businessList = (response.data as List)
//             .map((json) => BusinessModelEntity.fromJson(json))
//             .toList();
//         return Right(businessList); // Return successful result
//       } else {
//         print('API call failed with status code: ${response.statusCode}');
//         return Left(Exception(
//             'Failed to load businesses, status: ${response.statusCode}'));
//       }
//     } catch (e) {
//       print('API call failed with exception: $e');
//       return Left(Exception('Failed to load businesses: $e'));
//     }
//   }
// }

import 'package:connect_guide/domain/entities/business/business.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class BusinessDataService {
  Future<Either<Exception, List<ResultEntity>>> getNewBusiness();
}

class BusinessDataServiceImpl implements BusinessDataService {
  final Dio dio;

  BusinessDataServiceImpl({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<Either<Exception, List<ResultEntity>>> getNewBusiness() async {
    try {
      print('Making API call...');
      final response = await dio.get(
        // 'http://192.168.1.65:4500/v1/business/paginated',
        'http://192.168.1.66:4500/v1/business/paginated',
      );
      print('The Business data  : $response');

      if (response.statusCode == 200) {
        print('API call successful');
        // Map the response data to your entity
        List<ResultEntity> businessList = (response.data['results'] as List)
            .map((json) => ResultEntity.fromJson(json))
            .toList();
        print('Business list : $businessList');
        return Right(businessList); // Return successful result
      } else {
        print('API call failed with status code: ${response.statusCode}');
        return Left(Exception(
            'Failed to load businesses, status: ${response.statusCode}'));
      }
    } catch (e) {
      print('API call failed with exception: $e');
      return Left(Exception('Failed to load businesses: $e'));
    }
  }
}
