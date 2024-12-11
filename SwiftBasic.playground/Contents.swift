import UIKit

var greeting = "Hello, playground"
print(greeting)
print(greeting)

UIImage(systemName: "star")
var sum = 0
for i in 1...10{
    sum += i
}

// MARK: - 주석

//한 줄 주석

/*
 여러 줄 주석
 */

// MARK: - 이름 짓기 규칙

// Lower Camel Case
// 함수 메소드 변수 상수 등의 이름을 지을 때 사용한다.
// someFunction

// Upper Camel Case
// 타입(Int, String, Bool, Float 등) 클래스
// class SomeClass() {}

// 문자열 보간법(String Interpolation)
let a1 = "안녕하세요." + greeting + "hello"
let a2 = "Hello \(greeting)"
let a3 = "Hello \(100)"
print(a1,a2,a3)

// MARK: - 변수와 상수
/*
 변수는 var, 상수는 let 키워드로 선언한다
 let 이름: 타입 = 값
 var 이름: 타입 = 값
 */

let constant: String = "추후 변경 불가능"
var variable: String = "추후 변경 가능"

variable = "새로운 값 할당"
// constant = "새로운 값 할당 안됨"

var b2: String

b2 = "값을 나중에 할당해도 됨"

// MARK: - 기본 데이터 타입

/*
  bool 은 true false만 가짐
 Int 정수 값만 가짐
 UInt는 양의 정수값만 가진다.
 */
