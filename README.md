# Git Commit Chart (AI written)

99% AI (cursor) without any actual programming.

A web application that visualizes commit history for GitHub repositories using interactive charts. The application shows commit patterns over the last 30 days of any public GitHub repository, with both overall commit trends and per-user contribution breakdowns.

## Features

- View total commits per day with a line chart
- Analyze commits by user with a stacked bar chart
- Interactive GitHub-styled legend with user filtering
- Responsive design that works on all devices
- Easy navigation between different views
- URL sharing support for specific repositories
- Dark mode by default

## Installation

```sh
pipx install git-commit-chart
```

Run:
```sh
git-commit-chart --host 0.0.0.0 --port 8000 --production
```

### Screenshots

![Total Commits View](./screenshots/1.png)
*Total commits view*

![Commits by User View](./screenshots/2.png)
*Commits by user view*

### Local Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/git-commit-chart.git
cd git-commit-chart
```

2. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install the package:
```bash
pip install -e .
```

### Development Installation

For development, install with additional development dependencies:
```bash
pip install -e ".[dev]"
```

## Usage

### Command Line Interface

After installation, you can run the application using the `git-commit-chart` command:

```bash
# Run in development mode (default)
git-commit-chart

# Run in production mode
git-commit-chart --production

# Specify host and port
git-commit-chart --host 0.0.0.0 --port 8000
```

### Options

- `--port`: Port to run the application on (default: 5000)
- `--host`: Host to run the application on (default: 127.0.0.1)
- `--production/--development`: Run in production mode with Waitress server (default: development)

### Using the Web Interface

1. Start the application using one of the methods above
2. Open your web browser and navigate to the displayed URL (default: http://127.0.0.1:5000)
3. Enter a GitHub repository owner and name (e.g., "facebook" and "react")
4. Click "Generate Chart" to view the commit history
5. Use the navigation links to switch between total commits and per-user views

### URL Parameters

You can share specific repository visualizations by including the owner and repo in the URL:

```
http://localhost:5000/?owner=facebook&repo=react
http://localhost:5000/by-user?owner=facebook&repo=react
```

## Development

### Requirements

- Python 3.9 or higher
- pip (Python package installer)

### Development Tools

The development installation includes:
- pytest: For running tests
- black: For code formatting
- flake8: For code linting
- build: For building distribution packages
- twine: For publishing to PyPI

### Running Tests

The package includes comprehensive tests for all major components. To run the tests:

```bash
# Install development dependencies first
pip install -e ".[dev]"

# Run all tests
pytest

# Run tests with coverage report
pytest --cov=git_commit_chart

# Run specific test files
pytest tests/test_api.py
pytest tests/test_routes.py
pytest tests/test_cli.py
```

The tests cover:
- API Functions: Testing GitHub API integration
- Routes: Testing Flask endpoints and responses
- CLI: Testing command-line interface options
- Error Handling: Testing invalid inputs and error cases

### Building the Package

To build the package for distribution:
```bash
python -m build
```

This will create both wheel and source distribution in the `dist/` directory.

## Docker Support

Build and run using Docker:

```bash
# Build the image
podman build --platform linux/amd64,linux/arm64 -t local-git-commit-chart .

# Run the container
docker run --rm -i -t -p 5000:5000 local-git-commit-chart:latest
```

## Kubernetes Deployment

Kubernetes manifests are provided in the `k8s` directory. Deploy using:

```bash
kubectl apply -f k8s/deployment.yaml
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Notes

- The application only shows commits from the last 30 days
- Only public repositories are supported
- GitHub API has rate limiting for unauthenticated requests # git-commit-chart
