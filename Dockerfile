FROM containerbase/buildpack:4.7.0

LABEL name="semantic-release" \
  maintainer="Kenneth Jørgensen <kenneth@autonomouslogic.com>" \
  org.opencontainers.image.title="Semantic Release Docker" \
  org.opencontainers.image.description="Docker image for running Semantic Release tasks." \
  org.opencontainers.image.source="https://github.com/autonomouslogic/semantic-release-docker" \
  org.opencontainers.image.licenses="MIT-0"

WORKDIR /usr/src/semantic-release

# renovate: datasource=github-tags lookupName=git/git
RUN install-tool git v2.37.1

# renovate: datasource=docker versioning=docker
RUN install-tool node 16.16.0

# renovate: datasource=npm
RUN install-tool yarn 1.22.19

# renovate: datasource=docker versioning=docker
RUN install-tool docker 20.10.17

# renovate: datasource=adoptium-java
RUN install-tool java 11.0.15+10

# renovate: datasource=gradle-version versioning=gradle
RUN install-tool gradle 7.5

# renovate: datasource=maven lookupName=org.apache.maven:maven
RUN install-tool maven 3.8.6

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

RUN apt-get update && \
    apt-get install -y gh jq && \
    rm -rf /var/lib/apt/lists/*

COPY package.json package.json
RUN cat package.json | jq -r '.devDependencies | to_entries | map("\(.key)@\(.value|tostring)")[]' \
    | xargs npm install --location=global

WORKDIR /usr/src/app
RUN git config --global --add safe.directory /usr/src/app

ENTRYPOINT [ "semantic-release" ]
CMD [ "--help" ]
