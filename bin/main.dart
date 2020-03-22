/* This is a simple game that consist in guess the number that you or
Akinumerator is thinking about.
 */

// Necessary imports to make the game, dart:io to input/output section 
// and dart:math to generate random numbers.

import 'dart:io';
import 'dart:math';

// Variables used in the game.

var gameOption;
var randomNumber = Random();
var akinumeratorNumber;
var userNumber;
var greaterSmaller;
var numberOfTries = 1;
var maxGuessValue = 100;
var minGuessValue = 0;

// Main class.

void main(List<String> arguments) {
  do {
    mainMenu();
  } while (gameOption != 'G' && gameOption != 'T');
  {
    switch (gameOption) {
      case 'G':

        // TODO Guess game option.

        print('********************* - GUESS Option - *********************');
        break;
      case 'T':
        akinumeratorNumber = randomNumber.nextInt(maxGuessValue + 1);
        print('********************* - THINK Option - *********************');
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
                minGuessValue = akinumeratorNumber + 1;

                // We don’t have any other function to find random numbers
                // between two numbers. random method returns one random value
                // between 0 and the argument value we pass to this method.
                // So, to find random numbers between two numbers say min and
                // max, we can pass max – min as the parameter to this method
                // and add min to that result.
                //
                // This will always give one random value between min and max.

                akinumeratorNumber = minGuessValue +
                    randomNumber.nextInt((maxGuessValue + 1) - minGuessValue);
                numberOfTries = numberOfTries + 1;

                break;
              case 'S':
                print('User number is smaller');
                maxGuessValue = akinumeratorNumber;

                // We don’t have any other function to find random numbers
                // between two numbers. random method returns one random value
                // between 0 and the argument value we pass to this method.
                // So, to find random numbers between two numbers say min and
                // max, we can pass max – min as the parameter to this method
                // and add min to that result.
                //
                // This will always give one random value between min and max.

                akinumeratorNumber = minGuessValue +
                    randomNumber.nextInt(maxGuessValue - minGuessValue);
                numberOfTries = numberOfTries + 1;
                break;
            }
            break;
          } while (greaterSmaller != 'G' && greaterSmaller != 'S');
        }
        print('');
        print('My guessed number is the ${akinumeratorNumber}');
        print('Yeeeeahhhh..! I guessed your number in ${numberOfTries} '
            'try/tries!');
    }
  }
}

// Function menu for calling the game menu.

void mainMenu() {
  print('************************************************************');
  print('*************** - Welcome to Akinumerator! - ***************');
  print('*** Do you want to (G)uess a number or (T)hink a number? ***');
  stdout.writeln('****************** Select an Option G/T: '
      '*******************');
  print('************************************************************ \n');
  print('');

  // Reading the user's gameOption.

  gameOption = stdin.readLineSync();
}

// Greater or smaller gameOption menu.

void greaterSmallerMenu() {
  stdout.write('Is it your number (G)reeter or (S)maller than mine? ');
  greaterSmaller = stdin.readLineSync();
}

/* How to get a random number between min and max values.

  import 'dart:math';
  main(List<string> args) {
  final random = new Random();
  final min = 100;
  final max = 500;
  for (int i = 0; i < 10; i++) {
    print(min + random.nextInt(max - min));
  }
}

*/