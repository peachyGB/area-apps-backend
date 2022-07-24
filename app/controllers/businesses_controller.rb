class BusinessesController < ApplicationController
    #GET /businesses
    def index
        businesses = Business.all
        render json: businesses, except: [:created_at, :updated_at]
    end

    # #GET /businesses/:id
    # def show
    #     business = Business.find_by(id: params[:id])
    #     if business
    #         render json: business
    #     else
    #         render json: { error: "Business not found" }, status: :not_found
    #     end
    # end

#     #POST /businesses
#     def create
#         business = Business.create(business_params)
#         render json: business, status: :created
#     end


#     #PATCH /businesses/:id
#     def update
#         business = Business.Find_by(id: params[:id])
#         if business
#             business.update(business_params)
#             render json: business
#         else
#             render json: { error: "Business not found" }, status: :not_found
#         end
#     end

#     #DELETE /businesses/:id
#     def destroy
#     business = Business.find_by(id: params[:id])
#         if business
#             business.destroy
#             render json: {}
#         else
#             render json: { error: "Business not found" }, status: :not_found
#         end
#     end

# private

#     def business_params
#       params.permit(:name, :category, :cost, :points)
#     end
end
