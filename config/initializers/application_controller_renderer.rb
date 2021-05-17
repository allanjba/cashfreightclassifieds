# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end
Unsplash.configure do |config|
    config.application_access_key = "9Fyy3IJ5hIEXnhvLtNH_yzubNweTZmyXGJPIs-uH_4w"
    config.application_secret = "qKPivJUpMuthgyfVx5LAZ5EQKPEKcRQ4yKObPhzk4C8"
    config.application_redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
    config.utm_source = "alices_terrific_client_app"

  end