build:
	@echo "Building Artefacts inside Docker image and exporting them to host"
	docker buildx build -o . .
	#docker buildx build -t test_text_angular_image .

