# Algorithm & Data Structure Practice

This repository is for practicing data structures and algorithms, primarily using problems from platforms like LeetCode. I've also used a combination of NotebookLM and my own reading and research to prompt Google Gemini 2.5 Pro in a way that guides my learning. Some problems in this repository will be taken from that conversation. Each problem is solved in Ruby and developed using a Test-Driven Development (TDD) approach with RSpec.

The main goal is to build a strong foundation in core computer science concepts and maintain a professional, reproducible development workflow, as well as strengthen my abilities in RSpec and other related Ruby workflows I don't have much experience in. As the list of projects and problems I have solved in this format grows, I will add additional tooling to expose myself to.

The problem directories themselves are named according to their source and the name of the problem (e.g. leetcode1_two_sum, geminitutor_binary_search) but the new problem script does not make any judgements on naming.

## Prerequisites

To use this project, you will need the following installed on your host machine:

* [Visual Studio Code](https://code.visualstudio.com/)
* [Docker Desktop](https://www.docker.com/products/docker-desktop/)
* [WSL (Windows Subsystem for Linux)](https://learn.microsoft.com/en-us/windows/wsl/install)
* The VS Code "Dev Containers" extension.

## Workflow

This repository uses a shell script to scaffold a new, self-contained project for each algorithm problem.

### 1. Creating a New Problem

To start a new problem, run the `new_problem.sh` script from your WSL terminal with the desired problem name.

```
./new_problem.sh <problem_name_in_snake_case>

# Example:
./new_problem.sh 704_binary_search
```

This will create a new directory inside the algorithm_practice folder with a complete, isolated development environment.

### 2. Launching the Dev Container

1. Press F1 (or Ctrl+Shift+P) to open the Command Palette.

2. Type and select Dev Containers: Open Folder in Container....

3. A file dialog will open. Navigate to your new project folder and click "Open".

### 3. Setting Up the Container

The first time you open a new container, you need to install the dependencies. Run the following commands in the VS Code terminal. Updating packages and installing build tools may not always be necessary but is typically a low cost operation to ensure pesky issues are fixed.

```
# Update the package list
sudo apt-get update

# Install C build tools for gems with native extensions
sudo apt-get install -y build-essential

# Install the gems specified in the Gemfile
bundle install
```

### 4. Writing and Running Tests

The development process follows TDD:

First, add your test cases to the spec/solution_spec.rb file.

Run the tests from the terminal to see them fail:

```
bundle exec rspec
```

Finally, write the implementation in lib/solution.rb until the tests pass.
