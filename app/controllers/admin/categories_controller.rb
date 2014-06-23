class Admin::CategoriesController < AdminController
  before_action :get_category, :only =>[:show, :edit, :destroy, :update]
  
  
  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end
  def show
    #geting dada from get_category
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'Category created'}
      else
        format.html { render action: 'new', alert: 'Error while crearing'}
      end
    end
  end
  def edit
    #geting post from get_post
  end
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to edit_admin_category_path(@category), notice: "Category updated" }
      else
        format.html { render action: 'edit', alert: "Error while editing" }
      end
    end
  end
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: "#{@category.name} deleted"   }
    end
  end  

protected
  def get_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name, :body)
  end
end