require 'test_helper'

class ModelTest < MiniTest::Unit::TestCase

  class TestModel
    attr_accessor :body, :subject
    include ActiveModel::Validations

    validates :body, :subject, potty_mouth: true
  end

  class CustomList
    attr_accessor :body, :subject
    include ActiveModel::Validations

    validates :body, :subject, potty_mouth: {list: :custom}
  end

  class MissingList
    attr_accessor :body, :subject
    include ActiveModel::Validations

    validates :body, :subject, potty_mouth: {list: :missing}
  end

  PottyMouthValidator.add_word_list(:custom, File.expand_path("../custom_list.txt", __FILE__))

  def test_validates
    m = TestModel.new
    m.subject = "what the fuck?"
    m.body = "what the fuck is this?"
    assert !m.valid?

    assert m.errors[:subject].present?
    assert m.errors[:body].present?
  end

  def test_custom_list
    m = CustomList.new
    m.subject = "what the fuck?"
    m.body = "foobar blah"
    assert !m.valid?

    assert m.errors[:subject].empty?
    assert m.errors[:body].present?
  end

  def test_missing_list
    m = MissingList.new
    m.subject = "what the fuck?"
    m.body = "foobar blah"
    assert m.valid?

    assert m.errors[:subject].empty?
    assert m.errors[:body].empty?
  end

end