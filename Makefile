serve:
	docker compose up --build
build:
	docker compose run --rm jekyll bundle exec jekyll build
clean:
	docker compose run --rm jekyll bundle exec jekyll clean
update:
	 compose run --rm jekyll bundle update

