# frozen_string_literal: true

# Controlador de la vista principal
class GreetingsController < ApplicationController
  def hello
    render 'hello'
  end
end
