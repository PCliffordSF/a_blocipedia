class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    render :index
  end

  def new
    @wiki = Wiki.new
    render :new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
