# frozen_string_literal: true

require 'yaml'
# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  # take_yaml: converts a String with TSV data into @data
  # parameter: tsv - a String in yaml format
  def take_yaml(yml)
    @data = YAML.safe_load(yml)
  end

  # to_yaml: converts @data into tsv string
  # returns: String in yaml format
  def to_yaml
    @data.to_yaml
  end

  # def write_yml(filename, words)
  #     File.open(filename, 'w') do |file|
  #       file.puts words.to_yaml
  #     end
  #   end
end
