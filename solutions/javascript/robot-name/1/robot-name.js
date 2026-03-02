export class Robot {
  constructor() {
    Robot._usedNames ||= new Set()
    this.reset()
  }

  get name() {
    return this._name
  }

  set name(_name) {
    throw 'HEY YO CAN"T DO THAT'
  }

  static get usedNames() {
    return Robot._usedNames
  }

  static set usedNames(name) {
    Robot._usedNames.add(name)
  }

  reset() {
    let tempName = this.generateName()

    while (Robot.usedNames.has(tempName)) {
      tempName = this.generateName()
    }

    this._name = Robot.usedNames = tempName
  }

  generateName() {
    const randomNumberForLetter1 = this.getRandomIntInclusive(
      ...Robot.alphaCharCodes
    )
    const randomLetter1 = String.fromCharCode(randomNumberForLetter1)

    const randomNumberForLetter2 = this.getRandomIntInclusive(
      ...Robot.alphaCharCodes
    )
    const randomLetter2 = String.fromCharCode(randomNumberForLetter2)

    const randomNumber1 = this.getRandomIntInclusive(...Robot.numberCodes)
    const randomNumber2 = this.getRandomIntInclusive(...Robot.numberCodes)
    const randomNumber3 = this.getRandomIntInclusive(...Robot.numberCodes)

    return `${randomLetter1}${randomLetter2}${randomNumber1}${randomNumber2}${randomNumber3}`
  }

  getRandomIntInclusive(min, max) {
    min = Math.ceil(min)
    max = Math.floor(max)
    //The maximum is inclusive and the minimum is inclusive
    return Math.floor(Math.random() * (max - min + 1) + min)
  }

  static get alphaCharCodes() {
    return [65, 90]
  }

  static get numberCodes() {
    return [0, 9]
  }
}

Robot.releaseNames = () => {}
