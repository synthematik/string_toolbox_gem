# frozen_string_literal: true

require "test_helper"

class TestStringToolbox < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil StringToolbox::VERSION
  end

  # truncate

  def test_truncate_long_strings
    result = StringToolbox.truncate("Hello, wonderful world!", max_length: 10)
    assert_equal "Hello, ...", result
  end

  def test_truncate_does_not_cut_short_strings
    result = StringToolbox.truncate("Hi", max_length: 10)
    assert_equal "Hi", result
  end

  def test_truncate_with_custom_omission
    result = StringToolbox.truncate("Hello, wonderful world!", max_length: 10, omission: "…")
    assert_equal "Hello, wo…", result
  end

  # slugify

  def test_slugify_converts_string_to_slug
    assert_equal "hello-world", StringToolbox.slugify("Hello World!")
  end

  def test_slugify_handles_special_characters
    assert_equal "привет-мир", StringToolbox.slugify("Привет & мир!")
  end

  def test_slugify_handles_multiple_spaces
    assert_equal "hello-world", StringToolbox.slugify("  hello   world  ")
  end

  # camelize

  def test_camelize_from_snake_case
    assert_equal "helloWorld", StringToolbox.camelize("hello_world")
  end

  def test_camelize_from_kebab_case
    assert_equal "helloWorld", StringToolbox.camelize("hello-world")
  end

  # word_count

  def test_word_count
    assert_equal 3, StringToolbox.word_count("one two three")
  end

  def test_word_count_with_extra_whitespace
    assert_equal 2, StringToolbox.word_count("  one   two  ")
  end
end
