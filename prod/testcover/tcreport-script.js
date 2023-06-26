(function(){
    const trimmed       = "mf-trimmed";
    const keywordClass  = "mf-keyword";
    // colour in all the keywords
    var keywords = ["end-if","end-perform","end-evaluate","evaluate","perform","move","section","exit","when","and","or","if","else"]
    document.querySelectorAll("table.tcov-report-table tr pre").forEach(pre => {
        keywords.forEach(word => {
            var re = new RegExp( "\\b" + word + "\\b" , "gi");
            pre.innerHTML = pre.innerHTML.replace(re,function(x){return("<span class='"+keywordClass+"'>"+x+"</span>");});
        });
    });
    // wrap contents of pre tags, minus leading and trailing spaces, in the statement column
    // with span tags with classes corresponding to whether the statement was executed or not
    document.querySelectorAll("table.tcov-report-table pre").forEach(pre => {
        pre.innerHTML = pre.innerHTML.replace(/[^\s\.](.*\S)?/, function(x){
                                        return("<span class='"+trimmed+"'>"+x+"</span>");
                                    });
    });
}).call()
