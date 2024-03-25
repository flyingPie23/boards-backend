class Api::V1::BoardsController < Api::V1::BaseController
  before_action :set_board, only: [:show, :update]

  def index
    @boards = policy_scope(Board)
  end

  def show
  end

  def update
    if @board.update(board_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
    authorize @board  # For Pundit
  end

  def board_params
    params.require(:board).permit(:name, :bio, :banner_url)
  end

  def render_error
    render json: { errors: @board.errors.full_messages },
      status: :unprocessable_entity
  end

end
