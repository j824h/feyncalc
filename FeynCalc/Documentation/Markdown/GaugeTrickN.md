## GaugeTrickN

`GaugeTrickN` is an option for `DoPolarizationSums`. It specifies the number of polarizations over which you are summing when you do the gauge trick, (i.e. replace the polarization sum by $- g^{\mu \nu}$).

The default value is `2`, which is correct e.g. for real photons as external states. However, if the external states are virtual photons, then `GaugeTrickN` should be set to `4`.

### See also

[Overview](Extra/FeynCalc.md), [DoPolarizationSums](DoPolarizationSums.md).

### Examples