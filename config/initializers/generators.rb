# Neither run helper nor asset generators.
Initiapp::Application.config.generators do |g|
  g.assets false
end
