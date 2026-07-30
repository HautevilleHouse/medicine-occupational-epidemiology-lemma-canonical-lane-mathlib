import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure OccupationalExposurePackage where
  exposureAgent : Type
  exposureRoute : Prop
  exposureDuration : ℕ
  exposureFrequency : ℕ
  exposureConcentration : ℕ
  permissibleExposureLimit : ℕ
  healthEffectThreshold : ℕ

structure OccupationalExposureEvidence (O : OccupationalExposurePackage) where
  exposureAgentClosed : O.exposureAgent
  exposureRouteClosed : O.exposureRoute
  exposureDurationClosed : O.exposureDuration > 0
  exposureFrequencyClosed : O.exposureFrequency > 0
  exposureConcentrationClosed : O.exposureConcentration > 0
  permissibleExposureLimitClosed : O.permissibleExposureLimit > 0
  healthEffectThresholdClosed : O.healthEffectThreshold > 0

def OccupationalExposureClosed (O : OccupationalExposurePackage) : Prop :=
  O.exposureAgent ∧ O.exposureRoute ∧
  O.exposureDuration > 0 ∧ O.exposureFrequency > 0 ∧
  O.exposureConcentration > 0 ∧ O.permissibleExposureLimit > 0 ∧
  O.healthEffectThreshold > 0

theorem occupational_exposure_closed_from_evidence (O : OccupationalExposurePackage)
    (E : OccupationalExposureEvidence O) : OccupationalExposureClosed O := by
  exact And.intro E.exposureAgentClosed
    (And.intro E.exposureRouteClosed
      (And.intro E.exposureDurationClosed
        (And.intro E.exposureFrequencyClosed
          (And.intro E.exposureConcentrationClosed
            (And.intro E.permissibleExposureLimitClosed E.healthEffectThresholdClosed)))))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse