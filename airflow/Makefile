# Variables
SRC_DIR:=./dags/
POETRY := $(shell command -v poetry 2> /dev/null)




# Set Airflow home directory
export AIRFLOW_HOME := ./airflow


# Use Poetry's Python interpreter and manage dependencies
.PHONY: install
install:
	$(POETRY) install

# Format code using black
.PHONY: format
format:
	$(POETRY) run isort --settings-path pyproject.toml $(SRC_DIR)
	$(POETRY) run black --config pyproject.toml $(SRC_DIR)

# Lint code using flake8
.PHONY: lint
lint:
	clear
	$(POETRY) run isort --settings-path pyproject.toml $(SRC_DIR)
	$(POETRY) run black --config pyproject.toml $(SRC_DIR)
	$(POETRY) run flake8 --config pyproject.toml $(SRC_DIR)
	$(POETRY) run mypy --config-file pyproject.toml $(SRC_DIR)

# Export dependencies to requirements.txt
.PHONY: export
export:
	$(POETRY) export --without-hashes -f requirements.txt -o requirements.txt


# Run Airflow in standalone mode
.PHONY: airflow
airflow:
	airflow standalone


