# -*- mode: ocaml -*-
# vi: set ft=ocaml


# Put this script in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library"
# Don' t forget to %include this script in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library/pervasives.liq"





# Audio processing:

## Define our powerful "phaunepressor":

def phaunepressor(s)

## Define 3-band crossover:

  low = filter.iir.eq.low(frequency = 200.)
  mh = filter.iir.eq.high(frequency = 200.)
  mid = filter.iir.eq.low(frequency = 4000.)
  high = filter.iir.eq.high(frequency = 4000.)

## Define compression parameters:

  add(normalize = false,
      [ compress(attack = 100., release = 300., threshold = -2.,
                 ratio = 0.8, gain = 2., knee = 1.3,
                 low(s)),
        compress(attack = 100., release = 400., threshold = -1.,
                 ratio = 1., gain = 1., knee =1.3,
                 mid(mh(s))),
        compress(attack = 100., release = 300., threshold = -2.,
		ratio = 0.8, gain = 2., knee = 1.3,
                 high(s))
      ])
end


## You can now use "phaunepressor" as a variable in your ls_sript.liq:

## (s) = phaunepressor(s)