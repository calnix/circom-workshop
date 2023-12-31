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

// # Compilation
// compiling the circuit gives us an R1CS file, that can be used with different toolstacks, that implement the Groth16 protocol.
// think of it as a IR representation; like your compiled bytecode.

// .wasm file
// a wasm exceutable program that implements the single arrow stuff - witness generation.
// witness generation program that allows derivation of the intermediate signals (x_squared, x_cubed) just from the single input, x.

// .vkey: verification key
// goes into your smart contract for verification. 
// a .sol file is also created, whjich is a contract based on the vk that serves as the verification component. 
// .sol file would expose a `verifyProof` function

// .zkey: proving key
// goes into your client, Dapp FE