import UIKit

var greeting = "Hello, playground"
print(greeting)
print(greeting)

UIImage(systemName: "star")

var sum = 0
for i in 1...10 {
    sum += i
}

// MARK: - 주석

// 한 줄 주석

/* 여러줄 주석 */
/*
 여러줄 주석
 여러줄 주석
 */

// 스위프트에서도 다른 트렌디한 언어처럼 수행문 마지막에 세미콜론(;)을 찍지 않아도 된다.
var greeting2 = "Hello!!"; print(greeting2);

// 출력하기
print(greeting)
dump(greeting)

var number = 10
print(number)
dump(number)



// MARK: - 이름 짓기 규칙

// Lower Camel Case
// 함수, 메소드, 변수, 상수 등의 이름을 지을 때 사용한다.
// someFunction()

// Upper Camel Case
// 타입(Int, String, Bool, Float 등), 클래스
// class SomeClass() {}

// 문자열 보간법(String Interpolation)
let a1 = "안녕하세요." + greeting + "반갑습니다."
let a2 = "안녕하세요. \(greeting)"
let a3 = "안녕하세요. \(100)"
print(a1)
print(a2)
print(a3)


// MARK: - 변수와 상수
// 변수는 "var", 상수는 "let" 키워드로 선언한다.
// let 이름: 타입 = 값
// var 이름: 타입 = 값

let constant: String = "차후에 변경이 불가능"
var variable: String = "차후에 변경이 가능"

variable = "새로운 값 할당"
//constant = "새로운 값 할당 안됨"

var b2: String
let b3: String

b2 = "값 할당을 선언 이후에 해도 됨"
b3 = "값 할당을 선언 이후에 해도 됨"
b2 = "값 수정할 수 있음"
//b3 = "값 수정할 수 없음"


// MARK: - 기본 데이터 타입

// Bool: true와 false만 가지는 논리값 타입
var c1: Bool = true
c1 = false
//c1 = 0 // true, false 이외의 값을 할당하면 에러
//c1 = 1// true, false 이외의 값을 할당하면 에러
//c1 = FALSE // 에러

// Int: 정수값만을 가질 수 있는 타입
var d1 = 100 // 할당되는 값이 확실하다면 타입을 생략할 수 있음
d1 = -100
// UInt: 양의 정수값만을 가질 수 있는 타입
var d2: UInt = 100
//d2 = -100 // 컴파일 에러: 양의 정수만 할당 가능

// 스위프트에서 다른 타입의 변수에는 값을 할당할 수 없다.
d1 = Int(d2)
d2 = UInt(d1)

// 타입 확인하기
print("d2's type: \(type(of: d1))")


// Float: 32비트 부동소수 타입
// Double: 64비트 부동소수 타입
var e1: Float = 10.11
var e2: Double = 10.11
//e1 = e2 // 컴파일 오류
var e3 = 10.11 // 기본적으로 Double 타입으로 선언한다.

// 랜덤값 가져오기: 정수
var e4 = Int.random(in: -100...100)
print("e4: \(e4)")
// 랜덤값 가져오기: 양의 정수
var e5 = UInt.random(in: 0...100)
print("e5: \(e5)")
// 랜덤값 가져오기: 실수
var e6 = Double.random(in: 1.5...100.3)
print("e6: \(e6)")
// 랜덤값 가져오기: 실수
var e7 = Float.random(in: 1.5...100.3)
print("e7: \(e7)")


// 문자 Character
var f1: Character = "a" // 쌍따옴표 안에 문자를 넣는다. (코틀린과 비교: 코틀린은 작은 따옴표 안에)


// 문자열 String
var g1: String = "abcd"
// 빈 문자열 선언
let g2: String = ""
let g3: String = String()
g1.append("efg") // 문자열 추가
g1 = g1 + "hij" // 문자열 추가
g1 += "hij" // 문자열 추가
print("g1: \(g1)")

print("g1.count: \(g1.count)") // 문자 갯수
print("g1.isEmpty: \(g1.isEmpty)") // 빈 문자열 확인

let g4 = "abc"
let g5 = "abcd"
print("g4 == g5: \(g4 == g5)") // 문자열 비교

// 접두어, 접미어 확인
g4.hasPrefix("ab") // 접두어 확인
g4.hasSuffix("cd") // 접미어 확인
print("g4.hasPrefix: \(g4.hasPrefix("ab"))")
print("g4.hasSuffix: \(g4.hasSuffix("cd"))")

// 대소문자 변환
print("g4.uppercased(): \(g4.uppercased())")
print("g4.lowercased(): \(g4.lowercased())")

// RawString: 큰따옴표 세개로 있는 그대로 문자열 값을 할당할 수 있다.
var g6 = """
안녕하세요.
반갑습니다.
"""
print("g6: \(g6)")


// MARK: - Any, AnyObject, nil

// Any
var someAny: Any = 100
someAny = "어떤 타입의 값도 할당 가능"
//var someString: String = someAny // Any도 마친가지로 타입이 다르기 때문에 다른 타입 변수에 할당 불가

// AnyObject
class SomeClass2 {}
var someAnyObject: AnyObject = SomeClass2()
//someAnyObject = 10 // 클래스의 객체(인스턴스)만 할당 가능

// nil: 아무것도 없는 값
//someAny = nil // 컴파일 에러
//someAnyObject = nil // 컴파일 에러
var someAny2: Any? = 200
someAny2 = nil


// MARK: - 튜플 Tuple: 여러 값을 하나의 그룹으로 묶는 데이터 타입

var someData: (String, Int, Double, String) = ("abc", 10, 10.11, "efg")
print("someData.0: \(someData.0)")
print("someData.1: \(someData.1)")
print("someData.2: \(someData.2)")
print("someData.3: \(someData.3)")
