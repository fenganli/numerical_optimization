function varargout = objd(x,mode)

global numf numg numH
argout = 0;
r = norm(x);
rm1 = r-1;
sqrm1 = rm1^2;
phi = atan(x(1)/x(2));
if bitand(mode,1) 
  numf = numf + 1;
  argout = argout + 1;
  if (abs(rm1) <1e-32)
    varargout(argout) = {0};
  else
    varargout(argout) = {sqrm1 - 0.5*sqrm1*cos(1/rm1-phi)};
  end
end
if bitand(mode,2) 
  numg = numg + 1;
  argout = argout + 1;
  if (abs(rm1) < 1e-32)
    varargout(argout) = {[0; 0]};
  else
    sinrphi = sin(1/rm1-phi);
    dfdr = 2*rm1 - 0.5*(sinrphi + 2*rm1*cos(1/rm1-phi));
    dfdphi = -0.5*sqrm1*sinrphi;
    rsq = r^2;
    varargout(argout) = {[x(1)*dfdr/r + dfdphi*x(2)/rsq; x(2)*dfdr/r - dfdphi*x(1)/rsq]};
  end
end
if bitand(mode,4) 
  numH = numH + 1;
  argout = argout + 1;
  if (abs(rm1) < 1e-32)
    varargout(argout) = {[0 0; 0 0]};
  else
    sinrphi = sin(1/rm1-phi);
    cosrphi = cos(1/rm1-phi);
    dfdr = 2*rm1 - 0.5*(sinrphi + 2*rm1*cosrphi);
    dfdphi = -0.5*sqrm1*sinrphi;
    rsq = r^2;
    drdx1 = x(1)/r;
    drdx2 = x(2)/r;
    dphidx1 = x(2)/rsq;
    dphidx2 = -x(1)/rsq;
    dargdx1 = -drdx1/sqrm1 - dphidx1;
    dargdx2 = -drdx2/sqrm1 - dphidx2;
    d2fdrdx1 = 2*drdx1 + (rm1*sinrphi - 0.5*cosrphi)*dargdx1 - drdx1*cosrphi;
    d2fdphidx1 = -0.5*(2*rm1*sinrphi*drdx1 + sqrm1*cosrphi*dargdx1);
    d2fdrdx2 = 2*drdx2 + (rm1*sinrphi - 0.5*cosrphi)*dargdx2 - drdx2*cosrphi;
    d2fdphidx2 = -0.5*(2*rm1*sinrphi*drdx2 + sqrm1*cosrphi*dargdx2);
    h11 = dfdr/r + x(1)*(r*d2fdrdx1 - dfdr*drdx1)/rsq + d2fdphidx1*x(2)/rsq - 2*dfdphi*drdx1*x(2)/r^3;
    h12 = x(1)*(r*d2fdrdx2 - dfdr*drdx2)/rsq + (rsq*(d2fdphidx2*x(2)+dfdphi) - 2*r*drdx2*dfdphi*x(2))/rsq^2;
    h21 = x(2)*(r*d2fdrdx1 - dfdr*drdx1)/rsq - (rsq*(d2fdphidx1*x(1)+dfdphi) - 2*r*drdx1*dfdphi*x(1))/rsq^2;
    h22 = dfdr/r + x(2)*(r*d2fdrdx2 - dfdr*drdx2)/rsq - d2fdphidx2*x(1)/rsq + 2*dfdphi*drdx2*x(1)/r^3;
    varargout(argout) = {[h11 h21; h21 h22]};
  end
end
return;
