edit: .make_compose
	docker compose start
	nvim --server 127.0.0.1:8000 --remote-ui

.make_image: dockerfile
	docker compose build
	touch .make_image

.make_compose: .make_image compose.yaml
	docker compose create
	touch .make_compose
	echo install overseer and go suport

clean:
	docker compose down
	rm .make_*
