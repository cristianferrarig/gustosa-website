#
# CONFIG
# v 0.1
#
# 1. Assets
# 2. Directories
# 3. Layouts
# 4. Extensions
# 6. Eviroments
# 7. Helpers
#




# 1. Assets
after_configuration do
  sprockets.append_path "#{root}/vendor/basekit/assets/stylesheets"
  sprockets.append_path "#{root}/vendor/basekit/assets/javascripts"
  sprockets.append_path "#{root}/vendor/bower"
# sprockets.import_asset 'jquery'
# sprockets.import_asset 'hashgrid'
end




# 2. Directories
set :source,       "source"
set :build_dir,    "build"

set :data_dir,     "config/data"
set :locales_dir,  "config/locales"
set :helpers_dir,  "config/helpers"

# Relatives to source
set :layouts_dir,  "layouts"

set :css_dir,      "assets/stylesheets"
set :js_dir,       "assets/javascripts"
set :images_dir,   "assets/images"
set :fonts_dir,    "assets/fonts"




# 3. Layouts
# Page options, layouts, aliases and proxies
# set :layout,       "default"

# set :index_file, "index.html"

# With no layout
page '/*.xml',     layout: false
page '/*.json',    layout: false
page '/*.txt',     layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }




# 4. Extensions
activate :sprockets
activate :autoprefixer
activate :directory_indexes

# activate :autoprefixer do |config|
#   config.browsers = ['last 2 versions', 'Explorer >= 9']
#   config.ignore   = ['/stylesheets/hacks.css']
# end
activate :syntax do |syntax|
  syntax.css_class     = "code-highlight"
  syntax.line_numbers  = true
end
activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true
end




# 6. Eviroments
#
# configure :server { #enable sprockets debugging }
# configure :build { # run some post-build hooks }
# configure :development { # enable some sass debug settings }
# configure :production { activate :minify_html }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
  set :debug_assets, true
end

configure :server do
  # files.watch :source, "#{root}/vendor/basekit"

  #files.watch :source, path: "#{root}/vendor/basekit/assets/stylesheets"
end

# Build-specific configuration
configure :build do
  # Optimize images
  # activate :imageoptim

  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  activate :cache_buster
  # activate :asset_hash
  # activate :relative_assets
  # set :relative_links, false
end




# 7. Helpers

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
