# Neither run helper nor asset generators.
Initiative::Application.config.generators do |g|
  g.helper false
  g.assets false
end
