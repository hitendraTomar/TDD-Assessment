# String Calculator
## Requirements
- Ruby 3.1.0
- Libraries: rspec, bundler
## Dependencies, Run and Test
### DEPENDENCIES
  - `bundle install`
### Description
  - I have developed the tdd in 2 ways
    - Using monkey patching which uses string_spec.rb file
    - Without monkey patching which uses calculator_spec.rb file
### RUN/TEST
  - To test string_spec.rb
    - `bundle exec rspec spec/string_spec.rb`
  - To test calculator_spec.rb
    - `bundle exec rspec spec/calculator_spec.rb`
  - To test in both way simultaniously
    - `bundle exec rspec spec/`
