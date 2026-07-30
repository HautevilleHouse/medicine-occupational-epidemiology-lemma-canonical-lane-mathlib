import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure ExposureResponsePackage where
  exposureLevel : ℝ
  responseOdds : ℝ
  logOddsModel : Prop
  oddsRatioCalculated : Prop
  confidenceInterval : Prop
  logOddsModelTerm : logOddsModel
  oddsRatioCalculatedTerm : oddsRatioCalculated
  confidenceIntervalTerm : confidenceInterval

structure ExposureResponseEvidence (E : ExposureResponsePackage) where
  logOddsModelClosed : E.logOddsModel
  oddsRatioCalculatedClosed : E.oddsRatioCalculated
  confidenceIntervalClosed : E.confidenceInterval

def ExposureResponseClosed (E : ExposureResponsePackage) : Prop :=
  E.logOddsModel ∧ E.oddsRatioCalculated ∧ E.confidenceInterval

theorem exposure_response_closed_from_evidence (E : ExposureResponsePackage)
    (Ev : ExposureResponseEvidence E) : ExposureResponseClosed E := by
  exact And.intro Ev.logOddsModelClosed
    (And.intro Ev.oddsRatioCalculatedClosed Ev.confidenceIntervalClosed)

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
