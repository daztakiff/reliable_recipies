class ChefController < ApplicationController
  def list
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)

      if @chef.save
        redirect_to action: "list"
      else
          render action: "new"
      end
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:id])

   if @chef.update_attributes(chef_params)
      redirect_to action: "show", id: @book
   else
      render action: "edit"
   end
  end

  def delete
    Chef.find(params[:id]).destroy
    redirect_to action: "list"
  end


  def chef_params
    params.require(:chefs).permit(:username)
  end
end
