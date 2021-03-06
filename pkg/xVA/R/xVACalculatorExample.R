#' Calculates the xVA values for a simple example containing two IR swaps.
#' @title xVA calculation example
#' @return A list with the values of various valuations' adjustments
#' @export
#' @author Tasos Grivas <tasos@@openriskcalculator.com>
#' @examples 
#' 
#' ## run the example
#' 
#' xVACalculatorExample()
#' 
xVACalculatorExample = function()
{
  # framework can be either "IMM" or "CEM" or "SA-CCR"
  reg_data = list(framework = "SA-CCR", sa_ccr_simplified = "OEM", PD = 0.002, LGD = 0.6, return_on_capital = 0.15, cpty_rating = 'A', mva_days = 10, mva_percentile = 0.99)

  sim_data = list(PFE_Percentile = 0.9, num_of_sims = 250, mean_reversion_a = 0.001, volatility = 0.01)

  cpty_LGD = 0.6
  PO_LGD  = 0.6
  tr1 = Trading::IRDSwap(external_id ="ext1",Notional=1,Currency="USD",Si=0,Ei=7,BuySell='Sell', pay_leg_rate = 0.05)
  tr2 = Trading::IRDSwap(external_id ="ext2",Notional=1,Currency="USD",Si=0,Ei=10,BuySell='Buy', pay_leg_rate = 0.05)

  trades = list(tr1,tr2)

  credit_curve_cpty = Trading::Curve(Tenors=c(1,2,3,4,5,6,10),Rates=c(3,10,20,40,66,99,150))
  credit_curve_PO = Trading::Curve(Tenors=c(1,2,3,4,5,6,10),Rates=c(4,11,23,47,76,110,160))
  funding_curve =  Trading::Curve(Tenors=c(1,2,3,4,5,6,10),Rates=c(4,17,43,47,76,90,110))
  spot_rates = Trading::Curve()
  spot_rates$PopulateViaCSV('spot_rates.csv')

  csa = Trading::CSA(ID="csa_1",thres_cpty = 0.07, thres_PO = 0.1, IM_cpty = 0.03, IM_PO = 0.02,  MTA_cpty = 0.007,
            MTA_PO = 0.01, mpor_days = 10, remargin_freq = 90, Values_type="Actual")

  current_collateral = Trading::Collateral(ID="col_1",csa_id="csa_1",Amount=0.03,type="VariationMargin")
  
  xVA = xVACalculator(trades, csa, current_collateral, sim_data, reg_data, credit_curve_PO, credit_curve_cpty, funding_curve, spot_rates, cpty_LGD, PO_LGD)

  return(xVA)

 }
