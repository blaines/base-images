# AUTOGENERATED FILE
FROM #{FROM}

ENV NODE_VERSION #{NODE_VERSION}
ENV NPM_VERSION 2.10.1

RUN buildDeps='curl' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -SLO "#{BINARY_URL}" \
	&& tar -xzf "node-v$NODE_VERSION-linux-#{TARGET_ARCH}.tar.gz" -C /usr/local --strip-components=1 \
	&& rm "node-v$NODE_VERSION-linux-#{TARGET_ARCH}.tar.gz" \
	&& apt-get purge -y --auto-remove $buildDeps \
	&& npm install -g npm@"$NPM_VERSION" --unsafe-perm \
	&& npm install mraa \
	&& npm cache clear \
	&& rm -rf /tmp/*

CMD [ "node" ]
