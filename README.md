# INSTALL

install elasticsearch
----
for macos:

brew install elasticsearch

brew services start elasticsearch

----

bundle install

rake db:migrate

rake db:seed

rake searchkick:reindex:all
