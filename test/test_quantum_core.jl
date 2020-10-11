

function test_constructors()
   x2=ket_zero(2) # x=|00>
   @test length(x2)==2^2 
   @test x2[1]==1.0
   @test x2[2]==0.0
   @test x2[3]==0.0
   @test x2[4]==0.0

   x3=ket_zero(3) # x=|000>
   @test length(x3)==2^3 
   @test x3[1]==1.0
   @test x3[2]==0.0
   @test x3[8]==0.0
end

function test_X()
   x=ket_zero(3)  # |000>
   X!(x,1)        # |001>
   @test x==[0.0,1.0,0,0,0,0,0,0]
   X!(x,2)        # |011>
   @test x==[0.0,0,0,1.0,0,0,0,0]
end


# finally run tests
test_constructors()
test_X()
