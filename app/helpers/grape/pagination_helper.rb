module Grape::PaginationHelper
  extend Grape::API::Helpers

  def establish_pagination_headers(results)
    header['Total'] = results.total_count
    header['Total-Pages'] = results.total_pages
    header['Per-Page'] = results.limit_value
    header['Current-Page'] = results.current_page
  end
end