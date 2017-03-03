FROM robsyme/repeatmasker-onbuild
MAINTAINER Richard Challis/LepBase contact@lepbase.org

RUN apt-get update && apt-get install -y \
    gzip

RUN mkdir /data && mkdir /out

RUN adduser --disabled-password --gecos '' dockeruser

RUN chown -R dockeruser /data

WORKDIR /data

COPY startup.sh /

USER dockeruser

CMD /startup.sh
