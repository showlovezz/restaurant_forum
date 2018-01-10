class FollowshipsController < ApplicationController
	def create
		@followship = current_user.followships.build(following_id: params[:following_id])

		if @followship.save
			flash[:notice] = "成功追蹤"
			redirect_back(fallback_location: root_path)
		else
			flash[:alert] = @followship.errors.full_messages.to_sentence
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		# where 會回傳物件集合(Array)，需要串接可取出單一物件的方法如 first
		@followship = current_user.followships.where(following_id: params[:id]).first
		@followship.destroy
		flash[:alert] = "取消追蹤"
		redirect_back(fallback_location: root_path)
	end
		
end
