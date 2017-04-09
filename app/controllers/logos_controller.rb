# frozen_string_literal: true
# Simple controller for rendering the logo page
class LogosController < ApplicationController
  def show
    render layout: false
  end
end
