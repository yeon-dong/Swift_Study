import UIKit

// MARK: - 열거형(enum)의 연관값

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

// 원시값 RawValue
enum MainDish2 : String {
    case pasta = "pasta"
}
// 원시값은 항목 자체에 해당되는 값
var mainDish = MainDish2.pasta
var mainDish2 = MainDish2.pasta
print("mainDish.rawValue: \(mainDish.rawValue)")
print("mainDish2.rawValue: \(mainDish2.rawValue)")

// 연관값
var pasta = MainDish.pasta(taste: "크림")
var pasta2 = MainDish.pasta(taste: "토마토")
print("pasta: \(pasta)")
print("pasta2: \(pasta2)")

// 열거형을 사용하는 이유는 우리만의 데이터 타입을 만들기 위해서이다.
// Animal 구조체의 예
struct Animal {
    var name: String
//    var isMammel: Bool // true
//    var isReptile: Bool  // true
//    var isBird: Bool
    var animalType: AnimalType2
    
    init(name: String, animalType: AnimalType2) {
        self.name = name
//        self.isMammel = isMammel
        self.animalType = animalType
    }
}

// 열거형을 정의해 우리만의 타입(변수)를 만들 수 있다. 직관적이다.
enum AnimalType {
    case mammel
    case reptile
    case bird
}

// 연관값을 가지는 열거형
enum AnimalType2 {
    case mammel(shortFur: Bool)
    case reptile
    case bird
}

let lion = Animal(name: "사자", animalType: .mammel(shortFur: true))
let bear = Animal(name: "곰", animalType: .mammel(shortFur: false))
print("lion: \(lion)")
print("bear: \(bear)")
print("lion.animalType: \(lion.animalType)")
print("bear.animalType: \(bear.animalType)")

switch lion.animalType {
case .mammel(let shortFur):
    print("\(lion.name)은(는) 포유류이고 털이 \(shortFur ? "짧습니다." : "깁니다.")")
case .reptile:
    print("\(lion.name)은(는) 파충류입니다.")
case .bird:
    print("\(lion.name)은(는) 조류입니다.")
}


// MARK: - 오류처리(Error Handling)

// guard의 기본 문법
// if랑 비슷하지만 조건이 참일 때의 수행부는 없고 else일 때만 있음.
//guard 조건 else {
//    // 조건이 거짓일 때 실행되는 코드
//    return / throw / break / continue 등
//}

// 스위프트에서 오류는 Error라는 프로토콜을 준수하는 타입의 값을 통해 표현됩니다..

// Error 프로토콜과 주로 열거형을 통해 오류를 표현한다.
enum 오류종류이름: Error {
    case 종류1
    case 종류2
    case 종류3
}

// 자판기 동작 오류의 종류를 표현한 VendingMachine 열거형
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

class VendingMachine {
    let itemPrice = 100
    var itemCount = 5
    var deposited = 0
    
    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws {
        // 입력한 돈이 0이면 오류를 던진다.
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        // 오류가 없으면 정상처리를 한다.
        deposited += money
        print("\(money)원 받음")
    }
    
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        // 원하는 아이템의 수량이 잘 못 입력되었으면 오류를 던진다.
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던진다.
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던진다.
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        // 오류가 없으면 정상처리를 한다.
        let totalPrice = numberOfItemsToVend * itemPrice
        deposited -= totalPrice
        itemCount -= numberOfItemsToVend
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 생성
let machine = VendingMachine()
// 판매결과를 전달받을 변수
var result: String?

// 가장 정석적인 방법으로 모든 오류 케이스에 대응합니다.
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다.")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다.")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다")
}

// 하나의 catch 블럭에서 switch 구문을 사용하여 오류를 분류할 수 있다. 위의 구문과 크게 다르지 않다.
do {
    try machine.receiveMoney(300)
} catch /*let error*/ {
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘 못 되었습니다.")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다.")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다")
    default:
        print("알 수 없는 오류 \(error)")
    }
}

// 딱히 케이스별로 오류를 처리할 필요가 없으면 catch 구문 내부를 간략화해도 무방하다.
do {
    try machine.receiveMoney(10000)
} catch {
    print(error)
}
// 에러가 캐치될 때 원시값의 변수명이 출력된다 생각해도 무방

