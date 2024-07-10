VERSION 0.8

nanoc:
	#FROM docker.io/library/ruby:3.3-alpine
	FROM docker.io/library/ruby:3.3
	COPY --dir content layouts lib Gemfile Gemfile.lock Rules nanoc.yaml \
		/src/site/
	WORKDIR /src/site


build:
	FROM +nanoc
	RUN bundle install
	RUN bundle exec nanoc
	SAVE ARTIFACT output AS LOCAL output


bundle-update:
	FROM +nanoc
	RUN bundle update
	SAVE ARTIFACT Gemfile.lock AS LOCAL Gemfile.lock
