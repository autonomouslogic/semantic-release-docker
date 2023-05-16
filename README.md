# Semantic Release Docker
Docker image for [Semantic Release](https://github.com/semantic-release/semantic-release).
View on [Docker Hub](https://hub.docker.com/r/autonomouslogic/semantic-release).

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/autonomouslogic/semantic-release-docker)](https://github.com/autonomouslogic/semantic-release-docker/releases)
[![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/autonomouslogic/semantic-release-docker/Test/main)](https://github.com/autonomouslogic/semantic-release-docker/actions)
[![GitHub](https://img.shields.io/github/license/autonomouslogic/semantic-release-docker)](https://spdx.org/licenses/MIT-0.html)

Installed packages:
* Semantic Release CLI and several plugins
* Git
* Docker
* Node
  * YARN
* Java
  * Gradle
  * Maven
* _Tools_
  * [`jq`](https://stedolan.github.io/jq/)
  * [GitHub CLI `gh`](https://cli.github.com/)
  * Build essential, like `make`

## Usage
```shell
docker run --env GH_TOKEN -v $PWD:/usr/src/app -v $HOME/.docker:/root/.docker -v /var/run/docker.sock:/var/run/docker.sock autonomouslogic/semantic-release
```

## Versioning
This Docker image follows [semantic versioning](https://semver.org/).

## License
This Docker image is licensed under the [MIT-0 license](https://spdx.org/licenses/MIT-0.html),
although it depends on or includes software under different licenses.
