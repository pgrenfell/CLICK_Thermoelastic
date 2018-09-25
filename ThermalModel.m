%Thermal Model of a Cylinder
%Face 1 is the outer round surface which is assumed adiabatic
%Face 2 is the high temperature face, 100 C
%Face 3 is the low temperature face, 0 C
%The Initial Condition is 0 C everywhere except at the high temperature
%face e.g. a cold rod that is being exposed to a high temperature input at
%one face.
%The properties are those of 6061 Aluminum
%The time scale is 10000 sec (this is a slow process)

tm = createpde('thermal','transient');
importGeometry(tm, 'cylinder.stl');
thermalProperties(tm,'ThermalConductivity',167,'MassDensity',2700,'SpecificHeat',0.896);
thermalBC(tm,'Face',1,'HeatFlux',0);
thermalBC(tm,'Face',2,'HeatFlux',100);
thermalBC(tm,'Face',3,'HeatFlux',-10);
thermalIC(tm, 25);
thermalIC(tm, 10, 'Face', 2);
generateMesh(tm);
pdeplot3D(tm);
time = 0:1:1000;
results = solve(tm,time);
pdeplot3D(tm,'ColorMapData',results.Temperature(:,end));

