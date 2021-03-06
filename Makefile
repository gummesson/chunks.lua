.PHONY: test docs

dev-nix:
	@echo "Installing the development dependencies..."
	@sudo luarocks install busted

dev-win:
	@echo "Installing the development dependencies..."
	@luarocks install busted

test:
	@echo "Running the tests..."
	@busted

docs:
	@echo "Generating the documentation..."
	@docco src/chunks.lua
	@cp docs/chunks.html ../gh-pages/docs/index.html
	@cp docs/docco.css ../gh-pages/docs
	@cp -r docs/public ../gh-pages/docs
