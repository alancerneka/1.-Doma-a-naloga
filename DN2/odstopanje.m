(* ::Package:: *)

Odstopanje[n_]:= Module[{odstopek},
to\[CHacek]ke=RandomPoint[Rectangle[],n];
Preverjanje=RegionMember[Disk[{0.5,0.5},0.5]];
pribli\[ZHacek]ek=N[Count[Preverjanje[to\[CHacek]ke],True]*4/Length[to\[CHacek]ke]];
odstopek=Abs[\[Pi]-pribli\[ZHacek]ek ];
Print["Pribli\[ZHacek]ek: ",NumberForm[N[pribli\[ZHacek]ek],6]];Print["Prava vrednost: ",N[\[Pi],6]];Print["Odstopek zna\[SHacek]a: ",odstopek]
]

