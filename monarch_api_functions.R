## Monarch API helper functions
#These use the sim search endpoints documented here https://api.monarchinitiative.org/api to see what comes back. Does not currently support negated HPO ids.

sim_search=function(hpo_ids) {
  hpo_string = paste0(hpo_ids, collapse=",")
  request=sprintf("http://api-v3.monarchinitiative.org/v3/api/semsim/search/%s/Human%%20Genes",hpo_string)
  res=GET(request)
  content(res,as="parsed",type="application/json")
}

list_sim_results=function(sim_results) {
  data.frame(name=sapply(sim_results,function(x){x$subject$name}),
             code=sapply(sim_results,function(x){x$subject$id}),
             score=sapply(sim_results,function(x){x$score}))
  
}
