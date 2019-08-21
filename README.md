
## 代码生成器使用说明

代码生成器是通过数据库数据结构 逆向生成代码的工具。 会自动对 “_” 特殊处理、移除并大写尾随的字母


## 按照一下步骤配置代码生成器

## 配置数据库链接信息
 在 codegen.properties 中修改数据库链接
 dbHelperClass： 根据数据库进行选择
 system ：为系统模块配置  eg: com.dstz.org.model.User 中的 “org”
 

## 配置实体以及需要生成的代码

在 codegenconfig.xml 中
baseDir 为代码要生成的模块具体路径

如生成后端代码，需要配置此 代码路径  

 ```
	<files baseDir="C:\Users\admin\git\agile-bpm-basic-dev\demo\demo-core">
		<file refTemplate="mapping" filename="{class}.map.xml" dir="src\main\resources\com\dstz\{system}\mapping" sub="true" override="true" />
		<file refTemplate="dao" filename="{class}Dao.java" dir="src\main\java\com\dstz\{system}{packageForder}\dao" sub="true" override="true" />
		<file refTemplate="entity" filename="{class}.java" dir="src\main\java\com\dstz\{system}{packageForder}\model" sub="true" override="true" /> 
		<file refTemplate="manager" filename="{class}Manager.java" dir="src\main\java\com\dstz\{system}{packageForder}\manager" sub="false" override="true" />
		<file refTemplate="managerImpl" filename="{class}ManagerImpl.java" dir="src\main\java\com\dstz\{system}{packageForder}\manager\impl" sub="false" override="true" />
		<file refTemplate="controller" filename="{class}Controller.java" dir="src\main\java\com\dstz\{system}\rest\controller\" sub="false" override="true" />
	</files>
 
 ```
 	又或者 生成前端代码,路径配置：
  ```
		<files baseDir="C:\Users\miao_pc\git\agile-bpm-basic-dev\bpm-explorer"> 
			<file refTemplate="edit" filename="{classVar}Edit.html" dir="{system}\{classVar}" override="true" />
			<file refTemplate="list" filename="{classVar}List.html" dir="{system}\{classVar}" override="true" />
			<file refTemplate="get" filename="{classVar}Get.html" dir="{system}\{classVar}" override="true" />
		</files> 
 ```
 
配置需要生成的代码,files只能存在一个。

## 配置 数据库 实体


单表时
```
	<table tableName="biz_demo">
		<variable name="class" value="Demo"/>
		<variable name="package" value=".core"/>
		<variable name="packageForder" value="\core"/>  
	</table>

```

主子表时
```
	<table tableName="biz_demo">
		<variable name="class" value="Demo"/>
		<variable name="package" value=".core"/>
		<variable name="packageForder" value="\core"/>  
		<subtable tablename="biz_demo_sub" foreignKey="demo_id_">
			<variable name="class" value="DemoSub"/>
			<variable name="package" value=".core"/>
			<variable name="packageForder" value="\core"/>  
		</subtable>
	</table>

 ```
 
 - class 为java bean 的实体名字
 - tableName 为具体数据库的名字
 - package 为包名 （.必须有，包名可以不用配置）
 - packageForder 与package 需要保持一致
 
 
 ## 最后 在 build.xml 中执行ant命令  
 
 build.xml 文件上右键，Run As  Ant Build... 选择生成代码命令并执行 
 
具体生成效果可以查看demo案例
 