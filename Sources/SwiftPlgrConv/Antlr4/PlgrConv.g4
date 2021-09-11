grammar PlgrConv;

options {
    accessLevel = 'internal';
}

letters: letter*;

letter: alphabet
      | punctuation
      | whitespace
      | otherwise
      ;

alphabet: nonFinalSigma
        | largeNasableGamma
        | smallNasableGamma
        | singleAlphabet
        ;

largeNasableGamma: LARGE_NU LARGE_GAMMA # largeNasableGammaGamma
                 | LARGE_NU LARGE_KAPPA # largeNasableGammaKappa
                 | LARGE_NU LARGE_XI # largeNasableGammaXi
                 ;

smallNasableGamma: SMALL_NU SMALL_GAMMA # smallNasableGammaGamma
                 | SMALL_NU SMALL_KAPPA # smallNasableGammaKappa
                 | SMALL_NU SMALL_XI # smallNasableGammaXi
                 ;

nonFinalSigma: 's' alphabet ;

singleAlphabet: LARGE_ALPHA # largeAlpha
        | LARGE_EPSILON # largeEpsilon
        | LARGE_ETA # largeEta
        | LARGE_IOTA # largeIota
        | LARGE_OMICRON # largeOmicron
        | LARGE_UPSILON # largeUpsilon
        | LARGE_OMEGA # largeOmega
        | LARGE_BETA # largeBeta
        | LARGE_GAMMA # largeGamma
        | LARGE_DELTA # largeDelta
        | LARGE_ZETA # largeZeta
        | LARGE_KAPPA # largeKappa
        | LARGE_LAMBDA # largeLambda
        | LARGE_MU # largeMu
        | LARGE_NU # largeNu
        | LARGE_XI # largeXi
        | LARGE_PI # largePi
        | LARGE_RHO # largeRho
        | LARGE_SIGMA # largeSigma
        | LARGE_TAU # largeTau
        | SMALL_ALPHA # smallAlpha
        | SMALL_EPSILON # smallEpsilon
        | SMALL_ETA # smallEta
        | SMALL_IOTA # smallIota
        | SMALL_OMICRON # smallOmicron
        | SMALL_UPSILON # smallUpsilon
        | SMALL_OMEGA # smallOmega
        | SMALL_BETA # smallBeta
        | SMALL_GAMMA # smallGamma
        | SMALL_DELTA # smallDelta
        | SMALL_ZETA # smallZeta
        | SMALL_KAPPA # smallKappa
        | SMALL_LAMBDA # smallLambda
        | SMALL_MU # smallMu
        | SMALL_NU # smallNu
        | SMALL_XI # smallXi
        | SMALL_PI # smallPi
        | SMALL_RHO # smallRho
        | SMALL_SIGMA # smallSigma
        | SMALL_TAU # smallTau
        ;

punctuation: COMMA # comma
           | SEMICORON # semicoron
           | PERIOD # period
           | QUESTION # question
           | APOSTROPH # apostroph
           | LGUILLEMET # lguillemet
           | RGUILLEMET # rguillemet
           | EMDASH # emdash
           ;

whitespace: SPACE # space
          | NEWLINE # newline
          ;

otherwise: ANYCHAR # anychar ;

LARGE_ALPHA: [<>]? ['`~]? 'A' '|'? ;
LARGE_EPSILON: [<>]? ['`]? 'E' ;
LARGE_ETA: [<>]? ['`~]? '^E' '|'? ;
LARGE_IOTA: ["<>]? ['`~]? 'I' ;
LARGE_OMICRON: [<>]? ['`]? 'O' ;
LARGE_UPSILON: ["<>]? ['`~]? [UY] ;
LARGE_OMEGA: [<>]? ['`~]? '^O' '|'? ;

LARGE_BETA: 'B' ;
LARGE_GAMMA: 'G' ;
LARGE_DELTA: 'D' ;
LARGE_ZETA: 'Z' ;
LARGE_KAPPA: 'K' 'h'? ;
LARGE_LAMBDA: 'L' ;
LARGE_MU: 'M' ;
LARGE_NU: 'N' ;
LARGE_XI: 'X' ;
LARGE_PI: 'P' [hs]? ;
LARGE_RHO: '<'? 'R' ;
LARGE_SIGMA: 'S' ;
LARGE_TAU: 'T' 'h'? ;

SMALL_ALPHA: [<>]? ['`~]? 'a' '|'? ;
SMALL_EPSILON: [<>]? ['`]? 'e' ;
SMALL_ETA: [<>]? ['`~]? '^e' '|'? ;
SMALL_IOTA: ["<>]? ['`~]? 'i' ;
SMALL_OMICRON: [<>]? ['`]? 'o' ;
SMALL_UPSILON: ["<>]? ['`~]? [uy] ;
SMALL_OMEGA: [<>]? ['`~]? '^o' '|'? ;

SMALL_BETA: 'b' ;
SMALL_GAMMA: 'g' ;
SMALL_DELTA: 'd' ;
SMALL_ZETA: 'z' ;
SMALL_KAPPA: 'k' 'h'? ;
SMALL_LAMBDA: 'l' ;
SMALL_MU: 'm' ;
SMALL_NU: 'n' ;
SMALL_XI: 'x' ;
SMALL_PI: 'p' [hs]? ;
SMALL_RHO: [<>]? 'r' ;
SMALL_SIGMA: [cs] ;
SMALL_TAU: 't' 'h'? ;

COMMA: ',' ;
SEMICORON: ';' ;
PERIOD: '.' ;
QUESTION: '?' ;
APOSTROPH: '\'\'' ;
LGUILLEMET: '<<' ;
RGUILLEMET: '>>' ;
EMDASH: '--' ;

SPACE: ' '+ ;
NEWLINE: '\r'? '\n' ;

ANYCHAR: . ;
