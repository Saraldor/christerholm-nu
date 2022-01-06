module Authors
class ElementsController < AuthorsController
  before_action :set_post
  before_action :set_element, only: [:update, :destroy]

  # GET /element

  # POST /elements
  def create
    @element =@post.elements.build(element_params)

    if @element.save
      redirect_to edit_post_path(@post)
    else
      redirect_to edit_post_path(@post), notice: @element.errors.full_messages.join(". ") << "."
    end
  end

  # PATCH/PUT /elements/1
  def update
    if @element.update(element_params)
      redirect_to edit_post_path(@element.post)
      render :edit
    end
  end

  # DELETE /elements/1
  def destroy
    @element.destroy
    redirect_to edit_post_path(@element.post)
  end

  private
    
  def set_post
  @post = current_author.posts.find(params[:post_id])
  end
  # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = @post.elements.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def element_params
      params.require(:element).permit(:element_type, :content, :image)
    end
end
end