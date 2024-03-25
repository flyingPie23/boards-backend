class Api::V1::PostsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_post, only: [:update, :destroy]

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.board = Board.find(params[:board_id])

    authorize @post
    if @post.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @post.update(post_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :content, :board_id)
  end
end
