import 'package:mvvm/data/data_so%C4%B1urce/remote_data_source.dart';
import 'package:mvvm/data/mapper/mapper.dart';
import 'package:mvvm/data/network/network_info.dart';
import 'package:mvvm/domain/model.dart';
import 'package:mvvm/data/request/login_request.dart';
import 'package:mvvm/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm/domain/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      //* connection : OK
      //* safe to call api
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        //* return right
        return Right(response.toDomain());
      } else {
        //* return buslog error
        return Left(Failure(
            code: 409,
            message:
                response.message ?? "We have an issue about business logic"));
      }
    } else {
      //* throw connection error
      return Left(
          Failure(code: 501, message: "Please Check Your Internet Connection"));
    }
  }
}
