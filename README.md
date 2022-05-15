# Reproduce RepliComment JSS 2021 experiments

Arianna Blasi, Nataliia Stulova, Alessandra Gorla, Oscar Nierstrasz, _RepliComment: Identifying clones in code comments_,
Journal of Systems and Software Volume 182, 2021, https://doi.org/10.1016/j.jss.2021.111069.

## Repo structure
RepliComment works in tandem with upDoc, the short paper published at SCAM 2020. upDoc is what we call
"Clone Analyzer" in the paper: It makes the final assessments on the comment clones RepliComment fetches and filters.

The repo as you clone it will only contain two bash scripts and this README. After you launch the `execute-full-JSS-pipeline` script, you obtain:
1. The subjects the experiments involves (their sources and executable `.jar`)
2. RepliComment 2.0 repository (and RepliComment outputs after executing it)
3. upDoc  1.0 repository (and upDoc outputs after executing it)

To download the subjects we use in our evaluation, the script runs `get_evaluation_project_sources.bash first`. **Notice that** The script
uses `curl` to download everything. If this doesn't work for you, change it into `wget`, or whathever your OS pefers.


## Output interpretation
RepliComment outputs are divided by _subject_ and _context_ of clone search. We do not output all the clones found for subject into a single file for the sake of better clarity (but if you prefer to change this behaviour, feel free to edit the source code!).

RepliComment 2.0 as explained in the JSS paper works by looking for clones found at different contexts, namely inside the same class, or among hierarchies of classes, or among all classes of a project (and all of these at method-level and then field-level). All these different searches were added for the JSS publication, so we consider the default RepliComment behaviour as the original ICPC one: An analysis within one same class of method-level comment clones. 

Considering for example the subject Apache Lucene, we will have the following outputs:
`2020_JavadocClones_lucene.csv` the default analysis (method-level, single-class context)
`2020_JavadocClones_cf_lucene.csv` method-level, cross-file (multiple classes) context
`2020_JavadocClones_h_lucene.csv` method-level, hierarchy-context
`2020_JavadocClones_fields_*` field-level, `*`-contexts same as above
