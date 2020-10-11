
#Xm=[0.0 1.0;1.0 0.0]
#Zm=[1.0 0.0;0.0 -1.0]
#Hm=sqrt(0.5)*[1.0 1.0;1.0 -1.0]

#Identities
# H*X*H=Z
# H*Z*H=X
# H*H=I

"""
 function ket_zero(nbits)
 x=ket_zero(2)
 Resulting in: x = |00>
"""
function ket_zero(nbits)
   n=2^nbits
   res=zeros(n)
   res[1]=1.0
   return res
end

"""
 function undigit(d; base=2)
 i=undigit([0,0,1],base=2)
 returns 4 from binary 100. Note least significan bit first.
"""
function undigit(d; base=2)
    s = zero(eltype(d))
    mult = one(eltype(d))
    for val in d
        s += val * mult
        mult *= base
    end
    return s
end

"""
 function X(i::Integer,d::Integer)
 Flip the i'th bit (1-based) of an array of d qbits
  Xm=X(1,1)
  returns
  [0 1;1 0]
"""
function X(i::Integer,d::Integer)
   n=2^d
   res = zeros(n,n)
   bits=zeros(Int64,d)
   for j=0:(n-1)
      digits!(bits,j,base=2)
      bits[i]=1-bits[i]
      it=undigit(bits,base=2)
      res[it+1,j+1]=1.0 #1-based arrays
   end
   return res
end

"""
 function X(v::Vector,i)
 Flip the i'th bit (1-based) of an array of d qbits.
 xnew=X([1,0,0,0],1)   #binary 00
 results in [0,1,0,0]  #binary 01
"""
function X(v::Vector,i)
   res=copy(v)
   X!(res,i)
   return res
end

"""
 function X!(v::Vector,i)
 Flip the i'th bit (1-based) of an array of d qbits IN PLACE.
 v=[1,0,0,0];X!(v,1)   #binary 00
 results in [0,1,0,0]  #binary 01
"""
function X!(v::Vector,i)
   n=length(v)
   mask=1<<(i-1) #only 1 at i'th bit (1-based)
   for j=0:(n-1)
      #println("j=$(j)")
      if (j&mask)==0
        i1=j+1
        i2=(j|mask)+1
        #println("swap $(i1) and $(i2)")
        swap=v[i1]
        v[i1]=v[i2]
        v[i2]=swap
      end
   end
end

"""
 function Z!(v::Vector,i)
 Apply Z to the i'th bit (1-based) of an array of d qbits IN PLACE.
 v=[0,1,0,0];Z!(v,1)   #  |01>
 results in [0,-1,0,0] # -|01>
"""
function Z!(v::Vector,i)
   n=length(v)
   d=Int64(log2(n))
   bits=zeros(Int64,d)
   for j=0:(n-1)
      digits!(bits,j,base=2)
      #println("j=$(j) bits=$(bits)")
      if bits[i]==1
	v[j+1]=-v[j+1]
      end
   end
end

"""
 function H!(v::Vector,i)
 Apply a Hadamard operator the i'th bit (1-based) of an array of d qbits IN PLACE.
 v=[1,0,0,0];H!(v,1)   # |00>
 results in [0,1,0,0]  # sqrt(1/2) ( |00> + |01> )
"""
function H!(v::Vector,i)
   n=length(v)
   d=Int64(log2(n))
   bits=zeros(Int64,d)
   for j=0:(n-1)
      digits!(bits,j,base=2)
      #println("j=$(j) bits=$(bits)")
      if bits[i]==0
        i1=undigit(bits,base=2)
	bits[i]=1-bits[i]
        i2=undigit(bits,base=2)
	#println("swap $(i1) and $(i2)")
        k0=v[i1+1]
	k1=v[i2+1]
	a=sqrt(0.5)
	v[i1+1]=a*k0+a*k1
	v[i2+1]=a*k0-a*k1
      end
   end
end

Nothing
