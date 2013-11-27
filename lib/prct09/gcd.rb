def gcd(u, v)
  u, v = u.abs, v.abs
  if (u==0 or v==0) #Con esta modificación podemos usar esta función tb para reducir
	return 1
  else
     while v > 0
        u, v = v, u % v
     end
    return u
  end
end
