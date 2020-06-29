class EmojisController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_emoji, only: [:show, :edit, :update, :destroy]

  # GET /emojis
  # GET /emojis.json
  def index
    @emojis = current_user.emojis
  end

  # GET /emojis/1
  # GET /emojis/1.json
  def show
  end

  # GET /emojis/new
  def new
    @emoji = Emoji.new
  end

  # GET /emojis/1/edit
  def edit
  end

  # POST /emojis
  # POST /emojis.json
  def create
    @emoji = current_user.emojis.build(emoji_params)

    respond_to do |format|
      if @emoji.save
        format.html { redirect_to @emoji, notice: 'Emoji was successfully created.' }
        format.json { render :show, status: :created, location: @emoji }
      else
        format.html { render :new }
        format.json { render json: @emoji.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emojis/1
  # PATCH/PUT /emojis/1.json
  def update
    respond_to do |format|
      if @emoji.update(emoji_params)
        format.html { redirect_to @emoji, notice: 'Emoji was successfully updated.' }
        format.json { render :show, status: :ok, location: @emoji }
      else
        format.html { render :edit }
        format.json { render json: @emoji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emojis/1
  # DELETE /emojis/1.json
  def destroy
    @emoji.destroy
    respond_to do |format|
      format.html { redirect_to emojis_url, notice: 'Emoji was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emoji
      @emoji = current_user.emojis.find_by(id: params[:id])
      if !@emoji
        redirect_to root_url
      end
    end

    # Only allow a list of trusted parameters through.
    def emoji_params
      params.require(:emoji).permit(:image)
    end
end
