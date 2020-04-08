class HouseinfosController < ApplicationController
    before_action :set_houseinfo, only: [:show, :edit, :update, :destroy]
  
    def index
      @houseinfos = Houseinfo.all
    end
  
    def new
        @houseinfo =  Houseinfo.new
        2.times { @houseinfo.nearstations.build }
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
      @nearstations = @houseinfo.nearstations
    end
  
    def edit
        @houseinfo = Houseinfo.find(params[:id])
    end

    def update
      # @blog = Blog.find(params[:id])
      if @houseinfo.update(houseinfo_params)
        redirect_to houseinfo_path, notice: "物件情報を編集しました！"
      else
        render :edit
      end
    end
    
    def destroy
      @houseinfo.destroy
      redirect_to houseinfo_path, notice:"物件情報を削除しました！"
    end
    
    def confirm
      @houseinfo = Houseinfo.new(houseinfo_params)
      render :new if @houseinfo.invalid?
      # redirect_to user_path(current_user.id), notice: "ブログを編集しました！" if @blog.invalid?   
    end 
  
    private
  
    def houseinfo_params
      params.require(:houseinfo).permit(:name, :rent, :address, :age, :note, 
                nearstation_attributes: [:routename, :station, :minutes, :id, :destroy])
    end
  
    # idをキーとして値を取得するメソッドを追加
    def set_houseinfo
      @houseinfo = Houseinfo.find(params[:id])
    end


end
