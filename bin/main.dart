/* This is a simple game that consist in guess the number that you or
Akinumerator is thinking about.
 */

// Necessary imports to make the game, dart:io to input/output section and 
// dart:math to generate random numbers.

import 'dart:io';
import 'dart:math';

// Variables used in the game.

var option;
// var pressAKey = null;
var randomNumber = Random();
var akinumeratorNumber;
var userNumber;
var greaterSmaller;
var tries = 1;
final maxGuessValue = 100;

// Main class

void main(List<String> arguments) {
  do {
    menu();
  } while (option != 'G' && option != 'T');
  {
    switch (option) {
      case 'G':
        print('********************* - GUESS OPTION - *********************');
        break;
      case 'T':
        akinumeratorNumber = randomNumber.nextInt(maxGuessValue + 1);
        print('********************* - THINK OPTION - *********************');
        print("Think in a number between 0 and 100 and don't tell to anybody"
            '...');
        stdout.write("Then type your number and I'll try to guess it"
            '... ');
        userNumber = stdin.readLineSync();
        while (userNumber != akinumeratorNumber.toString()) {
          print('My guessed number is the ${akinumeratorNumber}');
          do {
            greaterSmallerMenu();
            switch (greaterSmaller) {
              case 'G':
                print('User number is greater');

                // We don’t have any other function to find random numbers
                // between two numbers. random method returns one random value
                // between 0 and the argument value we pass to this method.
                // So, to find random numbers between two numbers say min and
                // max, we can pass max – min as the parameter to this method
                // and add min to that result.
                //
                //This will always give one random value between min and max.

                akinumeratorNumber = ((akinumeratorNumber + 1) + randomNumber
                    .nextInt
                  ((maxGuessValue + 1) - (akinumeratorNumber + 1)));
                tries = tries + 1;
                break;
              case 'S':
                print('User number is smaller');

                //We don’t have any other function to find random numbers
                // between two numbers. random method returns one random value
                // between 0 and the argument value we pass to this method.
                // So, to find random numbers between two numbers say min and
                // max, we can pass max – min as the parameter to this method
                // and add min to that result.
                //
                //This will always give one random value between min and max.

                akinumeratorNumber =
                (int.parse(userNumber) + randomNumber.nextInt
                  (akinumeratorNumber - int.parse(userNumber)));
                tries = tries + 1;
                break;
            }
            break;
          }
          while (greaterSmaller != 'G' && greaterSmaller != 'S');
        }
        print('');
        print('My guessed number is the ${akinumeratorNumber}');
        print('Yeeeeahhhh..! I guessed your number in ${tries} try/tries!');
    }
  }

}

// Function menu for calling the game menu

void menu() {

  print('************************************************************');
  print('*************** - Welcome to Akinumerator! - ***************');
  print('*** Do you want to (G)uess a number or (T)hink a number? ***');
  stdout.writeln('****************** Select an option G/T: '
      '*******************');
  print('************************************************************ \n');
  print('');

  // Reading the user's option.

  option = stdin.readLineSync();

}

// Greater or smaller option menu.

void greaterSmallerMenu() {

  stdout.write('Is it your number (G)reeter or (S)maller than mine? ');
  greaterSmaller = stdin.readLineSync();
}


//akinumeratorNumber = randomNumber.nextInt(101);
//print(akinumeratorNumber);
/*print(userNumber);
        print(akinumeratorNumber);
        while (userNumber != akinumeratorNumber) {
          print('My guessed number is the ${akinumeratorNumber}');
          do {
            stdout.write("It's yours (G)reeter or (S)maller than mine?");
            greaterSmaller = stdin.readLineSync();
          }
          while (greaterSmaller != 'G' && greaterSmaller != 'S');
          break;

        }


        break;*/


/*if (userNumber == akinumeratorNumber.toString()) {
print('Yeeeeahhhh I guessed the number in ${tries + 1} tries!');
else {

}*/