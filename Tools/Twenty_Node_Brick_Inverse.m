function Twenty_Node_Brick_Inverse = Twenty_Node_Brick_Inverse()

	% shape function coordinates  coefficients
	Brick_Coordinates(1 ,:)=[ 1, 1, 1]; 
	Brick_Coordinates(2 ,:)=[-1, 1, 1]; 
	Brick_Coordinates(3 ,:)=[-1,-1, 1]; 
	Brick_Coordinates(4 ,:)=[ 1,-1, 1]; 
	Brick_Coordinates(5 ,:)=[ 1, 1,-1]; 
	Brick_Coordinates(6 ,:)=[-1, 1,-1]; 
	Brick_Coordinates(7 ,:)=[-1,-1,-1]; 
	Brick_Coordinates(8 ,:)=[ 1,-1,-1]; 
	Brick_Coordinates(9 ,:)=[ 0, 1, 1]; 
	Brick_Coordinates(10,:)=[-1, 0, 1];
	Brick_Coordinates(11,:)=[ 0,-1, 1];
	Brick_Coordinates(12,:)=[ 1, 0, 1];
	Brick_Coordinates(13,:)=[ 0, 1,-1];
	Brick_Coordinates(14,:)=[-1, 0,-1];
	Brick_Coordinates(15,:)=[ 0,-1,-1];
	Brick_Coordinates(16,:)=[ 1, 0,-1];
	Brick_Coordinates(17,:)=[ 1, 1, 0];
	Brick_Coordinates(18,:)=[-1, 1, 0];
	Brick_Coordinates(19,:)=[-1,-1, 0];
	Brick_Coordinates(20,:)=[ 1,-1, 0];
	Brick_Coordinates(21,:)=[ 0, 0, 0];
	Brick_Coordinates(22,:)=[ 0, 1, 0];
	Brick_Coordinates(23,:)=[-1, 0, 0];
	Brick_Coordinates(24,:)=[ 0,-1, 0];
	Brick_Coordinates(25,:)=[ 1, 0, 0];
	Brick_Coordinates(26,:)=[ 0, 0, 1];
	Brick_Coordinates(27,:)=[ 0, 0,-1];


	% gauss coordinates coefficients 
	Brick_20_Gauss_Coordinates(1 ,:)=[-1,-1,-1]; 
	Brick_20_Gauss_Coordinates(2 ,:)=[-1,-1, 0]; 
	Brick_20_Gauss_Coordinates(3 ,:)=[-1,-1, 1]; 
	Brick_20_Gauss_Coordinates(4 ,:)=[-1, 0,-1]; 
	Brick_20_Gauss_Coordinates(5 ,:)=[-1, 0, 1]; 
	Brick_20_Gauss_Coordinates(6 ,:)=[-1, 1,-1]; 
	Brick_20_Gauss_Coordinates(7 ,:)=[-1, 1, 0]; 
	Brick_20_Gauss_Coordinates(8 ,:)=[-1, 1, 1]; 
	Brick_20_Gauss_Coordinates(9 ,:)=[ 0,-1,-1];
	Brick_20_Gauss_Coordinates(10,:)=[ 0,-1, 1];
	Brick_20_Gauss_Coordinates(11,:)=[ 0, 1,-1];
	Brick_20_Gauss_Coordinates(12,:)=[ 0, 1, 1];
	Brick_20_Gauss_Coordinates(13,:)=[ 1,-1,-1];
	Brick_20_Gauss_Coordinates(14,:)=[ 1,-1, 0];
	Brick_20_Gauss_Coordinates(15,:)=[ 1,-1, 1];
	Brick_20_Gauss_Coordinates(16,:)=[ 1, 0,-1];
	Brick_20_Gauss_Coordinates(17,:)=[ 1, 0, 1];
	Brick_20_Gauss_Coordinates(18,:)=[ 1, 1,-1];
	Brick_20_Gauss_Coordinates(19,:)=[ 1, 1, 0];
	Brick_20_Gauss_Coordinates(20,:)=[ 1, 1, 1];

	Twenty_Node_Brick_Inverse = zeros(20,20);

	SQRT_3_5 = sqrt(3/5);

	for j=1:20	% Gauss Point Coordinates
		for i=1:8 % Shape Functions
			Twenty_Node_Brick_Inverse(j,i) = 1/8*(1+Brick_Coordinates(i,1)*Brick_20_Gauss_Coordinates(j,1)*SQRT_3_5)* ...
												 (1+Brick_Coordinates(i,2)*Brick_20_Gauss_Coordinates(j,2)*SQRT_3_5)* ...
												 (1+Brick_Coordinates(i,3)*Brick_20_Gauss_Coordinates(j,3)*SQRT_3_5)* ...
												 (-2+ (Brick_Coordinates(i,1)*Brick_20_Gauss_Coordinates(j,1)*SQRT_3_5)+ ...
												     (Brick_Coordinates(i,2)*Brick_20_Gauss_Coordinates(j,2)*SQRT_3_5)+ ...
												     (Brick_Coordinates(i,3)*Brick_20_Gauss_Coordinates(j,3)*SQRT_3_5));
		end
		for i=[9,11,13,15]
			Twenty_Node_Brick_Inverse(j,i) = 1/4*(1-(Brick_20_Gauss_Coordinates(j,1)*SQRT_3_5)^2)* ...
												 (1+Brick_Coordinates(i,2)*Brick_20_Gauss_Coordinates(j,2)*SQRT_3_5)* ...
												 (1+Brick_Coordinates(i,3)*Brick_20_Gauss_Coordinates(j,3)*SQRT_3_5);
		end
		for i=[10,12,14,16]
			Twenty_Node_Brick_Inverse(j,i) = 1/4*(1-(Brick_20_Gauss_Coordinates(j,2)*SQRT_3_5)^2)* ...
												 (1+Brick_Coordinates(i,1)*Brick_20_Gauss_Coordinates(j,1)*SQRT_3_5)* ...
												 (1+Brick_Coordinates(i,3)*Brick_20_Gauss_Coordinates(j,3)*SQRT_3_5);
		end
		for i=[17,18,19,20]
			Twenty_Node_Brick_Inverse(j,i) = 1/4*(1-(Brick_20_Gauss_Coordinates(j,3)*SQRT_3_5)^2)* ...
												 (1+Brick_Coordinates(i,1)*Brick_20_Gauss_Coordinates(j,1)*SQRT_3_5)* ...
												 (1+Brick_Coordinates(i,2)*Brick_20_Gauss_Coordinates(j,2)*SQRT_3_5);
		end

	end

	Twenty_Node_Brick_Inverse

	Twenty_Node_Brick_Inverse = inv(Twenty_Node_Brick_Inverse);

end

