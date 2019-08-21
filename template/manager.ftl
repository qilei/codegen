<#import "function.ftl" as func>
<#assign package=model.variables.package>
<#assign comment=model.tabComment>
<#assign class=model.variables.class>
<#assign classVar=model.variables.classVar>
<#assign system=vars.system>
<#assign pkType=func.getPkType(model)>
package com.dstz.${system}${package}.manager;

import com.dstz.base.manager.Manager;
import com.dstz.${system}${package}.model.${class};

/**
 * ${comment} Manager处理接口
 <#if vars.developer?exists>
 * @author ${vars.developer}
 * @email ${vars.email}
 </#if>
 * @time ${date?string("yyyy-MM-dd HH:mm:ss")}
 */
public interface ${class}Manager extends Manager<${pkType}, ${class}>{
	
}
