//
// This is only a SKELETON file for the 'Minesweeper' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

function isAMine(matrix, y, x) {
  try {
    return matrix[y][x] === "*";
  } catch {
    return false;
  }
}

function solvedSquare(matrix, y, x) {
  let number = 0;
  if (matrix[y][x] === "*") return "*";

  if (isAMine(matrix, y, x - 1)) number++;
  if (isAMine(matrix, y, x + 1)) number++;
  if (isAMine(matrix, y - 1, x)) number++;
  if (isAMine(matrix, y - 1, x - 1)) number++;
  if (isAMine(matrix, y - 1, x + 1)) number++;
  if (isAMine(matrix, y + 1, x)) number++;
  if (isAMine(matrix, y + 1, x - 1)) number++;
  if (isAMine(matrix, y + 1, x + 1)) number++;

  return number === 0 ? " " : number;
}

export const annotate = (input) => {
  // Input Validator
  if (input.length === 0) return [];
  if (input[0] === "") return [""];

  const matrix = input.map((line) => {
    return line.split("");
  });

  return matrix.map((line, y) => {
    return line
      .map((_square, x) => {
        return solvedSquare(matrix, y, x);
      })
      .join("");
  });
};
