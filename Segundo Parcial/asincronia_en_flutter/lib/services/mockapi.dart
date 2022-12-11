import 'dart:math';
/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 2: Asincronia con Flutter.
Fecha: Domingo, 12 de diciembre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
class MockApi {
  /// Patrón Singleton utilizado aquí.
  static final MockApi _mockapi = MockApi._internal();

  factory MockApi() {
    return _mockapi;
  }

  MockApi._internal();

  ///
  /// Método privado para obtener un número entero entre 1 y
  /// 100 después de cierto retraso.
  ///
  Future<int> _getInteger(int delayInSeconds) {
    return Future.delayed(
      Duration(seconds: delayInSeconds),
      () => 1 + Random().nextInt(100),
    );
  }

  ///
  /// Se utiliza una API pública comienza aquí
  ///

  /// Se obtiene un número entero aleatorio entre 1 y 100 muy rápidamente,
  /// porque usa un automóvil Ferrari
  Future<int> getFerrariInteger() {
    return _getInteger(1);
  }

  ///Se btiene un número entero aleatorio entre 1 y 100 no tan rápido,
  /// porque usa un automóvil Hyundai modesto.
  Future<int> getHyundaiInteger() {
    return _getInteger(3);
  }

  /// Se btiene un número entero aleatorio entre 1 y 100 muy lentamente,
  /// porque usa un carro de juguete de Fisher Price.
  Future<int> getFisherPriceInteger() {
    return _getInteger(10);
  }
}
