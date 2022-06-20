class ApplicationController < ActionController::Base
    include PaginationHelpers

    before_action :get_filter, if: lambda { |allow|  request.method == 'GET' and params[:filters].present? }
    def get_filter
        filters = JSON.parse(params[:filters]).nested_under_indifferent_access  rescue {}
        self.params = params.except(:filters).merge(filters)
    end
end
