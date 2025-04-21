import 'package:movie/core/usercase/usercase.dart';
import 'package:movie/domain/auth/repositories/auth.dart';
import 'package:movie/service_locator.dart';
class isLoggedInUsercase extends UseCase<bool, dynamic>{
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}