pragma circom  2.0.3;

include "https://github.com/iden3/circomlib/blob/master/circuits/mimcsponge.circom"

template PubKeyGen(){
    // private key 
    signal input sk_in;
    
    //public key
    signal output pk_out;

    //computes pk_out from sk_in
}


template GroupSig (){
    // private key
    signal input sk;

    //public keys
    signal input pk1;
    signal input pk2;
    signal input pk3;

    // has one input signal, and one output signal
    component pkGen = MiMCSponge(1, 220, 1);
    pkGen.sk_in <== sk;

    signal pk;
    pk <== pkGen.pk_out;

    // if pk generated matches 1 of the public key, will be 0
    //(pk - pk1) * (pk - pk2) * (pk - pk3) === 0; <- this is not qudratic, so split it up
    interm <== (pk - pk1) * (pk - pk2)
    interm * (pk - pk3) === 0;
    
} 

// pk1, pk2, pk3 are public inputs
component main { public [pk1, pk2 pk3] } = GroupSig();



/* INPUT = {
    "sk":,
    "pk1":,
    "pk2":,
    "pk3":
} */

template Num2Bits(nBits){
    signal input x;
    
    // array of length: nBits
    signal output b[nBits];

    for (var i = 0; i < nBits; i++) {
        b[i] <-- x \ (2 ** i) % 2;
    }

}