class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
    @group.horaries.build
    @horaries_count = @group.horaries.length
  end

  # GET /groups/1/edit
  def edit
    @horaries_count = @group.horaries.length
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  def add_horary
    @horaries = params[:horaries]
    @horaries_count = @horaries.to_i + 1

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      if params[:group][:modality] && params[:group][:horaries_attributes]
        return group_permitted_params.merge(horaries_attributes: horaries_permitted_params).
          merge(modality: Modality.find(group_permitted_params[:modality]))
      elsif params[:group][:modality]
        return group_permitted_params.
          merge(modality: Modality.find(group_permitted_params[:modality]))
      else
        return group_permitted_params
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_permitted_params
      params.require(:group).permit(:name, :description, :price, :time, :local, :start, :end, :modality)
    end

    def horaries_permitted_params
      params.require(:group).require(:horaries_attributes).permit!
    end
end
