class InitiativesController < ApplicationController
  def create
    initiative = Initiative.new(params[:initiative])
    initiative.save
    redirect_to initiative
  end
end
