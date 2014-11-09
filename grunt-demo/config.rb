require 'bootstrap-sass'

# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
project_path = (environment == :production) ? 'dist' : 'dev'

http_path = "/"
css_dir = "css"
images_dir = "assets/images"
javascripts_dir = "js"

sass_path = "src/sass"

# You can select your preferred output style here (can be overridden via the command line):

output_style = (environment == :production) ? :compressed : :expanded

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false

preferred_syntax = :sass
