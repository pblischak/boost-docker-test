# This is a test Dockerfile.
# I'm not sure if it works yet, so use with caution.

FROM ubuntu

MAINTAINER Paul Blischak <blischak.4@osu.edu>

# Get g++ for compiling, wget to download Boost, git to clone source code repo,
# and make to automate program compilation with Makefile provided
RUN apt-get update \
  && apt-get install -y git \
                        g++ \
                        make \
                        wget

# Download boost, untar, setup install with bootstrap and only do the Program Options library,
# and then install
RUN cd /home && wget http://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.gz \
  && tar xfz boost_1_60_0.tar.gz \
  && rm boost_1_60_0.tar.gz \
  && cd boost_1_60_0 \
  && ./bootstrap.sh --prefix=/usr/local --with-libraries=program_options \
  && ./b2 install \
  && cd /home \
  && rm -rf boost_1_60_0

#
RUN cd /home \
  && git clone https://github.com/pblischak/boost-docker-test.git

RUN cd /home/boost-docker-test \
  && make linux

ENV PATH /home/boost-docker-test:$PATH

CMD ["bash"]
