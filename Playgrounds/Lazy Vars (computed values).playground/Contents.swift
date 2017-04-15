//Lazy variables are not calculated until they are used.

//Lazy - must be var (NO let)
//Must declare value type (since calculated)

func fibonacci(of num: Int) -> Int {
    if num < 2 {
        return num
    } else {
    return fibonacci(of: num - 1) + fibonacci(of: num - 2)
    }
}

fibonacci(of: 16)

func sumOfDigits(_ num: Int) -> Int {
    if num < 2 {return 1}
    return (num + sumOfDigits(num-1))
}

sumOfDigits(5)

struct Person {
    var age = 16
    lazy var fibOfAge: Int = {
        return fibonacci(of: self.age)
    }()
    lazy var SOD: Int = {
       return sumOfDigits(self.age)
    }()
}

var singer = Person()
print("Singer age = \(singer.age)")
print("Sum of Digits age = \(singer.SOD)")
print("Fibonacci age = \(singer.fibOfAge)")


