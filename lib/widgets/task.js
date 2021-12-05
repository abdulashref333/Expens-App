// first conditioin section.
function checkFirstCondition(input) {
  const inputArray = input.split("");
  let flag = 0;

  for (let index = 0; index < inputArray.length; index++) {
    const element = inputArray[index];

    if (element === "1" || element === "0") {
      flag += element === "1" ? 1 : -1;
    }
  }

  if (flag === 0 || flag === 1 || flag === -1) {
    return true;
  }
  return false;
}
// second conditon sectoin
function checkSecondCondition(input) {
  const inputArray = input.split("");
  inputArray[inputArray.length] =
    inputArray[inputArray.length - 1] === "1" ? "0" : "1";

  const runsLength = [];
  let runsCount = 0;
  let firstElement = inputArray[0];
  let firstIndex = 0;

  for (let index = 1; index < inputArray.length; index++) {
    const element = inputArray[index];
    if (element !== firstElement) {
      runsCount++;
      firstElement = element;
      let lenrun = index - firstIndex;
      firstIndex = index;
      if (!runsLength[lenrun]) runsLength[lenrun] = 0;
      runsLength[lenrun] += 1;
    }
  }

  let doniminator = 2;
  let power = 1;
  for (let i = 1; runsCount / Math.pow(doniminator, i) >= 0.5; i++) {
    if (!runsLength[i]) {
      continue;
    }

    if (
      runsLength[i] !== Math.round(runsCount / Math.pow(doniminator, power))
    ) {
      return false;
    }

    power++;
  }

  return true;
}

// third condition section.
function shifting(input) {
  const arr = input.split("");
  arr.push(arr.shift());
  return arr;
}
function checkThirdCondition(input) {
  let noOfShift = input.length;
  const shiftedMatrix = [];
  const results = [];
  shiftedMatrix[0] = input.split("");

  for (let i = 1; i < noOfShift; i++) {
    shiftedMatrix[i] = shifting(shiftedMatrix[i - 1].join(""));
    results[i] = (
      parseInt(shiftedMatrix[i].join(""), 2) ^
      parseInt(shiftedMatrix[0].join(""), 2)
    )
      .toString(2)
      .split("")
      .filter((v) => v === "1").length; // xor two strings and get the result.

    if (results[i] !== results[i - 1] && i - 1 !== 0) return false;
  }
  return true;
}
// example;
let defaultInput = "0001011";
console.log(`this is an example when the key = ${defaultInput}`);
console.log(
  "The Validation of the Key is : ",
  checkFirstCondition(defaultInput) &&
    checkSecondCondition(defaultInput) &&
    checkThirdCondition(defaultInput)
);
console.log("Another example");
defaultInput = "00010111";
console.log(`this is an example when the key = ${defaultInput}`);
console.log(
  "The Validation of the Key is : ",
  checkFirstCondition(defaultInput) &&
    checkSecondCondition(defaultInput) &&
    checkThirdCondition(defaultInput)
);
