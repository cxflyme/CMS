<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>vote</title>
<link rel="stylesheet" type="text/css" href="../style/admin.css" />
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/admin_vote.js"></script>
</head>
<body id="main">

<div class="map">
<br/>
　管理首页　>>　调查投票管理　>>　<strong id="title">{$title}</strong>
</div>

<ul>
	<li><a href="vote.php?action=show">投票主题列表</a></li>
	{if $addChild}
	{else}
		<li><a href="vote.php?action=add">新增投票主题</a></li>
	{/if}

	{if $showChild}
		<li><a href="vote.php?action=addChild&id={$vid}">新增投票项目</a></li>
	{/if}
	{if $update}
	<li><a href="vote.php?action=update&id={$id}">修改投票主题</a></li>
	{/if}
</ul>



{if $show}
<table class="tb" cellspacing="0">
	<tr><th>编号</th><th>投票主题</th><th>投票项目</th><th>是否前台首选</th><th>操作</th></tr>
	{if $votes}
	{foreach $votes(key,value)}
	<tr>
		<td><script type="text/javascript">document.write({@key+1}+{$num});</script></td>
		<td>{@value->title}</td>
		<td><a href="vote.php?action=showChild&vid={@value->id}">查看</a> | <a href="vote
		.php?action=addChild&id={@value->id}">增加项目</a>
		</td>
		<td>{@value->state}</td>
		<td><a href="vote.php?action=update&id={@value->id}">修改</a> |
		 <a href="vote.php?action=delete&id={@value->id}" onclick="return confirm('确定要删除吗？')">删除</a></td>
	</tr>
	{/foreach}
	{else}
	<tr><td colspan="4">对不起，没有任何数据</td></tr>
	{/if}
</table>
<div id="page">{$page}</div>
{/if}

{if $showChild}
	<table class="tb" cellspacing="0">
		<tr><th>编号</th><th>投票项目</th><th>操作</th></tr>
		{if $childVotes}
			{foreach $childVotes(key,value)}
				<tr>
					<td><script type="text/javascript">document.write({@key+1}+{$num});</script></td>
					<td>{@value->title}</td>
					<td><a href="vote.php?action=update&id={@value->id}">修改</a> |
						<a href="vote.php?action=delete&id={@value->id}" onclick="return confirm('确定要删除吗？')">删除</a></td>
				</tr>
			{/foreach}
		{else}
			<tr><td colspan="3">对不起，没有任何数据</td></tr>
		{/if}
	</table>
	<div id="page">{$page}</div>
{/if}

{if $update}
<form method="post" action="?action=update" name="update">
<input type="hidden" value="{$id}" name="id" />
<input type="hidden" value="{$prev_url}" name="prev_url" />
<table cellspacing="0" class="tb left">
	<tr><td>等级名称：<input type="text" name="vote_name" value="{$vote_name}" class="text" /></td></tr>
	<tr><td><span class="vote_info_text">等级描述：</span><textarea name="vote_info">{$vote_info}</textarea></td></tr>
	<tr>
    	<td>
    		<input type="submit" name="send" value="修改等级" class="submit" onclick="return checkUpdateForm();" /> [ <a href="{$prev_url}">返回列表</a> ] 
		</td>
	</tr>
</table>
</form>
{/if}


{if $add}
<form method="post" action="?action=add" name="add">
<table cellspacing="0" class="tb left">
	<tr><td>投票主题名称：<input type="text" name="title" class="text" /></td></tr>
	<tr><td><span class="vote_info">投票主题描述：</span><textarea name="info"></textarea></td></tr>
	<tr>
    	<td>
    		<input type="submit" name="send" value="新增投票" class="submit" onclick="return checkAddForm();" /> [ <a
					href="vote.php?action=show">返回列表</a> ]
		</td>
	</tr>
</table>
</form>
{/if}


{if $addChild}
	<form method="post" action="?action=addChild" name="add">
		<table cellspacing="0" class="tb left">
			<input type="hidden" value="{$id}" name="id" />
			<tr><td>投票所属主题名称：{$titleParent}</td></tr>
			<tr><td>投票主题名称：<input type="text" name="title" class="text" /></td></tr>
			<tr><td><span class="vote_info">投票主题描述：</span><textarea name="info"></textarea></td></tr>
			<tr>
				<td>
					<input type="submit" name="send" value="新增投票" class="submit" onclick="return checkAddForm();" /> [ <a
							href="vote.php?action=show">返回列表</a> ]
				</td>
			</tr>
		</table>
	</form>
{/if}


{if $delete}
删除
{/if}

</body>
</html>