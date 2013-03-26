class ApiConfig

  BASE_PARAMS = %w(site authorize_url token_url)

  attr :config

  def initialize
    path = File.join(Rails.root,'config', 'api_config.yml')
    raise "api_config.yml not found in rails config folder" unless File.exists?(path)
    @config =  YAML::load_file(path)[Rails.env]
  rescue
    Rails.logger.error "Error loading api_config.yml from rails config folder"
  end

  def method_missing(sym)
    raise "No config loaded" unless @config.present? && @config.is_a?(Hash)
    @config[sym.to_s]
  end

  def self.method_missing(sym)
    ApiConfig.new.send(sym)
  end

  def self.base_params
    ApiConfig.new.config.slice(*BASE_PARAMS)
  end
end
