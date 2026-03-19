# frozen_string_literal: true

require_relative "string_toolbox/version"

# Основной модуль гема
module StringToolbox
  class Error < StandardError; end

  # Обрезает строку до указанной длины, добавляя "..." в конце
  def self.truncate(string, max_length: 30, omission: "...")
    return string if string.length <= max_length

    "#{string[0...(max_length - omission.length)]}#{omission}"
  end

  # Преобразует строку в URL-friendly slug
  def self.slugify(string)
    string
      .downcase
      .strip
      .gsub(/[^\p{L}\p{N}\s_-]/, "") # убираем спецсимволы (unicode-safe)
      .gsub(/[\s_]+/, "-")   # пробелы и _ -> дефис
      .gsub(/-+/, "-")       # множественные дефисы -> один
      .gsub(/^-|-$/, "")     # убираем дефисы по краям
  end

  # Преобразует строку в camelCase
  def self.camelize(string)
    parts = string.split(/[\s_-]+/)
    parts.first.downcase + parts[1..].map(&:capitalize).join
  end

  # Подсчитывает количество слов в строке
  def self.word_count(string)
    string.split(/\s+/).reject(&:empty?).length
  end
end
