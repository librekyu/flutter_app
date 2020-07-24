
import 'package:flutter/cupertino.dart';
/// 21. show, hide --------------------------------------------------
/// import 뒤에 show [class 명들]: 해당 클래스만 import;
/// import 뒤에 hide [class 명들]: 해당 클래스만 빼고 import;
import 'package:my_app/example.dart' hide HelloPage;


/// dart 기본 문법 실습용
void main() {
  /// 1. 작은 따옴표 권장. 백틱(₩)은 없음 --------------------------------------------------
  print('Hello World');
  print("Hello World");

  /// 2. 타입 설정 꼭 안해 줘도 됨. --------------------------------------------------
  var a = 10;
  var str = 'asd';
  String str1 = '';

  /// 3. java 에서의 Object 와 유사 --------------------------------------------------
  ///
  dynamic c = '10';
  myMethod(c);

  /// 4. num type - int, double 모두 포함한 타입 --------------------------------------------------
  /// 타입 캐스팅 할 때 유용
  /// int, double 타입 모두 변수에 다양하게 담길 때 사용 가능.
  num b = 4;

  /// 5. final, const 은 타입 생략 가능 --------------------------------------------------
  /// 6. 둘의 차이는 const는 컴파일 타임에 메모리에 저장되고, final은 동적으로 메모리에 할당된다.
  ///     재사용 가능성이 높으면 const가 권장된다.

  /// 7. collection. dart에선 배열 컬렉션이 존재하지 않는다.
  List<String> items = ['a', 'b', 'c'];
  var items2 = ['a', 'b', 'c'];

  /// 8. SET ----------------------------------------------------------------
  Set<int> numSets = {1, 2};

  /// 9. Map --------------------------------------------------------------------
  Map intMap = {'q': 'a'};
  intMap.forEach((key, value) {
    print(key + value);
  });

  /// 10. spread operation (...) --------------------------------------------------
  var spreadItems = [...items2, '4', '5'];

  /// 11. Named, Optional, Default Parameter --------------------------------------------------
  /// 12. required
  /// neccessaryParam 은 반드시 넣어야 하고, unNecessaryParam1,2는 옵션이다.
  /// 또한 unNecessaryParam2은 파라미터로 넣지 않았으므로 기본적으로 30으로 들어간다.
  /// required annotation이 적용된 파라미터는 반드시 넣어야 한다.
  something('zzx', unNecessaryParam1: 'qwe', requiredParam: 30);

  /// 13. 일급 객체
  /// 메서드는 일급객체(파라미터로 전달할 수 있고, 리턴할 수 있고, 변수나 데이터에 할당 할 수 있 객체)이다.

  /// 14. is ---------------------------------------------------------------------
  var q = 10;
  if(q is int){
    print ('정수');
  }
  else if (q is! int){
    print ('정수 X');
  }

  /// 15. as - type casting ---------------------------------------------------------------------
//  print(1 as String);

  /// 16. ?? - if null ---------------------------------------------------------------------
  /// name 이 null 이면 qweqwe로 대체
  var name;
  print(name ?? 'qweqwe');

  /// 17. ? - null 처리 ---------------------------------------------------------------------
  /// null이 아니면 메서드 실행
  String age;
//  print(age.toLowerCase()); // 런타임 에러
  print(age?.toLowerCase()); // 에러 X

  /// 18. class ---------------------------------------------------------------------
  /// new 생략 가능
  /// getter, setter
  /// class 내 변수 앞에 _(underscore)를 넣으면 자동으로 private 처리.
  var person = MyClass('', varB: 12);

  /// 19. cascade(..) ---------------------------------------------------------------------
  var person2 = MyClass('', varB: 3)
  ..setPrivateVar('qweqwe');
  print('_privateVar1 >' + person2._privateVar1);

}


/// 20. mixin
/// Dart 에서는 슈퍼 클래스 하나만 가질 수 있다.
/// 클래스 상속 외에 인터페이스로 구현해도 되나,
/// 여러 클래스에서 동작을 반드시 구현해야 하므로 코드 복잡도가 상승하는 단점이 있다.
/// 여러 클래스 계층에서 클래스 코드 재활용을 위해 mixin을 사용한다.
/// 사용법 mixin [Class 명] on [확장/구현 할 Class 명]
/// 또는, class [Class 명] with [확장/구현 할 Class 명]
class AClass {
  String a;
  String b;
}
mixin X on AClass{

}

abstract class AbsAClass{
  String a;

  void funcA();
}

class ExClass extends AbsAClass{
  @override
  void funcA() {
    // TODO: implement funcA
  }

}

class ExClass2 implements AbsAClass{
  @override
  String a;

  @override
  void funcA() {
    // TODO: implement funcA
  }

}

class ExClass3 with AbsAClass{
  @override
  void funcA() {
    // TODO: implement funcA
  }

}

class BClass with AClass{

}

class CClass implements AClass{
  @override
  String a;

  @override
  String b;
}

class DClass extends AClass{

}

// 3.
void myMethod (dynamic str){
  print(str);
}

// 11.
void something(String necessaryParam, {String unNecessaryParam1, int unNecessaryParam2 = 30, @required int requiredParam}) {
  print(necessaryParam + unNecessaryParam1 + requiredParam.toString());
}

// 18.
class MyClass {
  String varA;
  int varB;
  String _privateVar1 = '';

  String get privateVar1 => _privateVar1;

  set privateVar1(String value) {
    _privateVar1 = value;
  }

  void setPrivateVar(String value){
    this._privateVar1 = value;
  }

  /// 생성자
  MyClass(this.varA, {this.varB});
}