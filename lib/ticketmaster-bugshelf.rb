require File.dirname(__FILE__)+'/bugshelf/bugshelf-api'

%w{ bugshelf ticket project comment }.each do |f|
  require File.dirname(__FILE__) + '/provider/' + f + '.rb';
end
