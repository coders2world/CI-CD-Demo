name: CI Pipeline

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

env:
  APP_NAME: cicd-demo
  ENVIRONMENT: production

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v3

      - name: Show Environment Info
        run: |
          echo "App: $APP_NAME"
          echo "Env: $ENVIRONMENT"

      - name: Validate HTML File
        run: |
          if [ -f index.html ]; then
            echo "index.html found!"
          else
            echo "index.html NOT found!"
            exit 1
          fi

      - name: Run Tests
        run: |
          chmod +x test.sh
          ./test.sh

