# this is not namespaced so that we can do
#   validates :body, potty_mouth: true
class PottyMouthValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true if value.blank?

    if banned?(value)
      record.errors[attribute] << options.fetch(:message, "contains objectionable content")
    end
  end

  def banned?(value)
    text = value.gsub(/[\W\d]/, ' ') # get rid of non-letters
    words = text.split.to_set
    words.any?{|word| banned_word?(word)}
  end

  def banned_word?(word)
    banned_word_list.include?(word)
  end

  def banned_word_list
    self.class.banned_word_lists[options.fetch(:list, :default)]
  end

  class << self
    def banned_word_lists
      @lists ||= Hash.new { Set.new }
    end

    def add_word_list(type, path)
      banned_word_lists[type.to_sym] = File.read(path).split("\n").to_set
    end
  end
end

PottyMouthValidator.add_word_list(:default, File.expand_path("../default_word_list.txt", __FILE__))