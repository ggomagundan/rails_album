class PaintingsController < ApplicationController

  def index
    @paintings = Painting.all

    respond_to do |format|
      format.html #index.html.erb
      format.json {render json: @paintings }
    end
  end

  # GET /painting/1
  # GET /painting/1.json
  def show
    @painting = Painting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @painting }
    end
  end

  def new
    @painting = Painting.new()

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @painting }
    end

  end

  def create
    @painting = Painting.new(params[:painting])
    if @painting.save
      flash[:notice] = "Successfully created painting."
      redirect_to paintings_path
    else
      render :action => 'new'
    end
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(params[:painting])
      flash[:notice] = "Successfully updated painting."
      redirect_to paintings_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to painting_path
  end
end
