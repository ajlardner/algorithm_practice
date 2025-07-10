#!/bin/bash

# USAGE: ./new_problem.sh <problem_name_in_snake_case> 

PROBLEM_NAME=$1

if [ -z "$PROBLEM_NAME" ]; then
  echo "Error: You must provide a problem name."
  echo "Usage: ./new_problem.sh PROBLEM_NAME_in_snake_case"
  exit 1
fi

mkdir -p "./$PROBLEM_NAME"
cd "./$PROBLEM_NAME"

mkdir -p .devcontainer lib spec

cat > .devcontainer/devcontainer.json << EOL
{
  "name": "Ruby: $PROBLEM_NAME",
  "image": "mcr.microsoft.com/devcontainers/ruby:3.2",
  "customizations": {
    "vscode": {
      "extensions": [
        "rebornix.Ruby",
        "castwide.solargraph",
        "misogi.ruby-rubocop",
        "redhat.vscode-yaml"
      ],
      "settings": {
        "editor.formatOnSave": true,
        "terminal.integrated.shell.linux": "/bin/bash"
      }
    }
  }
}
EOL

cat > Gemfile << EOL
source 'https://rubygems.org'
gem 'rspec', require: false
gem 'rubocop', require: false
gem 'rubocop-rspec', require: false
gem 'prism'
EOL

cat > .rspec << EOL
--require spec_helper
--color
EOL

cat > spec/spec_helper.rb << EOL
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
EOL

cat > .rubocop.yml << EOL
AllCops:
  NewCops: enable

Style/Documentation:
  Enabled: false
EOL

cat > lib/solution.rb << EOL
class Solution
  # solution
end
EOL

cat > spec/solution_spec.rb << EOL
require_relative '../lib/solution'

describe Solution do
  subject { described_class.new }

  it 'solves the example case' do
    # expect(subject.your_method(input)).to eq(output)
  end
end
EOL

echo "✅ problem '$PROBLEM_NAME' created."