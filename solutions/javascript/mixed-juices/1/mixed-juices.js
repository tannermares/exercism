// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.
const DEFAULT_TIME = 2.5
const JUICES = {
  'All or Nothing': 5,
  'Energizer': 1.5,
  'Green Garden': 1.5,
  'Pure Strawberry Joy': 0.5,
  'Tropical Island': 3
}
JUICES.default = DEFAULT_TIME

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  return JUICES[name] || JUICES.default
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
const LIMESES = {
  small: 6,
  medium: 8,
  large: 10
}

export function limesToCut(wedgesNeeded, limes) {
  let currentWedges = 0
  let numberOfLimes = 0

  while(currentWedges < wedgesNeeded) {
    const lime = limes[numberOfLimes]
    if(!lime) break
    
    currentWedges += LIMESES[lime]  
    numberOfLimes++
  }

  return numberOfLimes
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  let remainingOrders = [...orders].reverse()
  let remainingTime = timeLeft
  
  do {
    const currentOrder = remainingOrders.pop()
    remainingTime -= timeToMixJuice(currentOrder)
  } while(remainingTime > 0)

  return remainingOrders.reverse()
}
