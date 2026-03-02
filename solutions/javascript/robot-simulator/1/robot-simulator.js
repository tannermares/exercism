export class InvalidInputError extends Error {
  constructor(message) {
    super();
    this.message = message || 'Invalid Input';
  }
}

class Bearing {
  BEARINGS = ['north', 'east', 'south', 'west']
  
  constructor(bearing) {
    if(this.BEARINGS.includes(bearing)) {
      this._bearing = bearing
    } else {
      throw new InvalidInputError('Invalid set bearing')
    }
  }

  toString() {
    return this._bearing
  }

  advance() {
    switch(this._bearing) {
      case 'north':
        return [0, 1]
      case 'south':
        return [0, -1]
      case 'east':
        return [1, 0]
      case 'west':
        return [-1, 0]
      default:
        throw new InvalidInputError('Invalid advance bearing')
    }
  }

  turnRight() {    
    switch(this._bearing) {
      case 'north':
        this._bearing = 'east'
        break;
      case 'south':
        this._bearing = 'west'
        break;
      case 'east':
        this._bearing = 'south'
        break;
      case 'west':
        this._bearing = 'north'
        break;
      default:
        throw new InvalidInputError('Invalid turnRight bearing')
    }
  }

  turnLeft() {    
    switch(this._bearing) {
      case 'north':
        this._bearing = 'west'
        break;
      case 'south':
        this._bearing = 'east'
        break;
      case 'east':
        this._bearing = 'north'
        break;
      case 'west':
        this._bearing = 'south'
        break;
      default:
        throw new InvalidInputError('Invalid turnLeft bearing')
    }
  }
}

export class Robot {  
  constructor() {
    this.bearing = 'north'
    this.coordinates = [0, 0]
  }
  
  get bearing() {
    return this._bearing.toString()
  }

  set bearing(bearing) {
    this._bearing = new Bearing(bearing)
  }
  
  get coordinates() {
    return this._coordinates
  }

  set coordinates(coordinates) {
    this._coordinates = coordinates
  }

  place({ x, y, direction }) {
    this.bearing = direction
    this.coordinates = [x, y]
  }

  evaluate(instructions) {
    const steps = instructions.split('')
    
    steps.forEach(step => {
      switch(step) {
        case 'R':
          this._bearing.turnRight()
          break;
        case 'L':
          this._bearing.turnLeft()
          break;
        case 'A':
          const [newX, newY] = this._bearing.advance();
          this.coordinates = [this.coordinates[0] + newX, this.coordinates[1] + newY]
          break;
        default:
          throw new InvalidInputError('Invalid Instruction')
      }
    })
  }
}
