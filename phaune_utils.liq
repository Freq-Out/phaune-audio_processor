# -*- mode: ocaml -*-
# vi: set ft=ocaml


# Put this script in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library"
# Don' t forget to %include this script in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library/pervasives.liq"





# Audio processing:

## Define our powerful "phaunepressor":

def phaunepressor(s)

## Define 3-band crossover:

  low = filter.iir.eq.low(frequency = 300.)
  mh = filter.iir.eq.high(frequency = 300.)
  mid = filter.iir.eq.low(frequency = 4000.)
  high = filter.iir.eq.high(frequency = 4000.)

## Define compression parameters:

  add(normalize = false,
      [ compress(attack = 100., release = 300., threshold = -1.,
                 ratio = 1., gain = 0.4, knee = 1.3, rms_window = 0.5,
                 low(s)),
        compress(attack = 100., release = 300., threshold = -1.,
                 ratio = 0.8, gain = 0.3, knee =1.3, rms_window = 0.5,
                 mid(mh(s))),
        compress(attack = 100., release = 300., threshold = -1.,
                ratio = 1., gain = 0.2, knee = 1.3, rms_window = 0.5,
                 high(s)),

## Define limiter parameters:

        limit(gain = 0.5, ratio = 0.5, attack = 80., release = 800.,
              threshold = 0., rms_window = 0.5, (s))
       ])
end


## You can now use "phaunepressor" as a function in your ls_sript.liq:

## (s) = phaunepressor(s)