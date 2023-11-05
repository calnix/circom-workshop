pragma circom 2.0.3;

template Main() {
  signal input x1;
  signal input x2;
  signal input x3;
  signal input x4;

  signal y1;
  signal y2;

  signal output out;

//witness generation
  y1 <-- x1 + x2;
  y2 <-- y1 / x3;
  out <-- y2 - x4;

// constraints can only have quadratic expressions
// can only use + or *
  y1 === x1 + x2;
  y1 === y2 * x3;
  out === y2 - x4;
}

component main { public [ x2 ] } = Main();


// what are these signals? 
 there are not bits. they are prime field elements.
 modulo p, where p is the babyjubjub prime.

// eq:  f(x) = (x1 + x2)/ x3  - x4
// Intermediate Rep:
//                  y1 / x3   - x4
//                  y2 - x4

//inputs: x1,..x4
//intermediate: y1, y2

// Notice that in this example we cannot simply use `<===` to combine out witness generation and constraint definition.
// the reason we have to seperate is cos' of the `y2 <-- y1 / x3;` 

// In witness generation you are allowed to use arbitrary operations like division.
// In defining constraints, we can only use quadratic expressions. 
//    so instead of `y2 <-- y1 / x3;`  >>> it becomes y1 === y2 * x3;

// the following would be a valid circuit:
  y1 <== x1 + x2;

  y2 <-- y1 / x3;
  y1 === y2 * x3;

  out <== y2 - x4;




