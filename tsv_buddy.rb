# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_lines = tsv.split("\n")
    keys = tsv_lines[0].split("\t")
    tsv_lines.shift

    @data = parse_tsv(tsv_lines, keys)
  end

  # parse tsv lines into hash format
  def parse_tsv(tsv_lines, keys)
    output = []
    tsv_lines.each do |line|
      value = line.split("\t")
      record = {}
      keys.each_index { |index| record[keys[index]] = value[index].chomp }
      output << record
    end
    output
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    keys_list = @data[0].map { |key,| key }.join("\t") << "\n"
    survey = @data.map do |line|
      line.map { |_, word| word }.join("\t") << "\n"
    end
    keys_list + survey.join
  end
end

# ruby tsv_to_yml.rb ./data/survey.tsv output.yaml
