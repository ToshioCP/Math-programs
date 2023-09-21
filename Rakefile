# This "Rakefile" just build HTML files.

# Just type 'rake'.

require 'rdoc/task'

task default: :nojekyll

task nojekyll: :rdoc do
  touch "docs/.nojekyll"
end

# RDoc::Task creates the following tasks.
# [rdoc] Generate RDoc files
# [clobber_rdoc] Delete all the rdoc files.
# [rerdoc] Rebuild the rdoc files from scratch, even if they are not out of date.

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.title = "Math Programs"
  rdoc.rdoc_dir = "docs"
  rdoc.rdoc_files.include("README.md", "axby1.rb", "unit_fractions.rb", "e10p.rb")
end
