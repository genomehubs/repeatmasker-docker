## RepeatMasker docker container

Repeatmasker docker container built from [hub.docker.com/r/robsyme/repeatmasker-onbuild](https://hub.docker.com/r/robsyme/repeatmasker-onbuild/)
with modifications to make it easier to use as a GenomeHubs container by running as UID 1000, separating input and output 
directories and renaming output files.

Clone this repository

```
git clone https://github.com/genomehubs/repeatmasker-docker.git
cd repeatmasker-docker
```

Fetch a copy of the RepBase libraries

```
wget --user your_username \
    --password 12345 \
    -O repeatmaskerlibraries.tar.gz \
    http://www.girinst.org/server/RepBase/protected/repeatmaskerlibraries/repeatmaskerlibraries-20160829.tar.gz

```

Build the docker image

```
docker build -t repeatmasker .
```

Run repeatmasker

```
mkdir repeats
docker run -d \
           --name repeatmasker \
           -v `pwd`/sequence:/in \
           -v `pwd`/repeats:/out \
           -e ASSEMBLY=scaffolds.fa.gz \
           -e NSLOTS=16 \
           -e SPECIES=arthropoda \
           repeatmasker
```
