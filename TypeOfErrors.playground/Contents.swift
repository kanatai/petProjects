import UIKit

//Type of errors

//1. Syntax error
//2. Runtime error
//3. Logic error

//Syntax error - mean is wrong write code

func calculateAPR(balance: Double) -> Double {
    //Calculate APR
    return 10.0
}

calculate(balance: "5000.0") //This is syntax error

//Runtime error - mean absent key or optinal instance (var/let)
let airports = ["IAH": "Internation Airport",
                "JFK": "John F. Kennedy Internation Airport",
                "SEA": "Seattle-Tacoma Internation Airport"]

let name = airports["HOBBY"]! //This is runtime error, becouse there is absent key HOBBY

//Logic error - mean is problem developer who can't write a rite logic code actually in sum
