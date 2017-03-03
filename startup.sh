#!/bin/bash

cp /in/$ASSEMBLY ./

if [[ $ASSEMBLY =~ \.gz$ ]]; then
  gunzip $ASSEMBLY
  ASSEMBLY=${ASSEMBLY%.gz}
fi

RepeatMasker \
       -pa $NSLOTS \
       -q \
       -species $SPECIES \
       -dir . \
       -xsmall \
       $ASSEMBLY

rm $ASSEMBLY
gzip *
mv * /out/


