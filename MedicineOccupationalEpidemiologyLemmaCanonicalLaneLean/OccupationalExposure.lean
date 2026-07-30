import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure OccupationalExposure where
  exposureAgent : String
  exposureRoute : String
  exposureDuration : ℝ
  exposureConcentration : ℝ
  occupationalExposureLimit : ℝ
  cumulativeExposure : ℝ
  adverseOutcomeRisk : ℝ
  riskExceedsLimit : Prop

def OccupationalExposureClosed (E : OccupationalExposure) : Prop :=
  E.riskExceedsLimit

structure OccupationalExposureEvidence (E : OccupationalExposure) where
  riskExceedsLimitClosed : E.riskExceedsLimit

theorem occupational_exposure_closed_from_evidence (E : OccupationalExposure) (Ev : OccupationalExposureEvidence E) : OccupationalExposureClosed E := by
  exact Ev.riskExceedsLimitClosed

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse