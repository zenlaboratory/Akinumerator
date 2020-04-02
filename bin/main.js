
define(['dart_sdk'], function(dart_sdk) {
  'use strict';
  const core = dart_sdk.core;
  const math = dart_sdk.math;
  const io = dart_sdk.io;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const main = Object.create(dart.library);
  const $toString = dartx.toString;
  dart.defineLazy(main, {
    /*main.gameOption*/get gameOption() {
      return null;
    },
    set gameOption(_) {},
    /*main.randomNumber*/get randomNumber() {
      return math.Random.new();
    },
    set randomNumber(_) {},
    /*main.akinumeratorNumber*/get akinumeratorNumber() {
      return null;
    },
    set akinumeratorNumber(_) {},
    /*main.userNumber*/get userNumber() {
      return null;
    },
    set userNumber(_) {},
    /*main.greaterSmaller*/get greaterSmaller() {
      return null;
    },
    set greaterSmaller(_) {},
    /*main.numberOfTries*/get numberOfTries() {
      return 1;
    },
    set numberOfTries(_) {},
    /*main.maxGuessValue*/get maxGuessValue() {
      return 100;
    }
  });
  main.main = function main$(arguments$) {
    do {
      main.menu();
    } while (!dart.equals(main.gameOption, "G") && !dart.equals(main.gameOption, "T"));
    {
      switch (main.gameOption) {
        case "G":
        {
          core.print("********************* - GUESS Option - *********************");
          break;
        }
        case "T":
        {
          main.akinumeratorNumber = main.randomNumber.nextInt(dart.notNull(main.maxGuessValue) + 1);
          core.print("********************* - THINK Option - *********************");
          core.print("Think in a number between 0 and 100 and don't tell to anybody" + "...");
          io.stdout.write("Then type your number and I'll try to guess it" + "... ");
          main.userNumber = io.stdin.readLineSync();
          while (!dart.equals(main.userNumber, dart.toString(main.akinumeratorNumber))) {
            core.print("My guessed number is the " + dart.str(main.akinumeratorNumber));
            do {
              main.greaterSmallerMenu();
              switch (main.greaterSmaller) {
                case "G":
                {
                  core.print("User number is greater");
                  main.akinumeratorNumber = dart.dsend(dart.dsend(main.akinumeratorNumber, '+', [1]), '+', [main.randomNumber.nextInt(dart.asInt(dart.notNull(main.maxGuessValue) + 1 - dart.notNull(core.num._check(dart.dsend(main.akinumeratorNumber, '+', [1])))))]);
                  main.numberOfTries = dart.notNull(main.numberOfTries) + 1;
                  break;
                }
                case "S":
                {
                  core.print("User number is smaller");
                  main.akinumeratorNumber = dart.notNull(core.int.parse(core.String._check(main.userNumber))) + dart.notNull(main.randomNumber.nextInt(core.int._check(dart.dsend(main.akinumeratorNumber, '-', [core.int.parse(core.String._check(main.userNumber))]))));
                  main.numberOfTries = dart.notNull(main.numberOfTries) + 1;
                  break;
                }
              }
              break;
            } while (!dart.equals(main.greaterSmaller, "G") && !dart.equals(main.greaterSmaller, "S"));
          }
          core.print("");
          core.print("My guessed number is the " + dart.str(main.akinumeratorNumber));
          core.print("Yeeeeahhhh..! I guessed your number in " + dart.str(main.numberOfTries) + " " + "try/tries!");
        }
      }
    }
  };
  main.menu = function menu() {
    core.print("************************************************************");
    core.print("*************** - Welcome to Akinumerator! - ***************");
    core.print("*** Do you want to (G)uess a number or (T)hink a number? ***");
    io.stdout.writeln("****************** Select an Option G/T: " + "*******************");
    core.print("************************************************************ \n");
    core.print("");
    main.gameOption = io.stdin.readLineSync();
  };
  main.greaterSmallerMenu = function greaterSmallerMenu() {
    io.stdout.write("Is it your number (G)reeter or (S)maller than mine? ");
    main.greaterSmaller = io.stdin.readLineSync();
  };
  dart.trackLibraries("main", {
    "main.dart": main
  }, {
  }, null);
  // Exports:
  return {
    main: main
  };
});

//# sourceMappingURL=main.js.map
