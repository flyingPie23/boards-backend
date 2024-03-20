class Api::V1::BoardsController < Api::V1::BaseController
  before_action :set_board, only: [:show]

  def index
    @boards = policy_scope(Board)
  end

  def show
  end

  private

  def set_board
    @board = Board.find(params[:id])
    authorize @board  # For Pundit
  end

end
