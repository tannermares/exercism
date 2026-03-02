//
// This is only a SKELETON file for the 'Gigasecond' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

const GIGASECOND_MILLISECONDS = 1000000000000

export const gigasecond = (date) => {
  let unixTS = date.getTime()
  unixTS += GIGASECOND_MILLISECONDS
  const newDate = new Date(unixTS)
  return newDate
};
