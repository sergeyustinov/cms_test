class Article < ApplicationRecord
  searchkick index_name: 'cms_article'
end
