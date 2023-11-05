pragma circom 2.0.3;

template Main() {
  //private 
  signal input x; 
  signal x_squared;
  signal x_cubed;
  signal output out;

  x_squared <-- x * x;
  x_cubed <-- x_squared * x;
  out <-- x_cubed - x + 7;

  x_squared === x * x;
  x_cubed === x_squared * x;
  out === x_cubed - x + 7;
}

component main = Main();


// calculating x_cubed - x + 7

// Circom serves 2 priamry purposes:
//1) lets you dfine a set of constraints that you implcitly saying is equivalent to some function.
//2) define at proving-time, how you should fill in the nodes of your Artihemtic circuit - intermediate variables. (witness generation).

//On witness generation
//You know some x that results in some public out, such that f(x) = y. (y = out)
// for convenience, circom allows you to generate the intermediate witnesses, as opposed to having the user to supply them.
// this is done with the `<--` notation

// constraints are done with `===` notation

