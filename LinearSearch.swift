//
// LinearSearch.swift
//
// Created by Santiago Hewett
// Created on 2025/03/22
// Version 1.0
// Copyright (c) 2025 Santiago Hewett. All rights reserved.
//
// This program creates 10 random numbers from 1 to 100,
// asks the user for a number, and shows its index if found.
//

// Import Foundation library
import Foundation

// Max array size constant
let MAX_ARRAY = 10

// User input as string
var userNumberString: String = ""

// User input as integer
var userNumber: Int = 0

// Array of random numbers
var arrayRandomInts: [Int] = []

// Loop until user enters 'q'
repeat {
   // Fill array with random numbers
   arrayRandomInts = populatingArray()

   // Sort the array
   arrayRandomInts.sort()

   // Ask the user for a number
   print("What number are you searching for in the list below? Enter 'q' to quit.")

   // Print the numbers in one line
   for index in 0 ..< MAX_ARRAY {
       print("\(arrayRandomInts[index]) ", terminator: "")
   }

   // Prompt for number
   print(" Number: ", terminator: "")

   // Get user input
   userNumberString = readLine()!

   // If input is 'q', exit
   if userNumberString.lowercased() == "q" {
       print("Goodbye!")
   } else {
       // Try converting input to integer
       guard let userNumber = Int(userNumberString) else {
           // Show error if conversion fails
           print("Invalid input \(userNumberString). Please enter a number.")
           continue
       }

       // Search for the number
       for index in 0 ..< MAX_ARRAY {
           // If number is found
           if arrayRandomInts[index] == userNumber {
               print("The number \(userNumber) was found as early as index \(index).")
               break
           }

           // If number not found after full loop
           if index == MAX_ARRAY - 1 && arrayRandomInts[index] != userNumber {
               print("The number \(userNumber) was not found in the list.")
           }
       }
   }

// Keep looping unless user enters 'q'
} while userNumberString != "q"

// Function to generate random numbers
func populatingArray() -> [Int] {
   // New array for random numbers
   var arrayRandomInts: [Int] = []

   // Add 10 random numbers (1 to 100)
   for _ in 0 ..< MAX_ARRAY {
       let randomInt = Int.random(in: 1...100)
       arrayRandomInts.append(randomInt)
   }

   // Return the array
   return arrayRandomInts
}
