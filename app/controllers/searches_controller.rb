class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search_result
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == 'party'
      @records = Party.search_by_name(@content)
    elsif @model == 'tag'
      @records = Tag.search_by_name(@content)
    end
  end
end