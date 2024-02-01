# nBio docker build

FROM debian:latest

RUN apt update -y && apt upgrade -y && apt install -y \
    libexpat1-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libxt-dev \
    xorg-dev \
    build-essential \
    libharfbuzz-dev \
    cmake \
    bash \
    unzip \
    wget

WORKDIR /tmp

COPY . .

RUN ls -la

WORKDIR topas_3_9/debian9

RUN ls -la

RUN unzip -q Geant4Headers.zip

RUN ls -la

RUN ls -la ../../extensions

RUN cmake -DTOPAS_EXTENSIONS_DIR=../../extensions && \
    cmake --build .

ENTRYPOINT ["sh", "get_geant4_data_and_run_topas.sh"]

CMD ["examples/Scoring/Dose.txt"]