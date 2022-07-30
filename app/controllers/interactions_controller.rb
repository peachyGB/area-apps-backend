class InteractionsController < ApplicationController
    #GET /interactions
    def index
        interactions = Interaction.all
        render json: interactions
        # , except: [:created_at, :updated_at]
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
        if user
            render json: user.interactions
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    #   POST /users/:id/interactions/:business
    def interact
        # byebug
        bus = Business.find_by(appName: params[:business])
        if bus
            int = Interaction.find_by(business_id: bus.id)
            if int
                updateInt = Interaction.update(interaction_params)
                render json: updateInt
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
        interaction = Interaction.find_by(id: params[:id])
        if interaction
            interaction.update(interaction_params)
            
            render json: interaction, status: :ok
        else
            render json: { error: "Interaction not found" }, status: :not_found
        end
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
