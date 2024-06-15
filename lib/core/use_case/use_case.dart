import 'package:dartz/dartz.dart';

import '../error/failures.dart';

// * -----------------------------  Base Class For Any UseCase That Should Implement It --------------------------------- * //

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
