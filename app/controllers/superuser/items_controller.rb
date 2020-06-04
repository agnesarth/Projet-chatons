class Superuser::ItemsController < Superuser::BaseController
    before_action :check_if_superuser

    def show       
    end

    def new
        @item = Item.new
        respond_to do |format|
            format.html { redirect_to new_superuser_item_path }
            format.js { }
        end   
    end

      
    def create
        @item = Item.create!(item_params)
        @item.photo.attach(params[:photo])
        if @item.save
          redirect_to root_path
        end
    end

    def edit
        @item = Item.find(params[:id])
    end
    
      def update

    end

end