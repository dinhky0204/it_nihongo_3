module RateHelper
    def self.point_avg(id)
        @total = RateTable.where(game_id: id).count

        @star_1 = RateTable.where(game_id: id, point: 1).count
        @star_2 = RateTable.where(game_id: id, point: 2).count
        @star_3 = RateTable.where(game_id: id, point: 3).count
        @star_4 = RateTable.where(game_id: id, point: 4).count
        @star_5 = RateTable.where(game_id: id, point: 5).count
        total_point = @star_1 + 2*@star_2 + 3*@star_3 + 4*@star_4 + 5*@star_5
        if @total==0
          @point_avg = 0
        else
          @point_avg = (100*total_point/@total).round / 100.0
        end
        return @point_avg
    end
end
