# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( ckeditor/*)
Rails.application.config.assets.precompile += %w( games.css )
Rails.application.config.assets.precompile += %w(game.js)
Rails.application.config.assets.precompile += %w( materialize-sprockets.js )
Rails.application.config.assets.precompile += %w( materialize.js )
Rails.application.config.assets.precompile += %w( jquery.turbolinks.js )
Rails.application.config.assets.precompile += %w( materialize/extras/nouislider.js )
Rails.application.config.assets.precompile += %w( devise.css )
Rails.application.config.assets.precompile += %w( static_pages.css )
Rails.application.config.assets.precompile += %w( profile.css )
Rails.application.config.assets.precompile += %w( profile.js )
Rails.application.config.assets.precompile += %w( bx_loader.gif controls.png )
Rails.application.config.assets.precompile += %w( reviews.css )
Rails.application.config.assets.precompile += %w( reviews.js )
Rails.application.config.assets.precompile += %w( show_game.css )
Rails.application.config.assets.precompile += %w( show_listreview.scss )
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( home_page.css )
Rails.application.config.assets.precompile += %w( home_page.js )
Rails.application.config.assets.precompile += %w( admin_create_game.css )
Rails.application.config.assets.precompile += %w( admin_game.js )
