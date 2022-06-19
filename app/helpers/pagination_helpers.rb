module PaginationHelpers
    def limit
        params[:limit].to_i.zero? ? 100 : params[:limit].to_i 
    end

    def offset
        p_offset = params[:offset].to_i
    end

  
end
