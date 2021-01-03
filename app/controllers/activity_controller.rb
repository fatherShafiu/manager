class ActivityController < ApplicationController
  authorize_resource :class => "ActivityController"

  def mine
  end

  def feed
  end
end
