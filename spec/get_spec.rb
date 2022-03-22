context 'Pokemon API Test' do

    describe 'List Pokemon (GET)' do   
        before :context do
            @poke = Poke.get('/api/pokemon/list')
        end 

        it 'Get all pokemons - Status code 200' do            
            expect(@poke.code).to eq(200)
        end

        it 'Get all pokemons - Valid name' do           
            expect(@poke['data']['pokemons'][0]['name']).to eq('Bulbasaur')
        end
    end

    describe 'Get Pokemon (GET)' do   
        before :context do
            @poke = Poke.get('/api/pokemon/Bulbasaur')
        end 

        it 'Get one pokemon - Status code 200' do            
            expect(@poke.code).to eq(200)
        end

        it 'Get one pokemon - Valid name' do     
            expect(@poke['data']['name']).to eq('Bulbasaur')
            #puts @poke['data']      
        end
    end

    describe 'Add Pokemon (POST)' do   
        before :context do
            @new_poke = {
                :name => "PokeLucio9",
                :imageUrl => "http://serebii.net/xy/pokemon/001.png"
            }
            @header = { 'Content-Type' => 'application/json'}
            @poke = Poke.post('/api/pokemon/add', :body => @new_poke.to_json, :headers => @header)      
        end 

        it 'Add pokemon - Status code 201' do            
            expect(@poke.code).to eq(201)
        end

        it 'Add pokemon - Json response sucess' do     
            expect(@poke['success']).to eq(true)
        end
    end

    describe 'Delete Pokemon (POST)' do   
        before :context do
            @poke = Poke.delete('/api/pokemon/PokeLucio9')      
        end 

        it 'Delete Pokemon - Status code 201' do            
            expect(@poke.code).to eq(200)
        end

        it 'Delete Pokemon - Json response sucess' do     
            expect(@poke['success']).to eq(true)
        end
    end
end