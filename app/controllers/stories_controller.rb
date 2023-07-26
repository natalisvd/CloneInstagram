class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.new(story_params)
    respond_to do |format|
      if @story.save
        format.html { redirect_to root_path, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity, alert: @story.errors.full_messages }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def story_params
    params.require(:story).permit(:text, :user_id, :image)
  end
end
