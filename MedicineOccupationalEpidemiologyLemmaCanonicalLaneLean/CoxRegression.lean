import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure CoxRegressionPackage where
  hazardFunction : Type u
  proportionalHazardsAssumption : Prop
  timeScale : Type v
  eventIndicator : Type w
  covariates : Type x
  baselineHazardEstimable : Prop
  effectEstimates : Prop

structure CoxRegressionEvidence (C : CoxRegressionPackage) where
  proportionalHazardsAssumptionClosed : C.proportionalHazardsAssumption
  baselineHazardEstimableClosed : C.baselineHazardEstimable
  effectEstimatesClosed : C.effectEstimates

def CoxRegressionClosed (C : CoxRegressionPackage) : Prop :=
  C.proportionalHazardsAssumption ∧ C.baselineHazardEstimable ∧ C.effectEstimates

theorem cox_regression_closed_from_evidence (C : CoxRegressionPackage) (Ev : CoxRegressionEvidence C) : CoxRegressionClosed C :=
  And.intro Ev.proportionalHazardsAssumptionClosed (And.intro Ev.baselineHazardEstimableClosed Ev.effectEstimatesClosed)

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse