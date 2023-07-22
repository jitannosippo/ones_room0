class Admin::StylesController < ApplicationController
  def index
	  @styles = Style.all
  end
  def create
  	style = Style.new(style_params)
  	style.save
  	redirect_to admin_styles_path
  end
  
  def edit
  	@styles = Style.find(params[:id])
  end
  
  def update
  	styles = Style.find(params[:id])
  	styles.update(style_params)
  	redirect_to admin_styles_path
  end
  
  private
  
  def style_params
  	params.require(:style).permit(:name)
  end
end
