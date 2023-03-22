import 'package:mvvm/data/data_so%C4%B1urce/remote_data_source.dart';
import 'package:mvvm/data/mapper/mapper.dart';
import 'package:mvvm/data/network/error_handler.dart';
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
      try {
        //* connection : OK
        //* safe to call api
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          //* return right
          return Right(response.toDomain());
        } else {
          //* return buslog error
          return Left(Failure(
              code: response.status ?? ApiInternalStatus.FAILURE,
              message: response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //* throw connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
