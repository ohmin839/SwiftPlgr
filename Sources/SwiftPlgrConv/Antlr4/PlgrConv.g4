grammar PlgrConv;

options {
    accessLevel = 'internal';
}

letters: letter*;

letter: alphabet;

alphabet: SMALL_ALPHA # smallAlpha
        | SMALL_EPSILON # smallEpsilon
        | SMALL_ETA # smallEta
        | SMALL_IOTA # smallIota
        | SMALL_OMICRON # smallOmicron
        | SMALL_UPSILON # smallUpsilon
        | SMALL_OMEGA # smallOmega
        ;

SMALL_ALPHA: [<>]? ['`~]? 'a' '|'? ;
SMALL_EPSILON: [<>]? ['`]? 'e' ;
SMALL_ETA: [<>]? ['`~]? '^e' '|'? ;
SMALL_IOTA: ["<>]? ['`~]? 'i' ;
SMALL_OMICRON: [<>]? ['`]? 'o' ;
SMALL_UPSILON: ["<>]? ['`~]? [uy] ;
SMALL_OMEGA: [<>]? ['`~]? '^o' '|'? ;
