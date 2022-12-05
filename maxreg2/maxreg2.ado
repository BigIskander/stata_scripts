/* Sultanov Iskander, 2016, BigIskander@gmail.com */
capture program drop maxreg2
program maxreg2, rclass
	syntax anything [if] [in] [, robust supconst]
	gettoken deep anything : anything
	gettoken depvar anything : anything
	tokenize `anything'
	
	if "`robust'"=="robust" & "`supconst'"=="supconst" {
		local robust ", `robust'"
		local noconst " supconst"
	} 
	else {
		if "`robust'"=="robust" {
			local robust ", `robust'"
		}
	
		if "`supconst'"=="supconst" {
			local noconst ", supconst"
		}
	}
	
	local e=1
	while "``e''" != "" {
		local ++e
	}
	local --e
	local maxr=0
	local max
	local meanf=0
	local mdeep=1
	
	local vlist
	local dd=`deep'-1
	forvalue i=1/`dd' {
		local vlist `vlist' ``i''
	}
	local dd=`deep'+1
	forvalue i=`deep'/`e' {
		local rvlist `vlist' ``i''
		local relist
		
		mfll `depvar' `rvlist' `if' `in' `robust' `noconst'
		if r(allm)==1 & `maxr'<r(r) {
			forvalue j=`deep'/`e' {
				if `i'!=`j' {
					local relist `relist' ``j''
				}
			}
				
			local selist `dd' `depvar' `rvlist' `relist'
			local maxr=r(r)
			local max `depvar' `rvlist'
			local mdeep=`deep'
			local rel `relist'
			local meanf=1
		}
	}
	
	if `meanf'==1 {
		maxreg2 `selist' `if' `in' `robust' `noconst'
		local ifmean=r(meanf)
		local mR=r(maxr)
		local mX=r(max)
		
		if `ifmean'==1 {
			if `maxr'<`mR' {
				local maxr=`mR'
				local max `mX'
				local mdeep=r(mdeep)
				local rel=r(rel)
				local meanf=1
			}
		}
	}
	
	return scalar mdeep=`mdeep'
	return scalar maxr=`maxr'
	return local max="`max'"
	return local rel="`rel'"
	return scalar meanf=`meanf'
	
	if `deep'==1 {
		di "max Rsq.:"
		di `maxr'
		di "reg:"
		di "`max'"
	}
end

capture program drop mfll
program mfll, rclass
	syntax varlist(min=2) [if] [in] [, robust supconst]
	tokenize `varlist'
	local depvar=`1'
	
	if "`robust'"=="robust" & "`supconst'"=="supconst" {
		local robust ", `robust'"
		local noconst " noconst"
	} 
	else {
		if "`robust'"=="robust" {
			local robust ", `robust'"
		}
	
		if "`supconst'"=="supconst" {
			local noconst ", noconst"
		}
	}
	
	qui reg `varlist' `if' `in' `robust' `noconst'
	local R=e(r2)
	tempname T
	matrix `T'=r(table)
	if "`supconst'"=="supconst" {
		local c=colsof(`T')
	} 
	else {
		local c=colsof(`T')-1
	}
	local allm=1
	
	forvalue k=1/`c' {
		if el(`T',4,`k') > 0.05 {
			local allm=0
		}
	}
	return scalar allm=`allm'
	return scalar r=`R'
end
