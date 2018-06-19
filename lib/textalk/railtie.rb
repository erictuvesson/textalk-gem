# frozen_string_literal: true

require 'rails'

module Textalk
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/textalk_tasks.rake'
    end
  end
end
