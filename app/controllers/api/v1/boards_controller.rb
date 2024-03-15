class Api::V1::BoardsController < Api::V1::BaseController
  def index
    @boards = policy_scope(Board)
  end
end
