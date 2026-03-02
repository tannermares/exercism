const ONES = [
  'zero',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
]

const SPECIALS = {
  10: 'ten',
  11: 'eleven',
  12: 'twelve',
  13: 'thirteen',
  14: 'fourteen',
  15: 'fifteen',
  16: 'sixteen',
  17: 'seventeen',
  18: 'eighteen',
  19: 'nineteen',
}

const TENS = [
  null,
  null,
  'twenty',
  'thirty',
  'forty',
  'fifty',
  'sixty',
  'seventy',
  'eighty',
  'ninety'
]

const PLACES = [
  null,
  'thousand',
  'million',
  'billion',
  'trillion'
]

export const say = (number) => {
  if(number < 0 || number >= 1000000000000) throw "Number must be between 0 and 999,999,999,999."
  if(number === 0) return "zero"

  const chunked = numberChunker(number)
  const words = []

  return chunked
    .map(stringyChunk)
    .map(addPlaces)
    .reverse()
    .filter(n => n.length !== 0)
    .join(' ')
};

// 1234567 -> [[5,6,7], [2,3,4], [1]]
// 1 -> [[1]]
function numberChunker(number) {
  let chunks = []
  let chunk = []
  let num = number
  
  while(num >= 1) {
    chunk.push(num % 10)
    num = Math.floor(num / 10)

    if (chunk.length === 3) {
      chunks.push([...chunk])
      chunk = []
    }
  }

  if(chunk.length > 0) {
    chunks.push([...chunk])
  }

  return chunks
}

// 234 -> [4, 3, 2]
// 14 -> [4, 1]
function stringyChunk([ones, tens, hundreds]) {
  let words = []
  let tns = []

  if(hundreds) {
    words.push(`${ONES[hundreds]} hundred`)
  }
  
  if(tens === 1) {
    words.push(SPECIALS[`${tens}${ones}`])
  }

  if(tens > 1) {
    tns.push(TENS[tens])
  }

  if(tens !== 1 && ones !== 0) {
    tns.push(ONES[ones])
  }
 
  if(tns.length > 0) {
    words.push(tns.join('-'))  
  }
  
  return words.join(' ')
}

function addPlaces(sc, index) {
  let places = [sc, PLACES[index]].filter(n => !!n).join(' ')
  return sc ? places : ''
}
