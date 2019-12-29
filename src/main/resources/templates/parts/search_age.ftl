<#macro search_age path>
    <form method="get" class="forms mt-2 mb-2" action=${path}>
        <div class="form-row ml-8">
           <button name="butAge" class="btn btn-danger mr-3" value="SMALL"> SMALL </button>
           <button name="butAge" class="btn btn-warning mr-3" value="MEDIUM"> MEDIUM </button>
           <button name="butAge" class="btn btn-success mr-3" value="ELDER"> ELDER </button>
        </div>
    </form>
</#macro>