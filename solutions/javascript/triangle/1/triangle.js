export class Triangle {
  constructor(a, b, c) {
    this.a = a;
    this.b = b;
    this.c = c;
  }

  get isValid() {
    return this.a + this.b > this.c && this.a + this.c > this.b && this.b + this.c > this.a;
  }

  get sideA() {
    return this.a;
  }

  get sideB() {
    return this.b;
  }

  get sideC() {
    return this.c;
  }

  get isEquilateral() {
    return this.isValid && this.a === this.b && this.b === this.c && this.a !== 0;
  }

  get isIsosceles() {
    return this.isValid && (this.a === this.b || this.a === this.c || this.b === this.c);
  }

  get isScalene() {
    return this.isValid && !this.isEquilateral && !this.isIsosceles;
  }
}
