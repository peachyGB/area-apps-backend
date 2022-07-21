class InteractionsController < ApplicationController
    #     #GET /interactions
    # def index
    #     interactions = Interaction.all
    #     render json: interactions, except: [:created_at, :updated_at]
    # end

    # #GET /interactions/:id
    # def show
    #     interaction = Interaction.find_by(id: params[:id])
    #     if interaction
    #         render json: interaction
    #     else
    #         render json: { error: "Interaction not found" }, status: :not_found
    #     end
    # end

#     #POST /interactions
#     def create
#         interaction = Interaction.create(interaction_params)
#         render json: interaction, status: :created
#     end


#     #PATCH /interactions/:id
#     def update
#         interaction = Interaction.Find_by(id: params[:id])
#         if interaction
#             interaction.update(interaction_params)
#             render json: interaction
#         else
#             render json: { error: "Interaction not found" }, status: :not_found
#         end
#     end

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

# private

#     def interaction_params
#       params.permit(:name, :category, :cost, :points)
#     end
end
