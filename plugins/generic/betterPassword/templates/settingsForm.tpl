{**
 * plugins/generic/betterPassword/settingsForm.tpl
 *
 * Copyright (c) 2019 University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Better Password plugin settings
 *
 *}
<script>
	$(function() {ldelim}
		// Attach the form handler.
		$('#betterPasswordSettingsForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
	{rdelim});
</script>
<form class="pkp_form" id="betterPasswordSettingsForm" method="post" action="{url router=$smarty.const.ROUTE_COMPONENT op="manage" category="generic" plugin=$pluginName verb="settings" save=true}">
	{csrf}
	{include file="controllers/notification/inPlaceNotification.tpl" notificationId="betterPasswordSettingsFormNotification"}

	<div id="description">{translate key="plugins.generic.betterPassword.manager.settings.description"}</div>

	{fbvFormArea id="betterPasswordSettingsFormOptions" title="admin.siteSettings"}
		{fbvFormSection for="minPasswordLength"}
			{fbvElement type="text" id="minPasswordLength" label="admin.settings.minPasswordLength" value="$minPasswordLength"}
		{/fbvFormSection}
	{/fbvFormArea}

	{fbvFormArea id="betterPasswordSettingsFormOptions" title="plugins.generic.betterPassword.manager.settings.betterPasswordCheckTitle"}
		{fbvFormSection list="true" id="betterPasswordCheckboxList"}
			{foreach from=$betterPasswordCheckboxes key="betterPasswordSetting" item="betterPasswordSettingValue"}
				{fbvElement type="checkbox" id=$betterPasswordSetting label="plugins.generic.betterPassword.manager.settings."|cat:$betterPasswordSetting checked=$betterPasswordSettingValue|compare:true}
			{/foreach}
		{/fbvFormSection}
	{/fbvFormArea}

	{fbvFormArea id="betterPasswordSettingsFormLocking" title="plugins.generic.betterPassword.manager.settings.betterPasswordLockTitle"}
		{foreach from=$betterPasswordLocking key="betterPasswordSetting" item="betterPasswordSettingValue"}
			{fbvFormSection for="$betterPasswordSetting" description="plugins.generic.betterPassword.manager.settings."|cat:$betterPasswordSetting id=$betterPasswordSetting|cat:"Section"}
				{fbvElement type="text" id=$betterPasswordSetting value=$betterPasswordSettingValue inline=true size=$fbvStyles.size.MEDIUM}
			{/fbvFormSection}
		{/foreach}
	{/fbvFormArea}

	{fbvFormButtons}

	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
</form>
