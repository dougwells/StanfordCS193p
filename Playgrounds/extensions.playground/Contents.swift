//Extensions - gives ability to "extend" existing classes (add methods)

extension Double {
    var km: Double {return self/1000}
    var cm: Double {return self/100}
}

var millimeter = 1.km
