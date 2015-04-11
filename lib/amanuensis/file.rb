require_relative 'file/configuration'
require_relative 'file/push'

Push.register :file, File::Push.new
