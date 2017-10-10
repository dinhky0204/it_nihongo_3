class RateController < ApplicationController
  before_action :authenticate_user!
  def index
    @rates = RateTable.all
    @user = current_user
  end
  def update
    @status = 2
    @rate = RateTable.where(game_id: params['game_id'].to_i, user_id: current_user.id).first
    puts "===========>"
    if @rate!= nil
      if params['comment']!=''
        @rate.message = params['comment']
        @status = 1
      end
      if params['point'].to_i!=0
        @rate.point = params['point']
        @status = 1
      end
      @rate.save
    else
      RateTable.create(game_id: params['game_id'].to_i, user_id: current_user.id, point: params['point'], message: params['comment'])
      @status = 0
    end
    @total = RateTable.where(game_id: params['game_id'].to_i).count
    @star_1 = RateTable.where(game_id: params['game_id'].to_i, point: 1).count
    @star_2 = RateTable.where(game_id: params['game_id'].to_i, point: 2).count
    @star_3 = RateTable.where(game_id: params['game_id'].to_i, point: 3).count
    @star_4 = RateTable.where(game_id: params['game_id'].to_i, point: 4).count
    @star_5 = RateTable.where(game_id: params['game_id'].to_i, point: 5).count
    total_point = @star_1 + 2*@star_2 + 3*@star_3 + 4*@star_4 + 5*@star_5
    if @total==0
      @point_avg = 0
      gon.point1 = 0
      gon.point2 = 0
      gon.point3 = 0
      gon.point4 = 0
      gon.point5 = 0
    else
      @point_avg = (100*total_point/@total).round / 100.0
      @point1 = (100*@star_1/@total).to_s + "%"
      @point2 = (100*@star_2/@total).to_s + "%"
      @point3 = (100*@star_3/@total).to_s + "%"
      @point4 = (100*@star_4/@total).to_s + "%"
      @point5 = (100*@star_5/@total).to_s + "%"
    end

    respond_to do |format|
      format.json do
        render json: [{
            status: @status,
            new_point: @point_avg,
            total: @total,
            star1: @star_1,
            star2: @star_2,
            star3: @star_3,
            star4: @star_4,
            star5: @star_5,
            point1: @point1,
            point2: @point2,
            point3: @point3,
            point4: @point4,
            point5: @point5
        }].to_json
      end
    end
  end
end
