PREFIX snomed: <http://www.ihtsdo.org/SCT_>
PREFIX sct: <http://wasp.cs.vu.nl/sct/sct#>
PREFIX drugbank: <https://www.drugbank.ca/drugs/>
PREFIX ztonekg:<http://www.ztonebv.nl/KG#>
PREFIX pubmed:<http://www.ncbi.nlm.nih.gov/pubmed/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
select distinct ?adolescent ?selfinjury (COUNT(distinct ?pubmed) as ?count)
where {
    ?t1s1 ztonekg:SenseURL snomed:133937008. #snomedCT code for adolescent
    ?t1s1 ztonekg:SenseURL ?adolescent.
    ?t1 ztonekg:hasSense ?t1s1.
    ?s7 ztonekg:hasSenses ?t1.    
    ?s ztonekg:hasTerm ?s7.
    ?s1 ztonekg:hasAnnotation ?s.
    ?pubmed ztonekg:hasAnnotations ?s1.
    ?pubmed ztonekg:hasAnnotations ?s1b.
    ?s1b ztonekg:hasAnnotation ?sb.
    ?sb ztonekg:hasTerm ?s7b.
    ?s7b ztonekg:hasSenses ?t1b.
    ?t1b ztonekg:hasSense ?t1s1b.
    ?t1s1b ztonekg:SenseURL snomed:248062006. #snomedCT code for NSSI
    ?t1s1b ztonekg:SenseURL ?selfinjury.
}
GROUP BY ?adolescent ?selfinjury #will group all the results having the snomedCT code for adolescent and NSSI
ORDER by DESC(?count) #will count how many pubmed articles in the database contain both codes
