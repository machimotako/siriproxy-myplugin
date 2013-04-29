require 'ostruct'
require 'yaml'
require 'iremocon'

describe "iremocon" do
  def signal_to_iremocon(signal)
    iremocon = ::Iremocon.new("192.168.0.9")
    iremocon.is(signal)
    iremocon.telnet.close
  end

  it "can power on stb." do
    $APP_CONFIG = OpenStruct.new(YAML.load_file("config_sample.xml"))
    config = $APP_CONFIG.plugins[0]
    config["name"].should == "Myplugin"
    signals = config["signals"]
    signal_to_iremocon(signals['stb']['power'])
  end
end

