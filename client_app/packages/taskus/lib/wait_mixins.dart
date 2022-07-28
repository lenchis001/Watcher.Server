import 'models/three_values.dart';
import 'models/two_values.dart';
import 'models/value_wrapper.dart';

class ExtendedFuture {
  static Future<TwoValues<A, B>> waitTwo<A, B>({
    required Future<A> futureA,
    required Future<B> futureB,
  }) async {
    var resultA = ValueWrapper<A>();
    var resultB = ValueWrapper<B>();

    await Future.wait([
      handleTask(futureA, resultA),
      handleTask(futureB, resultB),
    ]);

    return TwoValues(
        firstValue: resultA.value!,
        secondValue: resultB.value!
    );
  }

  static Future<ThreeValues<A, B, C>> wait<A, B, C>({
    required Future<A> futureA,
    required Future<B> futureB,
    required Future<C> futureC,
  }) async {
    var resultA = ValueWrapper<A>();
    var resultB = ValueWrapper<B>();
    var resultC = ValueWrapper<C>();

    await Future.wait([
      handleTask(futureA, resultA),
      handleTask(futureB, resultB),
      handleTask(futureC, resultC),
    ]);

    return ThreeValues(
        firstValue: resultA.value!,
        secondValue: resultB.value!,
        thirdValue: resultC.value!,
    );
  }
}

Future handleTask<A>(Future<A> future, ValueWrapper<A> resultWrapper) async {
  resultWrapper.value = await future;
}