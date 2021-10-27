// Copyright (C) 2020-2021  The SymbiFlow Authors.
//
// Use of this source code is governed by a ISC-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/ISC
//
// SPDX-License-Identifier:ISC

// Basic DFF

module \$_DFF_P_ (D, C, Q);
    input D;
    input C;
    output Q;
    //parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //dff _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C));
    dffsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(1'b1), .R(1'b1), .S(1'b1));
endmodule

// Async reset
module \$_DFF_PP0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    //parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //dffr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R));
    dffsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(1'b1), .R(!R), .S(1'b1));
endmodule

// Async set
module \$_DFF_PP1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    //dffs _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R));
    dffsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(1'b1), .R(1'b1), .S(!R));
endmodule

// Async reset, enable

module  \$_DFFE_PP0P_ (D, C, E, R, Q);
    input D;
    input C;
    input E;
    input R;
    output Q;
    //parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //dffre  _TECHMAP_REPLACE_ (.D(D), .Q(Q), .C(C), .E(E), .R(R));
    dffsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E), .R(!R), .S(1'b1));
endmodule

// Async set, enable

module  \$_DFFE_PP1P_ (D, C, E, R, Q);
    input D;
    input C;
    input E;
    input R;
    output Q;
    //parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //dffse  _TECHMAP_REPLACE_ (.D(D), .Q(Q), .C(C), .E(E), .S(S));
    dffsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E), .R(1'b1), .S(!R));
endmodule

// Async set & reset

module \$_DFFSR_PPP_ (D, C, R, S, Q);
    input D;
    input C;
    input R;
    input S;
    output Q;
    //dffsr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .S(S));
    dffsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(1'b1), .R(!R), .S(!S));
endmodule

// Async set, reset & enable

module \$_DFFSRE_PPPP_ (D, Q, C, E, R, S);
    input D;
    input C;
    input E;
    input R;
    input S;
    output Q;
    //dffsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E), .R(R), .S(S));
    dffsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E), .R(!R), .S(!S));
endmodule

// Latch with async set and reset
module  \$_DLATCHSR_PPP_ (input E, S, R, D, output Q);
    //parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //latchsre _TECHMAP_REPLACE_ (.D(D), .Q(Q), .E(1'b1), .G(E),  .R(R), .S(S));
    latchsre _TECHMAP_REPLACE_ (.D(D), .Q(Q), .E(1'b1), .G(E),  .R(!R), .S(!S));
endmodule

module  \$_DLATCHSR_NPP_ (input E, S, R, D, output Q);
    //parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //latchsre _TECHMAP_REPLACE_ (.D(D), .Q(Q), .E(1'b1), .G(E),  .R(R), .S(S));
    latchnsre _TECHMAP_REPLACE_ (.D(D), .Q(Q), .E(1'b1), .G(E),  .R(!R), .S(!S));
endmodule

// The following techmap operation are not performed right now
// as Negative edge FF are not legalized in synth_quicklogic for qlf_k6n10
// but in case we implement clock inversion in the future, the support is ready for it.

module \$_DFF_N_ (D, C, Q);
    input D;
    input C;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //dff #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C));
    dffnsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(1'b1), .R(1'b1), .S(1'b1));
endmodule

module \$_DFF_NP0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //dffr #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R));
    dffnsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(1'b1), .R(!R), .S(1'b1));
endmodule

module \$_DFF_NP1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    //dffs #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R));
    dffnsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(1'b1), .R(1'b1), .S(!R));
endmodule

module  \$_DFFE_NP0P_ (D, C, E, R, Q);
    input D;
    input C;
    input E;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //dffre #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.D(D), .Q(Q), .C(C), .E(E), .R(R));
    dffnsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E), .R(!R), .S(1'b1));
endmodule

module  \$_DFFE_NP1P_ (D, C, E, R, Q);
    input D;
    input C;
    input E;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    //dffse #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.D(D), .Q(Q), .C(C), .E(E), .S(S));
    dffnsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E), .R(1'b1), .S(!R));
endmodule

module \$_DFFSR_NPP_ (D, C, R, S, Q);
    input D;
    input C;
    input R;
    input S;
    output Q;
    //dffsr #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .S(S));
    dffnsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(1'b1), .R(!R), .S(!S));
endmodule

module \$_DFFSRE_PPPP_ (D, C, E, R, S, Q);
    input D;
    input C;
    input E;
    input R;
    input S;
    output Q;
    //dffsre #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E), .R(R), .S(S));
    dffnsre _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E), .R(!R), .S(!S));
endmodule

module \$__SHREG_DFF_P_ (D, Q, C);
    input D;
    input C;
    output Q;

    parameter DEPTH = 2;
    reg [DEPTH-2:0] q;
    genvar i;
    generate for (i = 0; i < DEPTH; i = i + 1) begin: slice


        // First in chain
        generate if (i == 0) begin
                 sh_dff #() shreg_beg (
                    .Q(q[i]),
                    .D(D),
                    .C(C)
                );
        end endgenerate
        // Middle in chain
        generate if (i > 0 && i != DEPTH-1) begin
                 sh_dff #() shreg_mid (
                    .Q(q[i]),
                    .D(q[i-1]),
                    .C(C)
                );
        end endgenerate
        // Last in chain
        generate if (i == DEPTH-1) begin
                 sh_dff #() shreg_end (
                    .Q(Q),
                    .D(q[i-1]),
                    .C(C)
                );
        end endgenerate
   end: slice
   endgenerate

endmodule

