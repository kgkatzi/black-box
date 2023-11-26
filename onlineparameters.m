function dx= onlineparameters(t,x,tspan,y, phi, gamma,i)


index=find(tspan==int32(t));   %find index
if i==2   %for degree
dx=zeros(3,1);
dx(1)=gamma*(y(index)-x(1)*phi(index,1)-x(2)*phi(index,2)-x(3)*phi(index,3))*phi(index,1);
dx(2)=gamma*(y(index)-x(1)*phi(index,1)-x(2)*phi(index,2)-x(3)*phi(index,3))*phi(index,2);
dx(3)=gamma*(y(index)-x(1)*phi(index,1)-x(2)*phi(index,2)-x(3)*phi(index,3))*phi(index,3);
else
dx=zeros(2,1);
dx(1)=gamma*(y(index)-x(1)*phi(index,1)-x(2)*phi(index,2))*phi(index,1);
dx(2)=gamma*(y(index)-x(1)*phi(index,1)-x(2)*phi(index,2))*phi(index,2);
end

end