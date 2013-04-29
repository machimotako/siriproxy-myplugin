require 'ostruct'
require 'yaml'

describe "iremocon" do
  it "can power on stb." do
    $APP_CONFIG = OpenStruct.new(YAML.load_file("config_sample.xml"))
  end
end

