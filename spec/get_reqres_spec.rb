context 'Reqres API' do

      describe 'List Users (GET)' do   
          before :context do
              @reqres = Reqres.get('/api/users?page=2')
          end 
  
          it 'Get all users - Status code 200' do            
              expect(@reqres.code).to eq(200)
          end
  
          #it 'Get all pokemons - Valid name' do           
              #expect(@reqres['data']['pokemons'][0]['name']).to eq('Bulbasaur')
          #end
      end

      describe 'Get single User (GET)' do
        before :context do
            @reqres = Reqres.get('/api/users/2')
        end 

        it 'Get single user - Status code 200' do            
            expect(@reqres.code).to eq(200)
        end

        it 'Get single User - With first name Janet' do
            expect(@reqres['data']['first_name']).to eq('Janet')
        end
    end

    describe 'Get single user not found (GET)' do
        before :context do
            @reqres = Reqres.get('/api/users/23')
        end 

        it 'Get single user not found - Status code 404' do            
            expect(@reqres.code).to eq(404)
        end
    end

    describe 'List resource (GET)' do
        before :context do
            @reqres = Reqres.get('/api/unknown')
        end 

        it 'List resource - Status code 200' do            
            expect(@reqres.code).to eq(200)
        end

        it 'Total first page is 12' do
            expect(@reqres['total']).to eq(12)
        end


    end

end
