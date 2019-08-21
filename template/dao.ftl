<#import "function.ftl" as func>
<#assign package=model.variables.package>
<#assign class=model.variables.class>
<#assign classVar=model.variables.classVar>
<#assign comment=model.tabComment>
<#assign system=vars.system>
<#assign sub=model.sub>
<#assign foreignKey=func.convertUnderLine(model.foreignKey)>
<#assign pkType=func.getPkType(model)>
<#assign fkType=func.getFkType(model)>
package com.dstz.${system}${package}.dao;
<#if sub?exists && sub>
import java.util.HashMap;
import java.util.List;
import java.util.Map;
</#if>
import com.dstz.base.dao.BaseDao;
import com.dstz.${system}${package}.model.${class};

/**
 * ${comment} DAO接口
 <#if vars.developer?exists>
 * @author ${vars.developer}
 * @email ${vars.email}
 </#if>
 * @time ${date?string("yyyy-MM-dd HH:mm:ss")}
 */
public interface ${class}Dao extends BaseDao<String, ${class}> {
	
	<#if sub?exists && sub==true>
	<#assign foreignKeyVar=func.convertUnderLine(foreignKey)>
	public void delByMainId (String ${foreignKeyVar});
	
	public List<${class}> getByMainId(String ${foreignKeyVar});
	</#if>
}
