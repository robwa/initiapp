# Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
# Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
#config.time_zone = 'Berlin'

# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
Initiapp::Application.config.i18n.default_locale = :de

I18n.enforce_available_locales = true
