FROM troian/golang-cross

RUN \
    GORELEASER_DOWNLOAD_FILE=goreleaser_Linux_x86_64.tar.gz \
 && GORELEASER_VERSION=0.147.2 \
 && GORELEASER_SHA=2ee16694ae5be261d3f5b4fef7a700c371119f967cd55060406cee50f857bc2e \
 && GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/${GORELEASER_DOWNLOAD_FILE} \
 && wget ${GORELEASER_DOWNLOAD_URL} \
 && echo "$GORELEASER_SHA $GORELEASER_DOWNLOAD_FILE" | sha256sum -c - || exit 1 \
 && tar -xzf $GORELEASER_DOWNLOAD_FILE -C /usr/bin/ goreleaser \
 && rm $GORELEASER_DOWNLOAD_FILE 

ENTRYPOINT ["bash", "/entrypoint.sh"]