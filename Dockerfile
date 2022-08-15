FROM nginx/unit:1.23.0-python3.9
COPY ./config/config.json /docker-entrypoint.d/config.json

RUN mkdir build
COPY ./app ./build
RUN apt update && apt install -y python3-pip                                  \
    && pip3 install -r /build/requirements.txt                               \
    && apt remove -y python3-pip                                              \
    && apt autoremove --purge -y                                              \
    && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/*.list

EXPOSE 80