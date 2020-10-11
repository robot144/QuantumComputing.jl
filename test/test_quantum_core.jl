

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

   y3=ket_number(3,7) # x=|111>
   @test length(y3)==2^3 
   @test y3[1]==0.0
   @test y3[7]==0.0
   @test y3[8]==1.0
end

function test_X()
   x=ket_zero(3)  # |000>
   X!(x,1)        # |001>
   @test x==[0.0,1.0,0,0,0,0,0,0]
   X!(x,2)        # |011>
   @test x==[0.0,0,0,1.0,0,0,0,0]

   x2=ket_zero(2)
   y=X(x2,1)
   @test y==[0.0,1,0,0]

   x_mat1=X(1,2)
   @test x_mat1[2,1]==1.0
   x_mat2=X(2,2)
   @test x_mat2[3,1]==1.0
end

function test_Z()
   x=ket_zero(3)  #  |000>
   X!(x,1)        #  |001>
   Z!(x,1)        # -|001>
   @test x==[0.0,-1.0,0,0,0,0,0,0]
   X!(x,2)        # -|011>
   Z!(x,2)        #  |011>
   @test x==[0.0,0,0,1.0,0,0,0,0]

   x2=ket_number(2,1)  # x2=|01>
   y=Z(x2,1)
   @test y==[0.0,-1,0,0]

   z_mat1=Z(1,2)
   @test z_mat1[2,2]==-1.0
   z_mat2=Z(2,2)
   @test z_mat2[3,3]==-1.0
end

function test_H()
   x=ket_zero(1)  #  |0>
   H!(x,1)        #  sqrt(1/2) * ( |0> + |1> )
   @test x≈sqrt(1/2)*[1.0,1.0]
   H!(x,1)        #  H^2 |0> = |0>
   @test x≈[1.0,0]

   x2=ket_number(2,1)  # x2=|01>
   y=H(x2,1)
   @test y≈sqrt(1/2)*[1.0,-1.0,0,0]

   h_mat1=H(1,2)
   @test h_mat1[2,2]≈-sqrt(1/2)
   h_mat2=H(2,2)
   @test h_mat2[2,2]≈sqrt(1/2)
end

# finally run tests
test_constructors()
test_X()
test_Z()
test_H()
