require 'ostruct'
require 'yaml'
require 'iremocon'

  def signal_to_iremocon(signal)
    iremocon = ::Iremocon.new("192.168.0.9")
    if signal.kind_of? Array
      signal.each do |s|
        iremocon.is(s)
        sleep 0.5
      end
    else
      iremocon.is(signal)
    end
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
    signal_to_iremocon(signals['stb']['change_ch']['kidsstation'])
  end

  def run_light_power_on
    $APP_CONFIG = OpenStruct.new(YAML.load_file("config_sample.xml"))
    config = $APP_CONFIG.plugins[0]
    signals = config["signals"]
    signal_to_iremocon(signals['light']['power'][true])
  end
  def run_light_power_off
    $APP_CONFIG = OpenStruct.new(YAML.load_file("config_sample.xml"))
    config = $APP_CONFIG.plugins[0]
    signals = config["signals"]
p signals
    p signals['light']['power'][false]
    signal_to_iremocon(signals['light']['power'][false])
  end
  run_light_power_off
  sleep 3
  run_light_power_on

