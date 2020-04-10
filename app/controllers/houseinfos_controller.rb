class HouseinfosController < ApplicationController
    # before_action :set_houseinfo,only: [:show, :edit, :new, :update, :destroy]
  
    def index
      @houseinfos = Houseinfo.all
    end
  
    def new
      @houseinfo = Houseinfo.new
      2.times { @houseinfo.nearstations.new }
      # @houseinfo.nearstation.build
    end
  
    def create
      @houseinfo = Houseinfo.new(houseinfo_params)
      # respond_to do |format|
        if @houseinfo.save
            redirect_to houseinfos_path, notice: "物件情報を作成しました！"
        else
            render :new
        end
    end
    
    
    def show
      @houseinfo = Houseinfo.find(params[:id])
      # @houseinfo.nearstations.build
      # 2.times { @houseinfo.nearstations.build }
      # @nearstations = @houseinfo.nearstations
    end
  
    def edit
      @houseinfo = Houseinfo.find(params[:id])
      @houseinfo.nearstations.new
      # 2.times { @houseinfo.nearstations.build }
      # redirect_to houseinfos_path, notice: "物件情報を編集しました！"
    end

    def update
      @houseinfo = Houseinfo.find(params[:id])
      if @houseinfo.update(houseinfo_params)
        redirect_to houseinfos_path, notice: "物件情報を編集しました！"
      else
        render :edit
      end
    end
    
    def destroy
      @houseinfo = Houseinfo.find(params[:id])
      @houseinfo.destroy
      redirect_to houseinfos_path, notice:"物件情報を削除しました！"
    end
    
    # def confirm
    #   @houseinfo = Houseinfo.new(houseinfo_params)
    #   render :new if @houseinfo.invalid?
    #   # redirect_to user_path(current_user.id), notice: "ブログを編集しました！" if @blog.invalid?   
    # end 

  
    private
  
    def houseinfo_params
      params.require(:houseinfo).permit(:name, :rent, :address, :age, :note, 
                nearstations_attributes: [:routename, :station, :minutes, :id, :destroy])
    end
  
    # idをキーとして値を取得するメソッドを追加
    def set_houseinfo
      # binding.irb
      @houseinfo = Houseinfo.find(params[:id])
    end


end
