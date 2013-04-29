require 'ostruct'
require 'yaml'
require 'iremocon'

  def signal_to_iremocon(signal)
    iremocon = ::Iremocon.new("192.168.0.9")
    iremocon.is(signal)
    iremocon.telnet.close
  end

  def run_power_on
    $APP_CONFIG = OpenStruct.new(YAML.load_file("config_sample.xml"))
    config = $APP_CONFIG.plugins[0]
    signals = config["signals"]
    signal_to_iremocon(signals['stb']['power'])
  end

  def run_change_channel
    $APP_CONFIG = OpenStruct.new(YAML.load_file("config_sample.xml"))
    config = $APP_CONFIG.plugins[0]
    signals = config["signals"]
    signal_to_iremocon(signals['stb']['catv'])
    signal_to_iremocon(signals['stb']['input_number'])
    signal_to_iremocon(signals['stb']['5'])
    signal_to_iremocon(signals['stb']['1'])
    signal_to_iremocon(signals['stb']['1'])
  end

  run_change_channel

