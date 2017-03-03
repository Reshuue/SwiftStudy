#Swift - 옵셔널(optional)

##Optional
* 프로그래밍의 null point exception에 대한 문법적 안전장치로 swift에 도입.
* 옵셔널 값은 nil/nil이 아닌 경우로 나뉨 (nil 아니면 모든 변수는 값을 갖는다.)
* ! 와 ?를 데이터자료형과 변수 뒤에 명시 (**?: optional** / **!: optional unwrapping**)
* **?**가 붙이면 실제데이터는 Optional(데이터) 형식으로 데이터형을 감싸게 표현됨
* optional 붙은 자료형은 **!**로 Optional를 벗겨서 변수/데이터를 사용하게 됩니다. (**force unwrapping**)

##case1. default optional warpping
* 옵셔널의 기본적인 선언
* ?으로 optional타입으로 명시
* Optional타입은 값이 없을시 nil 기본 초기화

```{.swift}
let str:String? 	//optional 타입선언, 값 없을시 nil로 초기화
```
* 옵셔널은 값을 초기화하면 Optional로 데이터를 감싼다.(**optional wrapping**)

```{.swift}
let str:String? = "string"
print(str)  		//Optional("string")
```

##case2. force unwrapping
* 옵셔널타입 변수 뒤에 **!**로 옵셔널 강제해제시킴 
* 옵셔널타입의 nil여부가 확실하지 않을 경우 ! 쓰는 코드는 위험코드가 될 수 있음

```{.swift}
let num:Int? = 123
print(num)  //Optional(123)
print(num!) //123
```

##case3. implicity unwrapping
* force unwrapping의 강제적 해제 대신 안정적으로 optional unwrapping 위한 구문
* 조건의 변수 대입 중 nil이 발생할 경우 그 조건식이 false 인식하여 조건문을 빠져나옴.

```{.swift}
if let test = str {     //optional unwrapped, optional binding
    //str이 nil이 아닐 경우
}else{
	//str이 nil일 경우
}
```

##case4. compile auto unwrapping
* 컴파일러가 옵셔널의 데이터를 판별하여 자동적으로 unwrapping하는 방식

```{.swift}
let optInt:Int? = Int("123")
if optInt == 123 {	//optInt ==> 123 (o) / Optional(123) (x)
    print("optInt == 123")
}else{
	print("optInt != 123")
}
```

##case5. Double Question
* 삼항연산자의 응용문법
* optional타입의 nil값에 대한 초기화 조건식

```{.swift}
let str2:String? = "test"
let test = str2 ?? "empty"   // str2 != nil ? str2! : “empty”   ==> test = "test"
```

##Double Question Example
```{.swift}
let str11:String? = "test"
let test11 = str11 ?? "empty" // => “test”

let str22:String? = nil
let test22 = str22 ?? "empty" // => “empty”
```