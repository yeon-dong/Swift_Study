import UIKit

// MARK: - 기본 문법

// 변수와 상수
// - 변수(var): 변경 가능한 값
// - 상수(let): 변경 불가능한 값
var variable = 10
let constant = 20
variable = 20
//constant = 30 // 초기화 이후 값 대입할 수 없다. 컴파일 에러

// 선언 이후에 초기화 할 수 있다.
var variable2: Int
let constant2: Int
variable2 = 200
constant2 = 300
//constant2 = 400 // 상수 초기화는 한 번 만 할 수 있음

var variable3: Int
let constant3: Int
//print(variable3) // 초기화 하기 전에 변수(상수) 사용시 컴파일 에러
//print(constant3) // 초기화 하기 전에 변수(상수) 사용시 컴파일 에러

// 클래스 안에서
class TestClass {
    var variable4: Int = 0 // 선언과 동시에 초기화
    let constant4: Int = 0
}
// 또는
class TestClass2 {
    var variable4: Int
    let constant4: Int
    init(variable4: Int, constant4: Int) {
        self.variable4 = variable4
        self.constant4 = constant4
    }
}
//class TestClass3 {
//    lazy var variable4: Int
//    init() {
//
//    }
//}


// 데이터 타입
// - 주요 데이터 타입: Int, Double, Float, String, Bool, Character

// 타입 추론
var variable5 = 0
let string = "string"



// MARK: - 옵셔널
// - 값이 있을 수도, 없을 수도 있는 상태를 표현
// - 옵셔널 선언: ?

var name: String? = "John"
name = nil // 아무것도 아닌 값 대입 가능
print("name: \(name!)")
var name2: String! = "John"
print("name: \(name2)")

// 옵셔널 바이딩
// - 옵셔널 변수를 안전하게 추출
if let unwrappedName = name {
    print("name: \(unwrappedName)")
} else {
    print("이름이 없어요...")
}

// 옵셔널 체이닝
// - 중첩된 옵셔널에 접근
let length = name?.count // 옵셔널 반환
print("length: \(length)") // "Optional[6]"


// MARK: - 조건문

// if 문
let age = 20
if age > 19 {
    print("어른입니다.")
} else {
    print("어른이 아닙니다.")
}

// 스위치문
let value = 3
switch value {
case 1:
    print("Value is 1")
case 2:
    print("Value is 2")
case 3:
    print("Value is 3")
default:
    print("Value is something else")
}


// MARK: - 반복문
// - for-in 문
let numbers = [1, 2, 3]
for number in numbers {
    print("number: \(number)")
}

// - while 문
var count = 3
while count > 0 {
    print("count: \(count)") // 3, 2, 1
    count -= 1
}


// MARK: - 함수
// 함수 정의 및 호출

// 기본적인 정의 및 호출
func greet(name: String) -> String {
    return "Hello, \(name)!"
}
print(greet(name: "Swift"))

// 기본값이 있는 매개변수
func greet2(name: String = "Guest") {
    print("Hello, \(name)!")
}
greet2()

// 가변 매개변수
func sum(numbers: Int...) -> Int {
    return numbers.reduce(0, +)
}
//print(sum(numbers: [1, 2, 3]))

// 전달인자 레이블
func subtract(from a: Int, to b: Int) -> Int {
    return a - b
}
subtract(from: 10, to: 5)

// 전달인자 레이블
func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}
subtract(10, 5)


// MARK: - 함수형 프로그래밍

// 클로저
// - 코드 블록을 변수(값)처럼 사용 가능
func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

let add: (Int, Int) -> Int
add = { (a: Int, b: Int) in
    return a + b
}

calculate(a: 10, b: 20, method: add)

calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left + right
})
calculate(a: 10, b: 10) { $0 + $1 }


// 컬렉션

// 배열 (Array)
var numbers2: [Int] = [1, 2, 3]
numbers2.append(4)

// 딕셔너리 (Dictionary)
var user: [String: String] = ["name": "John", "age": "25"]
print(user["name"] ?? "Unknown") // 값이 없으면 기본값 반환

// 집합 (Set) : 순서 없음, 중복 없음
var fruits: Set = ["Apple", "Banana", "Orange"]
fruits.insert("Grape")


// map, filter, reduce
let numbers3 = [1, 2, 3, 4, 5]

// map
let doubled = numbers.map { $0 * 2 } // 2, 4, 6, 8, 10

// filter
let evens = numbers.filter { $0 % 2 == 0 }

// reduce
let sum = numbers.reduce(0, +)


// MARK: - 구조체와 클래스

// 구조체
// - 값 타입
struct Person {
    var name: String
    var age: Int
}
let john = Person(name: "John", age: 30)

// 클래스
// - 참조 타입
class Car {
    var brand: String = ""
    func drive() {
        print("Driving \(brand)")
    }
}
let car = Car()
car.brand = "Tesla"
car.drive()


// MARK: - 프로토콜
// 프로토콜은 특정 공통 기능이나 동작을 정의하는 틀입니다.
// 프로토콜은 무엇을 해야 하는지를 선언하지만, 어떻게 할지는 정의하지 않습니다.
// 공통의 기능이나 속성을 강제한다.
protocol Animal {
    var name: String { get }
    func makeSound()
}

struct Dog: Animal {
    var name: String
    func makeSound() {
        print("멍멍!")
    }
}

struct Cat: Animal {
    var name: String
    func makeSound() {
        print("야옹!")
    }
}


// MARK: - 열거헝 enum
// - 값의 집합을 정의
enum Direction {
    case north, south, east, west
}
let move = Direction.north

// 연관값 사용
enum Result {
    case success(data: String)
    case failure(error: String)
}
let result = Result.success(data: "OK")

switch result {
case .success(let data):
    print(data)
case .failure(let error):
    print(error)
}


// MARK: - 에러 처리(Exception Handling, Error Handling)
// - do-catch 구문을 사용하여 에러를 처리
enum VendingError: Error {
    case outOfStock
}

func vend(item: String) throws {
    throw VendingError.outOfStock
}

do {
    try vend(item: "Chips")
} catch {
    print("Error occurred: \(error)")
}
