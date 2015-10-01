//
//  StartupMedia.swift
//  
//
//  Created by Matthew Kiernan on 9/29/15.
//
//

import Foundation


/*
•	Construct a function that requires two variables (of any type) as parameters and changes both of their values.    For the function body use a single line of code.
*/

func twoVariables<Z>(inout first: Z, inout _ second: Z){        //Set Generic type (assumes both parameters are
                                                                //                  of same type)
    (first,second) = (second,first)                             //Change values by swapping w/tuples
}                                                               //(Not sure if able to modify generics any other
                                                                // way)




/*
•	Construct a function called flexStrings that meets the following requirements:
•	The function can take precisely 0, 1 or 2 string parameters.
•	A string is returned including concatenated function parameters
•	The string ‘none’ is returned if no parameters are passed to the function.
*/

func flexStrings(first: String = "", second: String = "") -> String {       //Parameters w/ default values
    if(first + second == ""){                                               //(Will return 'none' if passed
        return "none"                                                       // 2 empty string parameters)
    } else {
        return first + second
    }
    
}

/********           ALTERNATE METHOD
func flexStrings(first: String = "none", second: String = "") -> String {       //Can be used GUARANTEED 'first' is set
        return first + second                                                   //and not 'second' when only 1 parameter
}
********/



/*
•	Construct a function called sumAny that can take 0 or more parameters of any type. The function should meet the following requirements.  The function will return the sum of the passed parameters as a String, following the rules below:
•	(1) If a parameter is an empty string or an Int equal to 0, add -10 to the result.
•	(2) If a parameter is an String that represents a positive number (e.g. “10”, not “-5”), add it to the result.
•	(3) If a parameter is an Int, add it to the result.
•	(4) In any other case, do not add it to the result.
*/

func sumAny(input: Any...) -> String{                   //Variadic Parameters
    return String ((input.map({values in
        switch values {
/*(1)*/ case "" as String, 0 as Int:
            return -10
/*(2)*/ case let stringValue as String where Int(stringValue) > 0:
            return Int(stringValue)!
/*(3)*/ case is Int:
            return values as! Int
/*(4)*/ default:
            return 0
        }
    }) as [Int]).reduce(0) {    //adds values together
        $0 + $1
        })
}




/*
•	Write a function countFrom(from:Int, #to:Int) that will produce as output (eg. via print() or println()) the numbers from from to to. You can’t use any loop operators, variables, nor any built-in Array functions. Assume the value of from is less than to (eg. the input is valid).
*/

func countFrom(from: Int, to: Int) {            //(error: '#' has been removed from Swift)
    print(from)                                 //recursive call
    if from < to {
        countFrom(from + 1, to: to)
    }
}
