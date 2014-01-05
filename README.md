# phaune-audio_processor

A liquidsoap script to implement a soft 3 bands audio processing on Airtime stream output.

This is a test, NOT meant for production use.

## Prerequisites

A working [Airtime](http://www.sourcefabric.org/en/airtime/) installation.

You can use this [Airtime appliance](https://github.com/Freq-Out/airtime-appliance) to set a virtual installation of Airtime.

See the [Read Me](https://github.com/Freq-Out/airtime-appliance/blob/master/README.md) file for complete Airtime appliance deployment procedure.

## Installation

Just put phaune_utils.liq in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library".

Include phaune_utils.liq in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library/pervasives.liq".

## How to

In your ls_script.liq, where your stream source is define, after the amplify function, just use "phaunepressor" as a function of the type:

s = phaunepressor(s)

where (s) is the source to process.

Restart liquid soap.




You can change the crossover and compression parameters by tweaking those values in phaune_utils.liq.