do {
    result = try machine.vend(numberOfItems: 1)
} catch {
    print(error)
}
print(result)


// try? 와 try!
// 별도의 오류처리 결과를 통보받지 않고 오류가 발행했으면 결과값을 nil로 돌려받을 수 있다. 정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받는다.
//result = try? machine.vend(numberOfItems: 1)
//print("result: \(result)")
//
//result = try! machine.vend(numberOfItems: 200)
//print("result: \(result)")

// try? 옵셔널 반환
try machine.receiveMoney(1000)
if let result = try? machine.vend(numberOfItems: 2) {
    print("result: \(result)")
} else {
    print("정상적인 동작이 아닙니다.")
}
    


// MARK: - 접근 제어 (Access)
/** 접근 제어자 키워드
 - 위로 갈 수록 개방적. 아래로 갈 수록 제한적
 open
 public
 internal
 filePrivate
 private
 */

// open
//  - 클래스와 클래스 멤버(메서드, 프로퍼티 등)에 적용된다.
//  - 클래스 적용 가능하지만, 구조체, 열거형 등에는 적용할 수 없다.
//  - 다른 모듈에서도 상속과 재정의가 가능하다.
//  - 가장 개방적인 접근 수준
open class OpenClass {
    open func openMethod() {
        print("This is an open method.")
    }
}

// public
//  - 외부 모듈에서 접근 가능하지만 상속과 재정의는 불가하다.
//  - 일반적으로 api를 공개할 때 사용한다.
public class PublicClass {
    open func publicMethod() {
        print("This is an public method.")
    }
}

// internal (기본 수준)
//  - 동일 모듈 내에서만 접근 가능하다.
//  - 명시적으로 접근제어 키워드를 선언하지 않으면 기본값은 internal이다.
internal class InternalClass {
    open func internalMethod() {
        print("This is an internal method.")
    }
}

// fileprivate
fileprivate class FilePrivateClass {
    fileprivate func doSomething() {
        print("This is fileprivate.")
    }
}

// private
//  - 동일한 선언 블록 안에서만 접근 가능하며, 확장(Extension)에서도 접근할 수 없다.
// - 가장 제한적인 접근 수준.
private class PrivateClass {
    private var secret = "Top Secret"
    
}


// 접근 제어 규칙
// Higher Level 제한: 특정 코드가 더 제한적인 접근 수준을 가진 코드(예: private)보다 높은 접근 수준을 가질 수 없습니다
public class PublicClass2 {
    private var privateProperty = "Secret" // 가능
    
    // 읽기와 쓰기 따로 접근제어자 지정 할 수 있다.
    public private(set) var second = "Second"
}

private class PrivateClass2 {
    public var publicProperty = "Exposed" // 오류 발생
    
}

print("------------------------")

// MARK: - 옵셔널 체이닝
// 옵셔널 체이닝은 옵셔널의 내부의 내부의 내부로 옵셔널이 연결되어 있을 때 유용하게 활용할 수 있습니다.
// 매번 nil 확인을 하지 않고 최종적으로 원하는 값이 있는 지 없는 지 확인할 수 있습니다.

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let david: Person? = Person(name: "david")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

// 옵셔널 체이닝을 사용하지 않는다면...
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다.")
                } else {
                    print("우리집 경비원은 직업이 없어요.")
                }
            } else {
                
            }
        } else {
            print("\(owner.name)은 집이 없어요.")
        }
    }
}
guardJob(owner: david)

// 옵셔널 체이닝으로 바꾸기
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}


david?.home = apart

david?.home?.guard = superman

david?.home?.guard?.job = "경비원"

guardJobWithOptionalChaining(owner: david)



var person: Person? = Person(name: "keon")
person = nil
//print("person?.name: \(person!.name)")

//print("person?.name: \(person?.person?.person?.name)")




// nil 병합 연산자
var guardJob2: String?
guardJob2 = david?.home?.guard?.job ?? "수퍼맨"
print("guardJob2: \(guardJob2)")

david?.home = apart
david?.home?.guard = superman
var guardJob3 = david?.home?.guard?.job = "경비원"
print("guardJob3: \(guardJob3)")
