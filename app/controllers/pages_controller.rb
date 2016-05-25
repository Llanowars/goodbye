class PagesController < ApplicationController
  def home
  end

  def customform
    @unsubs = Unsub.all
  end
end

