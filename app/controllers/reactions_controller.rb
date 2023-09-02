class ReactionsController < ApplicationController
	before_action :authenticate_user!
 
  def user_reaction
      @user = current_user
      @publication = Publication.find(params[:publication_id])
      reaction = Reaction.find_by(user_id: @user.id, publication_id: @publication.id)
      @kind = params[:kind]
      if reaction
        respond_to do |format|
          format.html { redirect_to publication_path(@publication), alert: 'Ya haz reaccionado a esta publicación'}
        end
      else
          @new_reaction = Reaction.new(user_id: @user.id, publication_id: @publication.id, kind: @kind)
          respond_to do |format|
              if @new_reaction.save!
                  format.html { redirect_to publication_path(@publication), notice: "Haz reaccionado con un #{@new_reaction.kind}"}
              else
                  format.html { redirect_to publication_path(@publication), status: :unprocessable_entity }
              end
          end
      end
  end
end
