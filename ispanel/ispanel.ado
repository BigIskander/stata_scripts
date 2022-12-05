//------Panel data or not Panel data, that's the question----//
/* author: Sultanov Iskander (BigIskander@gmail.com) */
capture program drop ispanel
program ispanel, rclass
	syntax varlist(min=3) [if]
	gettoken pid varlist: varlist
	
	capture {
		//data transformation create temporal variables//
		local vlist1
		foreach v of varlist `varlist' {
			tempvar Mi_`v'
			qui by `pid', sort: egen Mi_`v'=mean(`v') `if'
			local vlist1 `vlist1' Mi_`v'
		}
	
		local vlist2
		foreach v of varlist `varlist' {
			tempvar Di_`v'
			qui gen Di_`v'=`v'-Mi_`v'
			local vlist2 `vlist2' Di_`v'
		}
	
		set matsize 1000
		//fully unrestricted model Coefs//
		tempname rss_ur n_ur df_ur
		scalar `rss_ur'=0
		scalar `n_ur'=0
		scalar `df_ur'=0
		qui levelsof `pid' `if', local (levels)
		foreach i of local levels {
			if "`if'"=="" {
				qui reg `varlist' if `pid'==`i'
			} 
			else {
				qui reg `varlist' `if' & `pid'==`i'
			}
			tempname z`i'
			tempname df`i'
			tempname n`i'
			scalar `z`i''=e(rss)
			scalar `df`i''=e(df_m)+1
			scalar `n`i''=e(N)
			scalar `rss_ur'=`rss_ur'+`z`i''
			scalar `df_ur'=`df_ur'+`df`i''
			scalar `n_ur'=`n_ur'+`n`i''
		}
		
		//LSDV model Coefs//
		qui reg `vlist2' i.`pid' `if'
		tempname B df_r1 n_r1 rss_r1 
		scalar `df_r1'=e(df_m)+1
		scalar `n_r1'=e(N)
		scalar `rss_r1'=e(rss)

		//BE model Coefs//
		qui reg `vlist1' `if'
		tempname B df_r2 n_r2 rss_r2
		scalar `df_r2'=e(df_m)+1
		scalar `n_r2'=e(N)
		scalar `rss_r2'=e(rss)
	
		//drop temporal values
		drop `vlist1' `vlist2'

		//calculate statistics
		tempname fh1 fh2 fh3 pval1 pval2 pval3
		scalar `fh1' =((`rss_r1'-`rss_ur')/(`df_ur'-`df_r1'))/(`rss_ur'/`n_ur')
		scalar `pval1' = Ftail(`df_ur'-`df_r1',`n_ur'-`df_ur',`fh1')
		scalar `fh2' =((`rss_r2'-`rss_ur')/(`df_ur'-`df_r2'))/(`rss_ur'/`n_ur')
		scalar `pval2' = Ftail(`df_ur'-`df_r1',`n_ur'-`df_ur',`fh2')
		scalar `fh3' =((`rss_r2'-`rss_r1')/(`df_r1'-`df_r2'))/(`rss_r1'/`n_r1')
		scalar `pval3' = Ftail(`df_r1'-`df_r2',`n_r1'-`df_r1',`fh3')

	}
	if _rc!=0 {
		//drop temporal values end display error
		drop `vlist1' `vlist2'
		error _rc
		exit _rc
	}
	
	//display results
	di "pval1 =" %7.4f `pval1'
	di "pval2 =" %7.4f `pval2'
	di "pval3 =" %7.4f `pval3'
	di "fh1 = " %7.4f `fh1'
	di "fh2 = " %7.4f `fh2'
	di "fh3 = " %7.4f `fh3' 
	
	return scalar pval1=`pval1'
	return scalar pval2=`pval2'
	return scalar pval3=`pval3' 
	return scalar fh1=`fh1'
	return scalar fh2=`fh2'
	return scalar fh3=`fh3'
end
