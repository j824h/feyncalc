(* ::Package:: *)

(* ::Section:: *)
(*DiracIndexNames*)


(* ::Text:: *)
(*`DiracIndexNames` is an option for `FCFAConvert`, `FCCanonicalizeDummyIndices` and other functions. It renames the generic dummy Dirac indices to the indices in the supplied list.*)


(* ::Subsection:: *)
(*See also*)


(* ::Text:: *)
(*[FCFAConvert](FCFAConvert), [FCCanonicalizeDummyIndices](FCCanonicalizeDummyIndices), [LorentzIndexNames](LorentzIndexNames).*)


(* ::Subsection:: *)
(*Examples*)


DCHN[GA[mu],i,j]DCHN[GA[nu],j,k]
FCCanonicalizeDummyIndices[%]


DCHN[GA[mu],i,j]DCHN[GA[nu],j,k]
FCCanonicalizeDummyIndices[%,DiracIndexNames->{a}]


