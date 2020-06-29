class MemosController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  # GET /memos
  # GET /memos.json
  def index
    @memos = current_user.memos
  end

  # GET /memos/1
  # GET /memos/1.json
  def show
  end

  # GET /memos/new
  def new
    @memo = Memo.new
    @emojis = current_user.emojis
  end

  # GET /memos/1/edit
  def edit
    @emojis = current_user.emojis
  end

  # POST /memos
  # POST /memos.json
  def create
    @memo = current_user.memos.build(memo_params)

    respond_to do |format|
      if @memo.save
        format.html { redirect_to @memo, notice: 'Memo was successfully created.' }
        format.json { render :show, status: :created, location: @memo }
      else
        @emojis = current_user.emojis
        format.html { render :new }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memos/1
  # PATCH/PUT /memos/1.json
  def update
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to @memo, notice: 'Memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo }
      else
        @emojis = current_user.emojis
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memos/1
  # DELETE /memos/1.json
  def destroy
    @memo.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memo
      @memo = current_user.memos.find_by(id: params[:id])
      if !@memo
        redirect_to root_url
      end
    end

    # Only allow a list of trusted parameters through.
    def memo_params
      params.require(:memo).permit(:user_id, :emoji_id, :title, :content)
    end
end
