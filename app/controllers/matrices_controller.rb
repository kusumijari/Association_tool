class MatricesController < ApplicationController
  before_action :set_matrix, only: [:show, :edit, :update, :destroy]

  # GET /matrices
  # GET /matrices.json
  def index
    @matrices = Matrix.all
  end

  # GET /matrices/1
  # GET /matrices/1.json
  def show
  end

  # GET /matrices/new
  def new
    @matrix = Matrix.new
    @drinks = Drink.all
    @drink = @drinks.first
    @associate_with = @drinks.reject { | d | d ==  Drink.find(@drink.id) } 
  end

  # GET /matrices/1/edit
  def edit
  end

  # POST /matrices
  # POST /matrices.json
  def create  
    @matrix = Matrix.new(matrix_params)

    respond_to do |format|
      if @matrix.save
        format.html { redirect_to @matrix, notice: 'Matrix was successfully created.' }
        format.json { render :show, status: :created, location: @matrix }
      else
        format.html { render :new }
        format.json { render json: @matrix.errors, status: :unprocessable_entity }
      end
    end
  end

  def matrix_entry
    @drinks = Drink.all
    @drink = Drink.find_by_name(params[:name])
    @matrix = Matrix.all
    drink_list = []
    @matrix.each do |entry|
      if entry['Drink2'] == @drink.name
        drink_list.push(entry['Drink1'])
      end
    end

    @associate_with = @drinks.reject { | d | (drink_list.include?(d.name) || d == Drink.find(@drink.id)) } 
  end

  def save_entry
    puts "testing ***********"
    puts "Params " + params[:drinkName]
    drinkName = params[:drinkName]
    @drinks = Drink.all
    @drink = Drink.find_by_name(drinkName)
    puts "Drink is " + @drink.name
    @associate_with = @drinks.reject { | d | d ==  Drink.find(@drink.id) }
    @associate_with.each do | associate |
      puts "******************"  + associate.name
      if !params[:query_parameters][associate.name].nil?
        puts "Drink 1" + drinkName
        puts "Drink 2" + associate.name
        puts "Value " + params[:query_parameters][associate.name]
        matrix_entry = Matrix.new('Drink1' => drinkName, 'Drink2' => associate.name, 'Value' => params[:query_parameters][associate.name])
        is_present = Matrix.where(:Drink1=>drinkName).where(:Drink2=>associate.name).first
        is_also_present = Matrix.where(:Drink1=>associate.name).where(:Drink2=>drinkName).first
        puts "Is it present ? " + is_present.nil?.to_s + "################################# " + is_also_present.nil?.to_s 
        if is_present.nil? && is_also_present.nil?
          matrix_entry.save
        else
          entry = is_present.nil? ? is_also_present : is_present
          entry['Drink1'] = drinkName
          entry['Drink2'] = associate.name
          entry['Value'] =  params[:query_parameters][associate.name]
          entry.save
        end
      end
    end
        next_id = @drink.id + 1
        if !Drink.exists?(next_id)
          redirect_to completed_path and return
        else
          @drink = Drink.find(next_id)
          puts "More drinks remaining and it is " + @drink.name
          redirect_to controller: 'matrices', action: 'matrix_entry', name: @drink.name and return
        end

  end

  def completed
  end

  # PATCH/PUT /matrices/1
  # PATCH/PUT /matrices/1.json
  def update
    respond_to do |format|
      if @matrix.update(matrix_params)
        format.html { redirect_to @matrix, notice: 'Matrix was successfully updated.' }
        format.json { render :show, status: :ok, location: @matrix }
      else
        format.html { render :edit }
        format.json { render json: @matrix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matrices/1
  # DELETE /matrices/1.json
  def destroy
    @matrix.destroy
    respond_to do |format|
      format.html { redirect_to matrices_url, notice: 'Matrix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matrix
      @matrix = Matrix.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matrix_params
      params.require(:matrix).permit(:Drink1, :Drink2, :Value)
    end
end
