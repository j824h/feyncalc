(* ::Package:: *)

(* :Title: Integrate2                                          *)

(*
	This software is covered by the GNU Lesser General Public License 3.
	Copyright (C) 1990-2015 Rolf Mertig
	Copyright (C) 1997-2015 Frederik Orellana
	Copyright (C) 2014-2015 Vladyslav Shtabovenko
*)

(* :Summary:  Computation of the moments of \\hat{A}_qq^NS,PHYS from
			hep-ph/9801224												 *)

(* ------------------------------------------------------------------------ *)


(* ::Section:: *)
(*Load FeynCalc*)


If[ $FrontEnd === Null,
		$FeynCalcStartupMessages = False;
		Print["Computation of the moments of \\hat{A}_qq^NS,PHYS from hep-ph/9801224"];
];
If[$Notebooks === False, $FeynCalcStartupMessages = False];
<<FeynCalc`


(* ::Section:: *)
(*A moment integral*)


(* This section shows how to calculate the moments of Subsuperscript[Overscript[A, ^], qq, NS,PHYS] from hep-ph/9801224.
Notice that due to current conservation the first moment of Subsuperscript[Overscript[A, ^], qq, NS,PHYS]should vanish. *)


(* First e is defined to be \[CurlyEpsilon]: *)


e = Epsilon;


(* Next, FORM output from the file "jqq12.log" is translated to FeynCalc syntax.
The FORM file "jqq12.log" was generated by one of the authors of hep-ph/9801224.

FORM convenctions like ln(1-x) can be translated automatically by FORM2FeynCalc,
but they have to be listed once in the option Replace of FORM2FeynCalc : *)


SetOptions[FORM2FeynCalc,Replace->{"ln(x)"->"Log[x]","ln(1+x)"->"Log[1+x]","ln(1-x)"->"Log[1-x]",
"Li2(-x)"->"Li2[-x]","Li2(1-x)"->"Li2[1-x]","Li3(1-x)"->"Li3[1-x]","Li3(-x)"->"Li3[-x]",
"S12(1-x)"->"Nielsen[1,2,1-x]","S12(-x)"->"Nielsen[1,2,-x]","S12(x^2)"->"Nielsen[1,2,x^2]",
"Z2"->"Zeta2","Z3"->"Zeta[3]","[1+x]^-1"->"(1+x)^-1","[(1-x)+]^-1"->"(1-x)^-1",
"[1-x]^-1"->"(1-x)^-1","delta"->"DeltaFunction[1-x]","Ca"->"CA","Cf"->"CF"},Dot->Times,HoldForm->False];


(* Copy the FORM output from jqq12.log into the next cell and put FORM2CFeynCalc[" "]//ReleaseHold around it. *)


aqq=FORM2FeynCalc["

		+ [(-1)^m]*e^-1*O1*Ca*Cf * (
		- 8
		+ 4*x*Z2
		+ 8*x
		+ 8*Z2*[1+x]^-1
		- 4*Z2
		- 4*ln(x)
		- 4*ln(x)*x
		- 8*ln(x)*ln(1 + x)
		+ 8*ln(x)*ln(1 + x)*x
		+ 16*ln(x)*ln(1 + x)*[1+x]^-1
		+ 2*ln(x)*ln(x)
		- 2*ln(x)*ln(x)*x
		- 4*ln(x)*ln(x)*[1+x]^-1
		- 8*Li2( - x)
		+ 8*Li2( - x)*x
		+ 16*Li2( - x)*[1+x]^-1
		)

	+ [(-1)^m]*e^-1*O1*Cf^2 * (
		+ 16
		- 8*x*Z2
		- 16*x
		- 16*Z2*[1+x]^-1
		+ 8*Z2
		+ 8*ln(x)
		+ 8*ln(x)*x
		+ 16*ln(x)*ln(1 + x)
		- 16*ln(x)*ln(1 + x)*x
		- 32*ln(x)*ln(1 + x)*[1+x]^-1
		- 4*ln(x)*ln(x)
		+ 4*ln(x)*ln(x)*x
		+ 8*ln(x)*ln(x)*[1+x]^-1
		+ 16*Li2( - x)
		- 16*Li2( - x)*x
		- 32*Li2( - x)*[1+x]^-1
		)

	+ [(-1)^m]*O1*Ca*Cf * (
		- 41/3
		- 6*x*Z2
		- 2*x*Z3
		+ 41/3*x
		+ 16/3*x^2*Z2
		+ 6*Z2
		+ 4*Z3*[1+x]^-1
		- 6*Z3
		- 8*ln(1 - x)
		+ 8*ln(1 - x)*x
		- 8*ln(1 - x)*Li2(1 - x)
		+ 8*ln(1 - x)*Li2(1 - x)*x
		+ 16*ln(1 - x)*Li2(1 - x)*[1+x]^-1
		+ 8*ln(1 + x)*x*Z2
		+ 8*ln(1 + x)*Z2*[1+x]^-1
		- 8*ln(1 + x)*Li2(1 - x)
		+ 8*ln(1 + x)*Li2(1 - x)*x
		+ 16*ln(1 + x)*Li2(1 - x)*[1+x]^-1
		+ 16*ln(1 + x)*Li2( - x)*x
		+ 16*ln(1 + x)*Li2( - x)*[1+x]^-1
		- 37/3*ln(x)
		- 25/3*ln(x)*x
		- 4*ln(x)*ln(1 - x)
		- 4*ln(x)*ln(1 - x)*x
		- 4*ln(x)*ln(1 - x)*ln(1 - x)
		+ 4*ln(x)*ln(1 - x)*ln(1 - x)*x
		+ 8*ln(x)*ln(1 - x)*ln(1 - x)*[1+x]^-1
		- 8*ln(x)*ln(1 - x)*ln(1 + x)
		+ 8*ln(x)*ln(1 - x)*ln(1 + x)*x
		+ 16*ln(x)*ln(1 - x)*ln(1 + x)*[1+x]^-1
		+ 4/3*ln(x)*ln(1 + x)*x^-1
		+ 4*ln(x)*ln(1 + x)*x
		+ 16/3*ln(x)*ln(1 + x)*x^2
		+ 8*ln(x)*ln(1 + x)*ln(1 + x)*x
		+ 8*ln(x)*ln(1 + x)*ln(1 + x)*[1+x]^-1
		- 6*ln(x)*ln(x)
		- 8/3*ln(x)*ln(x)*x^2
		+ 2*ln(x)*ln(x)*ln(1 - x)
		- 2*ln(x)*ln(x)*ln(1 - x)*x
		- 4*ln(x)*ln(x)*ln(1 - x)*[1+x]^-1
		- 6*ln(x)*ln(x)*ln(1 + x)
		+ 2*ln(x)*ln(x)*ln(1 + x)*x
		+ 8*ln(x)*ln(x)*ln(1 + x)*[1+x]^-1
		+ ln(x)*ln(x)*ln(x)
		- ln(x)*ln(x)*ln(x)*x
		- 2*ln(x)*ln(x)*ln(x)*[1+x]^-1
		+ 4*ln(x)*Li2(1 - x)
		- 4*ln(x)*Li2(1 - x)*x
		- 8*ln(x)*Li2(1 - x)*[1+x]^-1
		- 4*ln(x)*Li2( - x)
		+ 4*ln(x)*Li2( - x)*x
		+ 8*ln(x)*Li2( - x)*[1+x]^-1
		- 4*Li2(1 - x)
		- 4*Li2(1 - x)*x
		+ 4/3*Li2( - x)*x^-1
		+ 4*Li2( - x)*x
		+ 16/3*Li2( - x)*x^2
		+ 8*Li3(1 - x)
		- 8*Li3(1 - x)*x
		- 16*Li3(1 - x)*[1+x]^-1
		- 4*Li3( - x)
		- 4*Li3( - x)*x
		+ 4*S12(1 - x)
		- 4*S12(1 - x)*x
		- 8*S12(1 - x)*[1+x]^-1
		- 8*S12( - x)
		+ 24*S12( - x)*x
		+ 32*S12( - x)*[1+x]^-1
		+ 4*S12(x^2)
		- 4*S12(x^2)*x
		- 8*S12(x^2)*[1+x]^-1
		)

	+ [(-1)^m]*O1*Cf^2 * (
		+ 82/3
		+ 12*x*Z2
		+ 4*x*Z3
		- 82/3*x
		- 32/3*x^2*Z2
		- 12*Z2
		- 8*Z3*[1+x]^-1
		+ 12*Z3
		+ 16*ln(1 - x)
		- 16*ln(1 - x)*x
		+ 16*ln(1 - x)*Li2(1 - x)
		- 16*ln(1 - x)*Li2(1 - x)*x
		- 32*ln(1 - x)*Li2(1 - x)*[1+x]^-1
		- 16*ln(1 + x)*x*Z2
		- 16*ln(1 + x)*Z2*[1+x]^-1
		+ 16*ln(1 + x)*Li2(1 - x)
		- 16*ln(1 + x)*Li2(1 - x)*x
		- 32*ln(1 + x)*Li2(1 - x)*[1+x]^-1
		- 32*ln(1 + x)*Li2( - x)*x
		- 32*ln(1 + x)*Li2( - x)*[1+x]^-1
		+ 74/3*ln(x)
		+ 50/3*ln(x)*x
		+ 8*ln(x)*ln(1 - x)
		+ 8*ln(x)*ln(1 - x)*x
		+ 8*ln(x)*ln(1 - x)*ln(1 - x)
		- 8*ln(x)*ln(1 - x)*ln(1 - x)*x
		- 16*ln(x)*ln(1 - x)*ln(1 - x)*[1+x]^-1
		+ 16*ln(x)*ln(1 - x)*ln(1 + x)
		- 16*ln(x)*ln(1 - x)*ln(1 + x)*x
		- 32*ln(x)*ln(1 - x)*ln(1 + x)*[1+x]^-1
		- 8/3*ln(x)*ln(1 + x)*x^-1
		- 8*ln(x)*ln(1 + x)*x
		- 32/3*ln(x)*ln(1 + x)*x^2
		- 16*ln(x)*ln(1 + x)*ln(1 + x)*x
		- 16*ln(x)*ln(1 + x)*ln(1 + x)*[1+x]^-1
		+ 12*ln(x)*ln(x)
		+ 16/3*ln(x)*ln(x)*x^2
		- 4*ln(x)*ln(x)*ln(1 - x)
		+ 4*ln(x)*ln(x)*ln(1 - x)*x
		+ 8*ln(x)*ln(x)*ln(1 - x)*[1+x]^-1
		+ 12*ln(x)*ln(x)*ln(1 + x)
		- 4*ln(x)*ln(x)*ln(1 + x)*x
		- 16*ln(x)*ln(x)*ln(1 + x)*[1+x]^-1
		- 2*ln(x)*ln(x)*ln(x)
		+ 2*ln(x)*ln(x)*ln(x)*x
		+ 4*ln(x)*ln(x)*ln(x)*[1+x]^-1
		- 8*ln(x)*Li2(1 - x)
		+ 8*ln(x)*Li2(1 - x)*x
		+ 16*ln(x)*Li2(1 - x)*[1+x]^-1
		+ 8*ln(x)*Li2( - x)
		- 8*ln(x)*Li2( - x)*x
		- 16*ln(x)*Li2( - x)*[1+x]^-1
		+ 8*Li2(1 - x)
		+ 8*Li2(1 - x)*x
		- 8/3*Li2( - x)*x^-1
		- 8*Li2( - x)*x
		- 32/3*Li2( - x)*x^2
		- 16*Li3(1 - x)
		+ 16*Li3(1 - x)*x
		+ 32*Li3(1 - x)*[1+x]^-1
		+ 8*Li3( - x)
		+ 8*Li3( - x)*x
		- 8*S12(1 - x)
		+ 8*S12(1 - x)*x
		+ 16*S12(1 - x)*[1+x]^-1
		+ 16*S12( - x)
		- 48*S12( - x)*x
		- 64*S12( - x)*[1+x]^-1
		- 8*S12(x^2)
		+ 8*S12(x^2)*x
		+ 16*S12(x^2)*[1+x]^-1
		)

	+ [(-1)^m]*O2*Ca*Cf * (
		+ 8/3
		- 8/3*x
		- 16/3*x^2*Z2
		- 8/3*ln(x)
		+ 16/3*ln(x)*x
		+ 8/3*ln(x)*ln(1 + x)*x^-1
		- 8*ln(x)*ln(1 + x)*x
		- 16/3*ln(x)*ln(1 + x)*x^2
		+ 8/3*ln(x)*ln(x)*x^2
		+ 8/3*Li2( - x)*x^-1
		- 8*Li2( - x)*x
		- 16/3*Li2( - x)*x^2
		)

	+ [(-1)^m]*O2*Cf^2 * (
		- 16/3
		+ 16/3*x
		+ 32/3*x^2*Z2
		+ 16/3*ln(x)
		- 32/3*ln(x)*x
		- 16/3*ln(x)*ln(1 + x)*x^-1
		+ 16*ln(x)*ln(1 + x)*x
		+ 32/3*ln(x)*ln(1 + x)*x^2
		- 16/3*ln(x)*ln(x)*x^2
		- 16/3*Li2( - x)*x^-1
		+ 16*Li2( - x)*x
		+ 32/3*Li2( - x)*x^2
		)

	+ e^-2*delta*O1*Ca*Cf * (
		- 22
		)

	+ e^-2*delta*O1*Cf*Tf * (
		+ 8
		)

	+ e^-2*delta*O1*Cf^2 * (
		- 18
		+ 32*Z2
		)

	+ e^-2*O1*Ca*Cf * (
		+ 44/3
		+ 44/3*x
		- 88/3*[(1-x)+]^-1
		)

	+ e^-2*O1*Cf*Tf * (
		- 16/3
		- 16/3*x
		+ 32/3*[(1-x)+]^-1
		)

	+ e^-2*O1*Cf^2 * (
		+ 40
		+ 8*x
		- 48*[(1-x)+]^-1
		+ 32*ln(1 - x)
		+ 32*ln(1 - x)*x
		- 64*ln(1 - x)*[(1-x)+]^-1
		- 24*ln(x)
		- 24*ln(x)*x
		+ 32*ln(x)*[1-x]^-1
		)

	+ e^-1*delta*O1*Ca*Cf * (
		+ 325/6
		- 44/3*Z2
		- 12*Z3
		)

	+ e^-1*delta*O1*Cf*Tf * (
		- 58/3
		+ 16/3*Z2
		)

	+ e^-1*delta*O1*Cf^2 * (
		+ 87/2
		- 36*Z2
		- 8*Z3
		)

	+ e^-1*O1*Ca*Cf * (
		- 158/9
		+ 4*x*Z2
		+ 22/9*x
		- 8*Z2*[(1-x)+]^-1
		+ 4*Z2
		+ 238/9*[(1-x)+]^-1
		+ 44/3*ln(1 - x)
		+ 44/3*ln(1 - x)*x
		- 88/3*ln(1 - x)*[(1-x)+]^-1
		+ 34/3*ln(x)
		+ 34/3*ln(x)*x
		- 44/3*ln(x)*[1-x]^-1
		- 2*ln(x)*ln(x)
		- 2*ln(x)*ln(x)*x
		+ 4*ln(x)*ln(x)*[1-x]^-1
		)

	+ e^-1*O1*Cf*Tf * (
		+ 88/9
		- 56/9*x
		- 56/9*[(1-x)+]^-1
		- 16/3*ln(1 - x)
		- 16/3*ln(1 - x)*x
		+ 32/3*ln(1 - x)*[(1-x)+]^-1
		- 8/3*ln(x)
		- 8/3*ln(x)*x
		+ 16/3*ln(x)*[1-x]^-1
		)

	+ e^-1*O1*Cf^2 * (
		- 40
		- 4*x
		+ 56*[(1-x)+]^-1
		- 4*ln(1 - x)
		+ 44*ln(1 - x)*x
		- 24*ln(1 - x)*[(1-x)+]^-1
		+ 24*ln(1 - x)*ln(1 - x)
		+ 24*ln(1 - x)*ln(1 - x)*x
		- 48*ln(1 - x)*ln(1 - x)*[(1-x)+]^-1
		+ 36*ln(x)
		- 20*ln(x)*x
		- 36*ln(x)*[1-x]^-1
		- 16*ln(x)*ln(1 - x)*[1-x]^-1
		- 14*ln(x)*ln(x)
		- 14*ln(x)*ln(x)*x
		+ 16*ln(x)*ln(x)*[1-x]^-1
		- 8*Li2(1 - x)
		- 8*Li2(1 - x)*x
		)

	+ e^-1*O2*Ca*Cf * (
		+ 20/3
		- 88/3*x
		)

	+ e^-1*O2*Cf*Tf * (
		- 16/3
		+ 32/3*x
		)

	+ e^-1*O2*Cf^2 * (
		- 16
		- 8*x
		- 32*ln(1 - x)*x
		+ 16*ln(x)*x
		)

	+ delta*O1*Ca*Cf * (
		- 7081/72
		+ 301/18*Z2
		+ 49/5*Z2^2
		+ 28*Z3
		)

	+ delta*O1*Cf*Tf * (
		+ 569/18
		- 46/9*Z2
		- 8*Z3
		)

	+ delta*O1*Cf^2 * (
		- 541/8
		+ 97/2*Z2
		- 74/5*Z2^2
		+ 54*Z3
		)

	+ O1*Ca*Cf * (
		+ 941/27
		+ 17/3*x*Z2
		- 8*x*Z3
		- 580/27*x
		- 16/3*x^2*Z2
		- 24*x^2*Z3
		- 28/3*Z2*[(1-x)+]^-1
		- 1/3*Z2
		+ 12*Z3*[1-x]^-1
		+ 22*Z3*[(1-x)+]^-1
		- 20*Z3
		- 670/27*[(1-x)+]^-1
		- 122/9*ln(1 - x)
		+ 6*ln(1 - x)*x*Z2
		- 32/9*ln(1 - x)*x
		+ 8*ln(1 - x)*x^2*Z2
		- 10*ln(1 - x)*Z2*[(1-x)+]^-1
		+ 2*ln(1 - x)*Z2
		+ 238/9*ln(1 - x)*[(1-x)+]^-1
		+ 22/3*ln(1 - x)*ln(1 - x)
		+ 22/3*ln(1 - x)*ln(1 - x)*x
		- 44/3*ln(1 - x)*ln(1 - x)*[(1-x)+]^-1
		+ 2*ln(1 - x)*Li2(1 - x)
		- 2*ln(1 - x)*Li2(1 - x)*x
		+ 8*ln(1 - x)*Li2(1 - x)*x^2
		- 2*ln(1 - x)*Li2(1 - x)*[1-x]^-1
		+ 14/9*ln(x)
		- 2*ln(x)*x*Z2
		+ 176/9*ln(x)*x
		- 8*ln(x)*x^2*Z2
		+ 10*ln(x)*Z2*[1-x]^-1
		- 6*ln(x)*Z2
		+ 101/9*ln(x)*[1-x]^-1
		+ 28/3*ln(x)*ln(1 - x)
		+ 10/3*ln(x)*ln(1 - x)*x
		- 38/3*ln(x)*ln(1 - x)*[1-x]^-1
		- 12*ln(x)*ln(1 + x)
		- 4/3*ln(x)*ln(1 + x)*x^-1
		- 16*ln(x)*ln(1 + x)*x
		- 16/3*ln(x)*ln(1 + x)*x^2
		+ 47/6*ln(x)*ln(x)
		+ 47/6*ln(x)*ln(x)*x
		+ 8/3*ln(x)*ln(x)*x^2
		- 11/3*ln(x)*ln(x)*[1-x]^-1
		+ ln(x)*ln(x)*ln(1 - x)
		- ln(x)*ln(x)*ln(1 - x)*x
		+ 4*ln(x)*ln(x)*ln(1 - x)*x^2
		- ln(x)*ln(x)*ln(1 - x)*[1-x]^-1
		- ln(x)*ln(x)*ln(x)
		- ln(x)*ln(x)*ln(x)*x
		+ 2*ln(x)*ln(x)*ln(x)*[1-x]^-1
		+ 8*ln(x)*Li2(1 - x)
		+ 16*ln(x)*Li2(1 - x)*x^2
		- 12*ln(x)*Li2(1 - x)*[1-x]^-1
		+ 8*ln(x)*Li2( - x)
		- 8*ln(x)*Li2( - x)*[1-x]^-1
		- 12*Li2(1 - x)*x
		+ 4*Li2(1 - x)*[1-x]^-1
		- 12*Li2( - x)
		- 4/3*Li2( - x)*x^-1
		- 16*Li2( - x)*x
		- 16/3*Li2( - x)*x^2
		- 6*Li3(1 - x)
		+ 6*Li3(1 - x)*x
		- 24*Li3(1 - x)*x^2
		+ 6*Li3(1 - x)*[1-x]^-1
		- 16*Li3( - x)
		+ 16*Li3( - x)*[1-x]^-1
		+ 14*S12(1 - x)
		- 6*S12(1 - x)*x
		+ 24*S12(1 - x)*x^2
		- 14*S12(1 - x)*[1-x]^-1
		)

	+ O1*Cf*Tf * (
		- 88/27
		- 4/3*x*Z2
		+ 20/27*x
		+ 8/3*Z2*[(1-x)+]^-1
		- 4/3*Z2
		+ 128/27*[(1-x)+]^-1
		+ 88/9*ln(1 - x)
		- 56/9*ln(1 - x)*x
		- 56/9*ln(1 - x)*[(1-x)+]^-1
		- 8/3*ln(1 - x)*ln(1 - x)
		- 8/3*ln(1 - x)*ln(1 - x)*x
		+ 16/3*ln(1 - x)*ln(1 - x)*[(1-x)+]^-1
		+ 44/9*ln(x)
		- 28/9*ln(x)*x
		- 28/9*ln(x)*[1-x]^-1
		- 8/3*ln(x)*ln(1 - x)
		- 8/3*ln(x)*ln(1 - x)*x
		+ 16/3*ln(x)*ln(1 - x)*[1-x]^-1
		- 2/3*ln(x)*ln(x)
		- 2/3*ln(x)*ln(x)*x
		+ 4/3*ln(x)*ln(x)*[1-x]^-1
		)

	+ O1*Cf^2 * (
		+ 188/3
		- 4*x*Z2
		- 24*x*Z3
		+ 4/3*x
		+ 32/3*x^2*Z2
		+ 48*x^2*Z3
		- 4*Z2*[(1-x)+]^-1
		+ 20*Z2
		- 24*Z3*[1-x]^-1
		+ 24*Z3
		- 56*[(1-x)+]^-1
		- 38*ln(1 - x)
		+ 8*ln(1 - x)*x*Z2
		+ 38*ln(1 - x)*x
		- 16*ln(1 - x)*x^2*Z2
		- 8*ln(1 - x)*Z2*[(1-x)+]^-1
		+ 8*ln(1 - x)*Z2
		+ 28*ln(1 - x)*[(1-x)+]^-1
		- 13*ln(1 - x)*ln(1 - x)
		+ 31*ln(1 - x)*ln(1 - x)*x
		- 6*ln(1 - x)*ln(1 - x)*[(1-x)+]^-1
		+ 28/3*ln(1 - x)*ln(1 - x)*ln(1 - x)
		+ 28/3*ln(1 - x)*ln(1 - x)*ln(1 - x)*x
		- 56/3*ln(1 - x)*ln(1 - x)*ln(1 - x)*[(1-x)+]^-1
		- 12*ln(1 - x)*Li2(1 - x)
		+ 4*ln(1 - x)*Li2(1 - x)*x
		- 16*ln(1 - x)*Li2(1 - x)*x^2
		- 68/3*ln(x)
		- 14*ln(x)*x*Z2
		- 68/3*ln(x)*x
		+ 16*ln(x)*x^2*Z2
		+ 2*ln(x)*Z2
		+ 44*ln(x)*[1-x]^-1
		- 6*ln(x)*ln(1 - x)
		+ 34*ln(x)*ln(1 - x)*x
		- 20*ln(x)*ln(1 - x)*[1-x]^-1
		+ 6*ln(x)*ln(1 - x)*ln(1 - x)
		+ 6*ln(x)*ln(1 - x)*ln(1 - x)*x
		- 20*ln(x)*ln(1 - x)*ln(1 - x)*[1-x]^-1
		+ 24*ln(x)*ln(1 + x)
		+ 8/3*ln(x)*ln(1 + x)*x^-1
		+ 32*ln(x)*ln(1 + x)*x
		+ 32/3*ln(x)*ln(1 + x)*x^2
		+ 11*ln(x)*ln(x)
		- 23*ln(x)*ln(x)*x
		- 16/3*ln(x)*ln(x)*x^2
		- 15*ln(x)*ln(x)*[1-x]^-1
		- 6*ln(x)*ln(x)*ln(1 - x)
		+ 2*ln(x)*ln(x)*ln(1 - x)*x
		- 8*ln(x)*ln(x)*ln(1 - x)*x^2
		- 4*ln(x)*ln(x)*ln(1 - x)*[1-x]^-1
		- 5*ln(x)*ln(x)*ln(x)
		- 5*ln(x)*ln(x)*ln(x)*x
		+ 16/3*ln(x)*ln(x)*ln(x)*[1-x]^-1
		- 8*ln(x)*Li2(1 - x)
		+ 24*ln(x)*Li2(1 - x)*x
		- 32*ln(x)*Li2(1 - x)*x^2
		- 16*ln(x)*Li2(1 - x)*[1-x]^-1
		- 16*ln(x)*Li2( - x)
		+ 16*ln(x)*Li2( - x)*[1-x]^-1
		- 24*Li2(1 - x)
		+ 48*Li2(1 - x)*x
		- 4*Li2(1 - x)*[1-x]^-1
		+ 24*Li2( - x)
		+ 8/3*Li2( - x)*x^-1
		+ 32*Li2( - x)*x
		+ 32/3*Li2( - x)*x^2
		+ 20*Li3(1 - x)
		- 28*Li3(1 - x)*x
		+ 48*Li3(1 - x)*x^2
		+ 32*Li3( - x)
		- 32*Li3( - x)*[1-x]^-1
		- 8*S12(1 - x)
		+ 56*S12(1 - x)*x
		- 48*S12(1 - x)*x^2
		- 32*S12(1 - x)*[1-x]^-1
		)

	+ O2*Ca*Cf * (
		- 26/9
		- 8*x*Z2
		- 24*x*Z3
		+ 232/9*x
		+ 16/3*x^2*Z2
		+ 24*x^2*Z3
		+ 4*Z2
		- 16/3*ln(1 - x)
		+ 8*ln(1 - x)*x*Z2
		- 64/3*ln(1 - x)*x
		- 8*ln(1 - x)*x^2*Z2
		+ 8*ln(1 - x)*Li2(1 - x)*x
		- 8*ln(1 - x)*Li2(1 - x)*x^2
		+ 6*ln(x)
		- 8*ln(x)*x*Z2
		- 28*ln(x)*x
		+ 8*ln(x)*x^2*Z2
		- 4*ln(x)*ln(1 - x)
		+ 8*ln(x)*ln(1 - x)*x
		- 8/3*ln(x)*ln(1 + x)*x^-1
		+ 8*ln(x)*ln(1 + x)*x
		+ 16/3*ln(x)*ln(1 + x)*x^2
		- 8/3*ln(x)*ln(x)*x^2
		+ 4*ln(x)*ln(x)*ln(1 - x)*x
		- 4*ln(x)*ln(x)*ln(1 - x)*x^2
		+ 16*ln(x)*Li2(1 - x)*x
		- 16*ln(x)*Li2(1 - x)*x^2
		- 8*Li2(1 - x)
		+ 16*Li2(1 - x)*x
		- 8/3*Li2( - x)*x^-1
		+ 8*Li2( - x)*x
		+ 16/3*Li2( - x)*x^2
		- 24*Li3(1 - x)*x
		+ 24*Li3(1 - x)*x^2
		+ 24*S12(1 - x)*x
		- 24*S12(1 - x)*x^2
		)

	+ O2*Cf*Tf * (
		- 8/9
		- 32/9*x
		- 16/3*ln(1 - x)
		+ 32/3*ln(1 - x)*x
		- 8/3*ln(x)
		+ 16/3*ln(x)*x
		)

	+ O2*Cf^2 * (
		- 32/3
		+ 16*x*Z2
		+ 48*x*Z3
		- 16/3*x
		- 32/3*x^2*Z2
		- 48*x^2*Z3
		- 8*Z2
		- 16*ln(1 - x)*x*Z2
		- 44*ln(1 - x)*x
		+ 16*ln(1 - x)*x^2*Z2
		- 24*ln(1 - x)*ln(1 - x)*x
		- 16*ln(1 - x)*Li2(1 - x)*x
		+ 16*ln(1 - x)*Li2(1 - x)*x^2
		- 40/3*ln(x)
		+ 16*ln(x)*x*Z2
		+ 68/3*ln(x)*x
		- 16*ln(x)*x^2*Z2
		+ 8*ln(x)*ln(1 - x)
		- 32*ln(x)*ln(1 - x)*x
		+ 16/3*ln(x)*ln(1 + x)*x^-1
		- 16*ln(x)*ln(1 + x)*x
		- 32/3*ln(x)*ln(1 + x)*x^2
		+ 12*ln(x)*ln(x)*x
		+ 16/3*ln(x)*ln(x)*x^2
		- 8*ln(x)*ln(x)*ln(1 - x)*x
		+ 8*ln(x)*ln(x)*ln(1 - x)*x^2
		- 32*ln(x)*Li2(1 - x)*x
		+ 32*ln(x)*Li2(1 - x)*x^2
		+ 16*Li2(1 - x)
		- 48*Li2(1 - x)*x
		+ 16/3*Li2( - x)*x^-1
		- 16*Li2( - x)*x
		- 32/3*Li2( - x)*x^2
		+ 48*Li3(1 - x)*x
		- 48*Li3(1 - x)*x^2
		- 48*S12(1 - x)*x
		+ 48*S12(1 - x)*x^2
		)

		"]//ReleaseHold;

Short[aqq]


(* The first moment should be zero, which is verified by Integrate2 in a reasonable amount of time.
The variable O2 can be set to zero since it is the coefficient of unphysical matrix elements.

This calculates for m=1 the integral \!\(
\*SubsuperscriptBox[\(\[Integral]\), \(0\), \(\(1\)\(\ \)\)]\ \(\*
SubsuperscriptBox[
StyleBox[
OverscriptBox[
StyleBox["A",
FontSlant->"Plain"], "^"],
FontSlant->"Plain"], "qq",
RowBox[{"NS", ",", "PHYS"}]]\ \[DifferentialD]\(\(x\)\(\ \)\(:\)\)\)\) *)


Timing[res1=Integrate2[aqq/.m->1/.O2->0,{x,0,1}]]


(* If you know that no partial fraction decomposition has to be done then Integrate3
will be much faster on an expanded or collected integral:*)


Timing[res10=Expand[Integrate3[Expand[aqq/.m->1/.O2->0],{x,0,1}]]]


(* Define an auxiliary typesetting function: *)


MakeBoxes[big[a_], f_] := StyleBox[MakeBoxes[a, f], FontColor -> RGBColor[0, 0, 1],
FontSize -> 18];


(* The second moment takes a little bit longer. *)


Timing[res2=Collect2[Integrate2[x aqq/.m->2/.O2->0/.O1->1,{x,0,1}],{CA,CF,Tf},
Factoring->False]]/. {CA CF :> big[ CA CF],CF^2:>big[CF^2],
a_ CF Tf :>HoldForm[ big[CF Tf] a]}


(* Try to do the general Mellin transform (replace m by OPEm, which has special properties):*)


gqq = Collect2[x^(OPEm-1) (aqq/.m->OPEm)/.O2->0/.O1->1,x];
gqq//Length


(* There are 102 integrals. However, some of the Mellin transforms cannot be done at the moment.*)


ww=Integrate3[gqq,{x,0,1}];


(* If an integral cannot be performed the head Hold[Integrate3] is substituted for Integrate3.
Thus, in order to find the list of integrals not done you can do:*)


res3=Cases2[ww,Hold[Integrate3]]


(* Change the appearance and retain only those integrals with (x^(m-1)): *)


SelectNotFree[ww2,x^(OPEm-1)]/. Hold[Integrate3][z__]:> HoldForm[Integrate[z]]


(* If you know the answers for these integrals please share the knowledge. *)


SetOptions[FORM2FeynCalc,Replace->{}];


checkRes1=0;
checkRes10=0;
checkRes2=CF Tf (-(2086/81)-64/(9 Epsilon^2)+376/(27 Epsilon)+(16 Zeta2)/9)+
CA CF (12133/162+176/(9 Epsilon^2)-1166/(27 Epsilon)-(44 Zeta2)/9-12 Zeta[3])+
CF^2 (-(3452/81)-128/(9 Epsilon^2)+752/(27 Epsilon)+(32 Zeta2)/9+8 Zeta[3]);
checkRes3={Hold[Integrate3][x^(-1+OPEm) Nielsen[1,2,x^2],{x,0,1}],
Hold[Integrate3][x^OPEm Nielsen[1,2,x^2],{x,0,1}],
Hold[Integrate3][(x^(-1+OPEm) Nielsen[1,2,x^2])/(1+x),{x,0,1}],
Hold[Integrate3][(x^(-1+OPEm) Log[1-x] PolyLog[2,1-x])/(1+x),{x,0,1}],
Hold[Integrate3][x^(-1+OPEm) Log[1+x] PolyLog[2,1-x],{x,0,1}],
Hold[Integrate3][x^OPEm Log[1+x] PolyLog[2,1-x],{x,0,1}],
Hold[Integrate3][(x^(-1+OPEm) Log[1+x] PolyLog[2,1-x])/(1+x),{x,0,1}]};


Print["Check with known results: ",
			If[((res1===checkRes1) && (res10===checkRes10) &&
(res2==checkRes2) && (res3===checkRes3)), "CORRECT.", "!!! WRONG !!!"]];
