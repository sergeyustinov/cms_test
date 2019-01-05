class Cms::SearchController < Cms::CmsController
  def index
    sign_in(User.first) # @todo implement UI devise sign in

    @search = SearchService.new(
      current_user: current_user,
      klasses: [params[:klass] || 'Product'],
      filters: params[:filters]
    )

    @objects = @search.search(params[:term])
  end
end
