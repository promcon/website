compile:
	rm -rf output
	bundle exec nanoc

deploy: github_pages_export github_pages_push

github_pages_export: compile
	cd output && \
	echo promcon.io > CNAME && \
	git init && \
	git config user.name "Travis CI" && \
	git config user.email "travis@promcon.io" && \
	git add . && \
	git commit --message="Static site builder output"

github_pages_push:
	cd output && \
	git push -f git@github.com:promcon/promcon.github.io master

.PHONY: compile deploy github_pages_export github_pages_push
