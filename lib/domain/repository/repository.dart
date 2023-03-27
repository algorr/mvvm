import 'package:dartz/dartz.dart';
import 'package:mvvm/data/network/failure.dart';
import 'package:mvvm/data/request/login_request.dart';
import 'package:mvvm/domain/model.dart';

abstract class Repository {
  //* login event
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
