import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure MetaAnalysisStudy where
  effectSize : ℝ
  variance : ℝ
  weight : ℝ
  weightFormula : weight = 1 / variance

structure MetaAnalysisResult (studies : List MetaAnalysisStudy) where
  pooledEffect : ℝ
  pooledVariance : ℝ
  pooledEffectFormula : pooledEffect = (studies.map (λ s => s.weight * s.effectSize)).sum / (studies.map weight).sum
  pooledVarianceFormula : pooledVariance = 1 / (studies.map weight).sum

structure MetaAnalysisEvidence {studies : List MetaAnalysisStudy} (R : MetaAnalysisResult studies) where
  studyWeightsValid : ∀ s ∈ studies, s.weight > 0 ∧ s.weightFormula
  pooledEffectFormulaClosed : R.pooledEffectFormula
  pooledVarianceFormulaClosed : R.pooledVarianceFormula

def MetaAnalysisClosed {studies : List MetaAnalysisStudy} (R : MetaAnalysisResult studies) : Prop :=
  (∀ s ∈ studies, s.weight > 0 ∧ s.weightFormula) ∧ R.pooledEffectFormula ∧ R.pooledVarianceFormula

theorem meta_analysis_closed_from_evidence {studies : List MetaAnalysisStudy} (R : MetaAnalysisResult studies) (E : MetaAnalysisEvidence R) : MetaAnalysisClosed R := by
  exact And.intro (by
    intro s hs
    exact E.studyWeightsValid s hs
  ) (And.intro E.pooledEffectFormulaClosed E.pooledVarianceFormulaClosed)

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse