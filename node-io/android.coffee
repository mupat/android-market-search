nodeio = require 'node.io'
cheerio = require 'cheerio'
selectors = require "#{__dirname}/selectors"
googlePlay = 'https://play.google.com'
baseUrl = '/store/apps/details?id='

class AndroidScraping extends nodeio.JobClass
  input: false

  _trimImageLink: (link) ->
    index = link.indexOf('=')
    if index != -1 then link[0...index] else link

  _trim: (text) ->
    text.replace /^\s+|\s+$/g, ""

  run: (num) => 
    language = @options.args[1] || 'en'
    @getHtml "#{googlePlay}#{baseUrl}#{encodeURIComponent(@options.args[0])}&hl=#{language}", (err, $, data) =>
      return @exit "error by requesting the android market: #{err}" if err 
      
      try
        $ = cheerio.load data
        context = $(selectors.basePath)

        infos =
          bundle_identifier: encodeURIComponent @options.args[0]
          language: language
        for key, value of selectors.paths
          $elements = $(value.path, context)
          $first = $elements.first()
          if key == "screenshots"
            infos[key] = []
            $elements.each (i, e) => infos[key].push @_trimImageLink($(e).attr(value.prop))
            continue

          infos[key] = @_trim $first.attr(value.prop) if value.prop
          infos[key] = @_trim $first[value.method]() if value.method

          infos[key] = @_trimImageLink(infos[key]) if infos[key].indexOf('=w') != -1 or infos[key].indexOf('=h') != -1
          infos[key] = googlePlay + infos[key] if infos[key][0..0] == '/'
      catch err
        return @exit "error by reading the required informations: #{err}"        

      @emit infos
      @exit()

@class = AndroidScraping