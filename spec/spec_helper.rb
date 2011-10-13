require 'minitest/autorun'
require 'minitest/spec'

require 'draper'
require 'draper/base'
require 'active_support/inflector'

require 'mocha'

$: << File.expand_path("../../lib/draper/cancan", __FILE__)