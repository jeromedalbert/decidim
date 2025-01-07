# frozen_string_literal: true

module Decidim
  class SeedJob < ApplicationJob
    queue_as :seeds

    def perform(class_name, method_name, initializer_params, params)
      class_name.constantize.new(**initializer_params).send(method_name, **params)
    end
  end
end
