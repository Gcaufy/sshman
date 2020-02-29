lint:
	shellcheck ./sshman && shellcheck ./lib/**/*.bash

test:
	find . | grep .bats$ | xargs bats

release:
	npm run release

.PHONY: lint test release
