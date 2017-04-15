//Enums - simply produces a number of limited, predefined cases

enum MovieSeat {
    case rock
    case bronze
    case silver
    case gold
    case platinum
}

var kathy = MovieSeat.bronze

switch kathy {
case .rock:
    print("You selected a rock hard seat.")
case .bronze:
    print("Hope you enjoy this modest seat")
case .silver:
    print("Congrats on upgrading to Silver")
case .gold:
    print("Welcome to gold")
case .platinum:
    print("Platinum - the best seat in the house")
}
