<#import "function.ftl" as func>
<#assign package=model.variables.package>
<#assign class=model.variables.class>
<#assign comment=model.tabComment>
<#assign system=vars.system>
<#assign subtables=model.subTableList>
<#assign pk=func.getPk(model) >
<#assign pkVar=func.convertUnderLine(pk) >
<#assign pkType=func.getPkType(model)>
<#assign fkType=func.getFkType(model)>
package com.dstz.${system}${package}.model;
<#if subtables?exists && subtables?size!=0>
import java.util.ArrayList;
import java.util.List;
</#if>
import java.util.Date;
import java.math.BigDecimal;

import com.dstz.base.core.model.BaseModel;


/**
 * ${comment} 实体对象
 <#if vars.developer?exists>
 * @author ${vars.developer}
 * @email ${vars.email}
 </#if>
 * @time ${date?string("yyyy-MM-dd HH:mm:ss")}
 */
public class ${class} extends BaseModel{
	<#list model.columnList as col>
	<#assign colName=func.convertUnderLine(col.columnName)>
	<#if colName!="id"&&colName!="createTime"&&colName!="createBy"&&colName!="updateTime"&&colName!="updateBy"&&colName!="version">
	/**
	* ${col.comment}
	*/
	protected <#if (col.colType=="Double")>BigDecimal</#if> <#if (col.colType=="char")>String</#if><#if (col.colType!="Double")><#if (col.colType!="char")>${col.colType}</#if></#if> ${colName}; 
	</#if>
	</#list>
	
	<#if subtables?exists && subtables?size!=0>
	<#list subtables as table>
	<#assign vars=table.variables>
	/**
	*${table.tabComment}列表
	*/
	protected List<${vars.class}> ${vars.classVar}List=new ArrayList<${vars.class}>(); 
	</#list>
	</#if>
<#if (pkVar!="id")>
	@Override
	public void setId(String ${pkVar}) {
		this.${pkVar} = ${pkVar}.toString();
	}
	@Override
	public String getId() {
		return ${pkVar}.toString();
	}	
</#if>
<#list model.columnList as col>
	<#assign colName=func.convertUnderLine(col.columnName)>
	
	<#if colName!="id"&&colName!="createTime"&&colName!="createBy"&&colName!="updateTime"&&colName!="updateBy"&&colName!="version">
	
	
	public void set${colName?cap_first}(<#if (col.colType=="Double")>BigDecimal</#if> <#if (col.colType=="char")>String</#if><#if (col.colType!="Double")><#if (col.colType!="char")>${col.colType}</#if></#if> ${colName}) {
		this.${colName} = ${colName};
	}
	
	/**
	 * 返回 ${col.comment}
	 * @return
	 */
	public <#if (col.colType=="Double")>BigDecimal</#if> <#if (col.colType=="char")>String</#if><#if (col.colType!="Double")><#if (col.colType!="char")>${col.colType}</#if></#if> get${colName?cap_first}() {
		return this.${colName};
	}
	
	</#if>
</#list>
<#if subtables?exists && subtables?size!=0>
<#list subtables as table>
<#assign vars=table.variables>

	public void set${vars.classVar?cap_first}List(List<${vars.class}> ${vars.classVar}List) {
		this.${vars.classVar}List = ${vars.classVar}List;
	}
	
	/**
	 * 返回 ${table.tabComment}列表
	 * @return
	 */
	public List<${vars.class}> get${vars.classVar?cap_first}List() {
		return this.${vars.classVar}List;
	}
</#list>
</#if>
 
}