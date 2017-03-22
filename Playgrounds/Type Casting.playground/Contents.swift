//: Playground - noun: a place where people can play

import UIKit

class Book {
    var title: String
    init(title: String) {
        self.title = title
    }
}

class Fiction: Book {
    var author: String
    init(title: String, author: String) {
        self.author = author
        super.init(title: title)
    }
}

class NonFiction: Book {
    var publishedBy: String
    init(title: String, publishedBy: String) {
        self.publishedBy = publishedBy
        super.init(title: title)
    }
}

let bookLibrary = [
    Fiction(title: "Moby Dick", author: "Herman Melville"),
    NonFiction(title: "The Wright Brothers", publishedBy: "Simon & Schuster"),
    Fiction(title: "Hamlet", author: "William Shakespeare"),
    NonFiction(title: "Walden", publishedBy: "Henry David Thoreau"),
    NonFiction(title: "Quantum Healing", publishedBy: "Random House")
]

var fictionCount = 0
var nonFictionCount = 0

for book in bookLibrary {
    
    //Check Type using "is" keyword
    if book is Fiction {fictionCount += 1}
    if book is NonFiction {nonFictionCount += 1}
    
    //Downcast each book from its superclass (Book) to its true type
    if let fiction = book as? Fiction {print("Fiction. Title = \(fiction.title)")}
    if let nonFiction = book as? NonFiction {print("NonFiction. Title = \(nonFiction.title)")}
}

fictionCount
nonFictionCount
