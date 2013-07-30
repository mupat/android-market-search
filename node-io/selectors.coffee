basePath = '*[itemscope][itemtype="http://schema.org/MobileApplication"]'
basePathDeveloper = '*[itemprop="author"][itemscope][itemtype="http://schema.org/Organization"]'
basePathRating = '*[itemprop="aggregateRating"][itemscope][itemtype="http://schema.org/AggregateRating"]'

exports.basePath = basePath
exports.paths =
  "app_url": 
    path: "*[itemprop='url']"
    prop: "content"

  "logo": 
    path: "*[itemprop='image']"
    prop: "src"

  "app_name": 
    path: "*[itemprop='name']"
    method: "text"

  "developer":
    path: "#{basePathDeveloper} *[itemprop='name']"
    method: "text"

  "developer_link":
    path: "#{basePathDeveloper} *[itemprop='url']"
    prop: "content"

  "category": 
    path: ".category"
    method: "text"
    
  "price":
    path: "*[itemprop='offers'][itemscope][itemtype='http://schema.org/Offer'] *[itemprop='price']"
    prop: "content"

  "screenshots": 
    path: "*[itemprop='screenshot']"
    prop: "src"

  "description":
    path: "*[itemprop='description'] > div"
    method: "text"

  "rating_value":
    path: "#{basePathRating} *[itemprop='ratingValue']"
    prop: "content"

  "rating_count":
    path: "#{basePathRating} *[itemprop='ratingCount']"
    prop: "content"

  "last_update":
    path: "*[itemprop='datePublished']"
    method: "text"

  "file_size":
    path: "*[itemprop='fileSize']"
    method: "text"
   
  "downloads":
    path: "*[itemprop='numDownloads']"
    method: "text"

  "version":
    path: "*[itemprop='softwareVersion']"
    method: "text"

  "os_version": 
    path: "*[itemprop='operatingSystems']"
    method: "text"

  "content_rating":
    path: "*[itemprop='contentRating']"
    method: "text"
