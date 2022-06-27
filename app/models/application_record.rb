# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private
  def row_to_array(target, values)
    values.each_line do |line|
      target.push(line.chomp)
    end
  end

  def array_to_row(target)
    target.join("\n") unless target.nil?
  end
end
