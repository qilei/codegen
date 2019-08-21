<#import "function.ftl" as func>
<#assign package=model.variables.package>
<#assign class=model.variables.class>
<#assign system=vars.system>
<#assign comment=model.tabComment>
<#assign subtables=model.subTableList>
<#assign classVar=model.variables.classVar>
<#assign pk=func.getPk(model) >
<#assign pkVar=func.convertUnderLine(pk) >
<#assign pkType=func.getPkType(model)>
package com.dstz.${system}.rest.controller;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.dstz.base.rest.BaseController;

import com.dstz.base.api.aop.annotion.CatchErr;

import com.dstz.${system}${package}.manager.${class}Manager;
import com.dstz.${system}${package}.model.${class};


/**
 * ${comment} 控制器类<br/>
 <#if vars.developer?exists>
 * @author  ${vars.developer}
 </#if>
 * </pre>
 */
@RestController
@RequestMapping("/${system}/${classVar}")
public class ${class}Controller extends BaseController<${class}>{
	@Resource
	${class}Manager ${classVar}Manager;
	
	
	@Override
	protected String getModelDesc() {
		return "${comment}";
	}
	   
}
