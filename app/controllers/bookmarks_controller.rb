class BookmarksController < ApplicationController
def new
  @list = List.find(params[:list_id])
  @bookmark = Bookmark.new
end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.select { |movie| movie.title == params[:bookmark][:movie] }[0]
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
