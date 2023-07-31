PREFIX snomed: <http://www.ihtsdo.org/SCT_>
PREFIX sct: <http://wasp.cs.vu.nl/sct/sct#>
PREFIX drugbank: <https://www.drugbank.ca/drugs/>
PREFIX ztonekg:<http://www.ztonebv.nl/KG#>
PREFIX pubmed:<http://www.ncbi.nlm.nih.gov/pubmed/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
select ?mental ?adolescent ?what (COUNT(distinct ?pubmed) as ?count) 
where {
    ?t1s1 ztonekg:SenseURL snomed:74732009.  #snomedCT code for mental illness
    ?t1s1 ztonekg:SenseURL ?mental.
    ?t1 ztonekg:hasSense ?t1s1.
    ?s7 ztonekg:hasSenses ?t1.    
    ?s ztonekg:hasTerm ?s7.
    ?s1 ztonekg:hasAnnotation ?s.
    ?pubmed ztonekg:hasAnnotations ?s1. #this will find all pubmed articles in the database containing the codes from t1s1 and t1s1b and t1s1c
    ?pubmed ztonekg:hasAnnotations ?s1b.
    ?pubmed ztonekg:hasAnnotations ?s1c.
    ?s1b ztonekg:hasAnnotation ?sb.
    ?s1c ztonekg:hasAnnotation ?sc.
    ?sb ztonekg:hasTerm ?s7b.
    ?sc ztonekg:hasTerm ?s7c.
    ?s7b ztonekg:hasSenses ?t1b.
    ?s7c ztonekg:hasSenses ?t1c.
    ?t1b ztonekg:hasSense ?t1s1b.
    ?t1c ztonekg:hasSense ?t1s1c.
    ?t1s1b ztonekg:SenseURL snomed:133937008. #snomedCT code for adolescent
    ?t1s1b ztonekg:SenseURL ?adolescent.
    ?t1s1c ztonekg:SenseURL ?what.
    ?s1b ztonekg:hasText ?title.   
}
GROUP BY ?adolescent ?mental ?what
ORDER by DESC(?count)


