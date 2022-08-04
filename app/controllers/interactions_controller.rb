class InteractionsController < ApplicationController
    #GET /interactions
    def index
        interactions = Interaction.all
        render json: interactions
    end

    #GET /interactions/:id
    def show
        interaction = Interaction.find_by(id: params[:id])
        if interaction
            render json: interaction
        else
            render json: { error: "Interaction not found" }, status: :not_found
        end
    end

    #GET /users/:id/interactions
    def userInt
        user = User.find_by(id: params[:id])
        und = "undefined"
        puts user
        if user
            render json: user.interactions
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    #   POST /users/:id/interactions
    def interact
        bus = Business.find_by(appName: params[:appName])
        if bus
            int = Interaction.find_by(business_id: bus.id)
            if int
                updateInt = int.update(interaction_params)
                render json: int               
            else
                newInt = Interaction.create(bookmark: true, download: false, error_report: false, rating: 0, user_id: params[:id], business_id: bus.id)
                render json: newInt
            end
        else
            newBiz = Business.create(bus_params)
            newInt = Interaction.create(bookmark: true, download: false, error_report: false, rating: 0, user_id:params[:id], business_id: newBiz.id)
            render json: newInt
        end
    end

    #PATCH /interactions/:id
    def update
        inter = Interaction.find_by(id: params[:id])
        if inter
            inter.update(interaction_params)
            
            render json: inter, status: :ok
        else
            render json: { error: "Interaction not found" }, status: :not_found
        end
    end

    #GET /errors
    def errlist
        list = Interaction.where(error_report: true)
        render json: list
    end

    #     #DELETE /interactions/:id
    #     def destroy
    #     interaction = Interaction.find_by(id: params[:id])
    #         if interaction
    #             interaction.destroy
    #             render json: {}
    #         else
    #             render json: { error: "interaction not found" }, status: :not_found
    #         end
    #     end

    private

    def interaction_params
        params.permit(:bookmark, :download, :error_report, :rating, :user_id, :business_id)
    end

    def bus_params
        params.permit(:busName, :appName, :link, :appImage, :address, :category)
    end
    
end
