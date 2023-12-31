pragma circom 2.0.3;

include "../node_modules/circomlib/circuits/mimcsponge.circom";

template Main() {
  signal input x;
  // signal input hash;

  signal output out;

  component mimc = MiMCSponge(1, 220, 1);
  mimc.ins[0] <== x;
  mimc.k <== 0;

  out <== mimc.outs[0];

  // out === hash;
}

component main = Main();

// include for importing
// be it dir or direct from github
// allows re-use of circuits to build larger circuits


// hardhat-circom
// will test the 

