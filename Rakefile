# TYpe 'rake' to compile racc/acr.y into lib/math_programs/acr.rb
# Type 'rake rdoc' to create HTML documents.
# Type 'rake test' for the test.

require "rdoc/task"
require "rake/testtask"

task default: "lib/math_programs/acr.rb"

file "lib/math_programs/acr.rb" => "racc/acr.y" do
  sh "racc -o lib/math_programs/acr.rb racc/acr.y"
end
# RDoc::Task creates the following tasks.
# [rdoc] Generate RDoc files
# [clobber_rdoc] Delete all the rdoc files.
# [rerdoc] Rebuild the rdoc files from scratch, even if they are not out of date.
#
# See {Rdoc document}[https://ruby.github.io/rdoc/RDoc/Task.html] for further information.
RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.title = "Math Programs"
  rdoc.rdoc_dir = "docs"
  rdoc.rdoc_files.include("README.md", "License.md", "lib/math_programs/*.rb")
end
task :rdoc do
  touch "docs/.nojekyll"
end

Rake::TestTask.new do |t|
  t.test_files = Dir.glob("test/test_*")
  t.verbose = true
end
