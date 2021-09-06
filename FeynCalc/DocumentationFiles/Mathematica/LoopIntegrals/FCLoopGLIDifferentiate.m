(* ::Package:: *)

 


(* ::Section:: *)
(*FCLoopGLIDifferentiate*)


(* ::Text:: *)
(*`FCLoopGLIDifferentiate[exp , topos, inv]` calculates the partial derivative of GLIs present in `exp` with respect to the scalar quantity `inv`. *)
(*Here `inv` can be a constant (e.g. mass) or a scalar product of some momenta.  The list topos must contain the topologies describing all of the occurring GLIs.*)


(* ::Text:: *)
(*To calculate multiple derivatives, use the notation `FCLoopGLIDifferentiate[exp , topos, {inv,n}]`*)


(* ::Subsection:: *)
(*See also*)


(* ::Text:: *)
(*[FCTopology](FCTopology), [GLI](GLI), [FCLoopGLIExpand](FCLoopGLIExpand).*)


(* ::Subsection:: *)
(*Examples*)


FCLoopGLIDifferentiate[x GLI[tad2l,{1,1,1}],
{FCTopology[tad2l, {FAD[{p1, m1}], FAD[{p2, m2}], FAD[{p1 - p2, m3}]}, {p1, p2}, {}, {}, {}]},m1]


FCLoopGLIDifferentiate[x GLI[tad2l,{1,1,1}],
{FCTopology[tad2l, {FAD[{p1, m1}], FAD[{p2, m2}], FAD[{p1 - p2, m3}]}, {p1, p2}, {}, {}, {}]},{m1,5}]


FCLoopGLIDifferentiate[m2^2 GLI[tad2l,{1,1,1}],
{FCTopology[tad2l, {FAD[{p1, m1}], FAD[{p2, m2}], FAD[{p1 - p2, m3}]}, {p1, p2}, {}, {}, {}]},m2]


FCLoopGLIDifferentiate[ GLI[prop1l,{1,1}]+SPD[q] GLI[prop1l,{1,0}],
{FCTopology[prop1l, {FAD[{p1, m1}], FAD[{p1+q, m2}]}, {p1}, {q}, {}, {}]},SPD[q]]
