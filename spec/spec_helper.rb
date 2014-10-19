require 'beans'

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.before do
    Beans.repo.reset
  end
end
