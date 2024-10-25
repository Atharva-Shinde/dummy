RELEASE_TAG ?= $(git describe --abbrev=0 2>/dev/null) # picks up the latest tag created; in this case the tag created using the Release Action

.PHONY: release
release:
	@if [ -z "${RELEASE_TAG}" ]; then echo "RELEASE_TAG is not set, exiting"; exit 1; fi

	@if ! [ -z "$$(git status --porcelain)" ]; then echo "Your local git repository contains uncommitted changes, use git clean before proceeding."; exit 1; fi

	gh release create ${RELEASE_TAG} \
	--title="${GITHUB_REPOSITORY#*/} ${tag#v}" \
	--repo="https://github.com/atharva-shinde/matrices"
	--notes-file changelog.md

.PHONY: changelog
changelog:
	@./changelog.sh