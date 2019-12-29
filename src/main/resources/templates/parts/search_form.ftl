<#import "search_name_form.ftl" as searchName>
<#import "search_by_price.ftl" as searchPrice>
<#import "search_by_amount.ftl" as searchAmount>
<#import "show_all_result.ftl" as showResult>

<#macro search_form path>
    <div>
        <@searchName.search_name path />
        <@searchPrice.search_by_price path />
        <@searchAmount.searchAmount path />
        <@showResult.show_all_result path/>

    </div>
</#macro>