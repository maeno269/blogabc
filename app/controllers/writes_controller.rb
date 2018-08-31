class WritesController < ApplicationController

  before_action :move_to_index, except: [:index, :random]

  def index
    @writes = Write.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end
  def new
    @write = Write.new
  end
  def create
    Write.create(image: write_params[:image], text: write_params[:text], user_id: current_user.id, introduction: write_params[:introduction])
  end

  def destroy
    write = Write.find(params[:id])
    write.destroy if write.user_id == current_user.id
  end
  def edit
      @write = Write.find(params[:id])
  end

  def update
      write = Write.find(params[:id])
      if write.user_id == current_user.id
        write.update(write_params)
      end
  end

  def show
    @write = Write.find(params[:id])
    @comments = @write.comments.includes(:user)
    @comment = Comment.new
    @introductions = @write.introduction
  end
  def random
    @random = Write.order("RAND()").first

    # random = Write.includes(:user).order("id DESC").first
    # number = random.id
    # answer = random_method(number)

    # @random = Write.find(answer)
  end

  private

  # def random_method(num)
  #   until Write.exists?(id: rannum)

  #       random = Random.new()
  #       1.times do
  #       rannum = random.rand(1..num)

  #         if Write.exists?(id: rannum)
  #           return
  #         end
  #       return
  #     end
  #   end
  # end

  def write_params
    params.require(:write).permit(:image, :text, :introduction)
  end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
  end
end
