# frozen_string_literal: true
class Case < ActiveRecord::Base
  def self.get_random
    Case.order('RANDOM()').take(1);
  end
end
