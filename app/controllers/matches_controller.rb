# frozen_string_literal: true

# Controlador Crud Matches
class MatchesController < ApplicationController
  def index
    @matches = Match.where(matcher_id: params[:matcher_id])
    @matches2 = Match.where(matched_id: params[:matcher_id])
  end

  def create
    @match = Match.new
    match_params = params.permit(:matched_id, :matcher_id)
    @match = Match.create(match_params)
    @match2 = Match.find_by(matcher_id: match_params['matched_id'],
                            matched_id: match_params['matcher_id'])
    if @match2
      @match.status = true
      @match2.status = true
      @match2.save
    end

    if @match.save
      redirect_to list_matches_path(@match.matcher_id), notice: 'Like agregado con éxito'
    else
      redirect_to list_matches_path(@match.matcher_id), notice: 'Ya le diste Like a esa
                                                                 persona'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    if @match.status
      @match2 = Match.find_by(matcher_id: @match.matched_id, matched_id: @match.matcher_id)
      @match.destroy
      @match2.destroy
    else
      @match.destroy
    end
    redirect_to list_matches_path(current_user.id), notice: 'Match eliminado con éxito'
  end
end
