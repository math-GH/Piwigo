{combine_script id='core.switchbox' load='async' require='jquery' path='themes/default/js/switchbox.js'}
{combine_script id='mcs' load='async' require='jquery' path='themes/default/js/mcs.js'}

{combine_script id='jquery.selectize' load='footer' path='themes/default/js/plugins/selectize.min.js'}

{footer_script}
jQuery(document).ready(function() {
  jQuery("#tag-search").each(function() {
    jQuery(this).selectize({
      plugins: ['remove_button'],
      maxOptions:jQuery(this).find("option").length
    });
  })
});
{/footer_script}
{$MENUBAR}


{if isset($errors) or isset($infos)}
<div class="content messages{if isset($MENUBAR)} contentWithMenu{/if}">
{include file='infos_errors.tpl'}
</div>
{/if}

{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}
<div id="content" class="content{if isset($MENUBAR)} contentWithMenu{/if}">
<div class="titrePage{if isset($chronology.TITLE)} calendarTitleBar{/if}">
	<ul class="categoryActions">
{if !empty($image_orders)}
		<li>{strip}<a id="sortOrderLink" title="{'Sort order'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-sort"></span><span class="pwg-button-text">{'Sort order'|@translate}</span>
		</a>
		<div id="sortOrderBox" class="switchBox">
			<div class="switchBoxTitle">{'Sort order'|@translate}</div>
			{foreach from=$image_orders item=image_order name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
			{if $image_order.SELECTED}
			<span>&#x2714; </span>{$image_order.DISPLAY}
			{else}
			<span style="visibility:hidden">&#x2714; </span><a href="{$image_order.URL}" rel="nofollow">{$image_order.DISPLAY}</a>
			{/if}
			{/foreach}
		</div>
		{footer_script}(window.SwitchBox=window.SwitchBox||[]).push("#sortOrderLink", "#sortOrderBox");{/footer_script}
		{/strip}</li>
{/if}
{if !empty($image_derivatives)}
		<li>{strip}<a id="derivativeSwitchLink" title="{'Photo sizes'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-sizes"></span><span class="pwg-button-text">{'Photo sizes'|@translate}</span>
		</a>
		<div id="derivativeSwitchBox" class="switchBox">
			<div class="switchBoxTitle">{'Photo sizes'|@translate}</div>
			{foreach from=$image_derivatives item=image_derivative name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
			{if $image_derivative.SELECTED}
			<span>&#x2714; </span>{$image_derivative.DISPLAY}
			{else}
			<span style="visibility:hidden">&#x2714; </span><a href="{$image_derivative.URL}" rel="nofollow">{$image_derivative.DISPLAY}</a>
			{/if}
			{/foreach}
		</div>
		{footer_script}(window.SwitchBox=window.SwitchBox||[]).push("#derivativeSwitchLink", "#derivativeSwitchBox");{/footer_script}
		{/strip}</li>
{/if}

{if isset($favorite)}
		<li id="cmdFavorite"><a href="{$favorite.U_FAVORITE}" title="{'delete all photos from your favorites'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-favorite-del"></span><span class="pwg-button-text">{'delete all photos from your favorites'|@translate}</span>
		</a></li>
{/if}
{if isset($U_CADDIE)}
		<li id="cmdCaddie"><a href="{$U_CADDIE}" title="{'Add to caddie'|@translate}" class="pwg-state-default pwg-button">
			<span class="pwg-icon pwg-icon-caddie-add"></span><span class="pwg-button-text">{'Caddie'|@translate}</span>
		</a></li>
{/if}
{if isset($U_EDIT)}
		<li id="cmdEditAlbum"><a href="{$U_EDIT}" title="{'Edit album'|@translate}" class="pwg-state-default pwg-button">
			<span class="pwg-icon pwg-icon-category-edit"></span><span class="pwg-button-text">{'Edit'|@translate}</span>
		</a></li>
{/if}
{if isset($U_SEARCH_RULES)}
		{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
		<li><a href="{$U_SEARCH_RULES}" onclick="popuphelp(this.href); return false;" title="{'Search rules'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-help"></span><span class="pwg-button-text">(?)</span>
		</a></li>
{/if}
{if isset($U_SLIDESHOW)}
		<li id="cmdSlideshow">{strip}<a href="{$U_SLIDESHOW}" title="{'slideshow'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-slideshow"></span><span class="pwg-button-text">{'slideshow'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if isset($U_MODE_FLAT)}
		<li>{strip}<a href="{$U_MODE_FLAT}" title="{'display all photos in all sub-albums'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-category-view-flat"></span><span class="pwg-button-text">{'display all photos in all sub-albums'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if isset($U_MODE_NORMAL)}
		<li>{strip}<a href="{$U_MODE_NORMAL}" title="{'return to normal view mode'|@translate}" class="pwg-state-default pwg-button">
			<span class="pwg-icon pwg-icon-category-view-normal"></span><span class="pwg-button-text">{'return to normal view mode'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if isset($U_MODE_POSTED)}
		<li>{strip}<a href="{$U_MODE_POSTED}" title="{'display a calendar by posted date'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-calendar"></span><span class="pwg-button-text">{'Calendar'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if isset($U_MODE_CREATED)}
		<li>{strip}<a href="{$U_MODE_CREATED}" title="{'display a calendar by creation date'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-camera-calendar"></span><span class="pwg-button-text">{'Calendar'|@translate}</span>
		</a>{/strip}</li>
{/if}
{if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}<li>{$button}</li>{/foreach}{/if}
{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
	</ul>

<h2>{$TITLE} {if $NB_ITEMS > 0}<span class="badge nb_items">{$NB_ITEMS}</span>{/if}</h2>

{if isset($chronology_views)}
<div class="calendarViews">{'View'|@translate}:
	<a id="calendarViewSwitchLink" href="#">
	{foreach from=$chronology_views item=view}{if $view.SELECTED}{$view.CONTENT}{/if}{/foreach}
	</a>
	<div id="calendarViewSwitchBox" class="switchBox">
		{foreach from=$chronology_views item=view name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
		<span{if !$view.SELECTED} style="visibility:hidden"{/if}>&#x2714; </span><a href="{$view.VALUE}">{$view.CONTENT}</a>
		{/foreach}
	</div>
	{footer_script}(window.SwitchBox=window.SwitchBox||[]).push("#calendarViewSwitchLink", "#calendarViewSwitchBox");{/footer_script}
</div>
{/if}

{if isset($chronology.TITLE)}
<h2 class="calendarTitle">{$chronology.TITLE}</h2>
{/if}

</div>{* <!-- titrePage --> *}

{if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

{if !empty($no_search_results)}
<p class="search_results">{'No results for'|@translate} :
	<em><strong>
	{foreach $no_search_results as $res}
	{if !$res@first} &mdash; {/if}
	{$res}
	{/foreach}
	</strong></em>
</p>
{/if}

{if !empty($category_search_results)}
<p class="search_results">{'Album results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
	<em><strong>
	{foreach from=$category_search_results item=res name=res_loop}
	{if !$smarty.foreach.res_loop.first} &mdash; {/if}
	{$res}
	{/foreach}
	</strong></em>
</p>
{/if}

{if !empty($tag_search_results)}
<p class="search_results">{'Tag results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
	<em><strong>
	{foreach from=$tag_search_results item=tag name=res_loop}
	{if !$smarty.foreach.res_loop.first} &mdash; {/if} <a href="{$tag.URL}">{$tag.name}</a>
	{/foreach}
	</strong></em>
</p>
{/if}

{if isset($FILE_CHRONOLOGY_VIEW)}
{include file=$FILE_CHRONOLOGY_VIEW}
{/if}

{if !empty($CONTENT_DESCRIPTION)}
<div class="additional_info">
	{$CONTENT_DESCRIPTION}
</div>
{/if}

{if !empty($CONTENT)}{$CONTENT}{/if}

{if !empty($CATEGORIES)}{$CATEGORIES}{/if}

{if !empty($cats_navbar)}
	{include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$cats_navbar}
{/if}

{* Recherche multicritère *}
<div class="mcs-container">
  <div class="filter-manager">
    <span class="mcs-icon pwg-icon-cog">X</span>Filtres
  </div>

  <div class="filter filter-word">
   <span class="mcs-icon pwg-icon-search">X</span>Mot: <span class="search-words">Balloon</span><span class="filter-arrow pwg-icon-arrow-n"></span>

   <div class="filter-form filter-word-form">
    <span class="word-help"><i class="pwg-icon-help"></i>Conseils de recherche</span>
    <div class="word-search-options">
      <label><input type="radio" name="mode" value="AND"> {'Search for all terms'|@translate}</label>
      <label><input type="radio" name="mode" value="OR"> {'Search for any term'|@translate}</label>
    </div>

    <input type="text" id="word-search" name="word">
    <span class="search-params-title"> Rechercher dans :</span>
    <div class="search-params"> 
      <div>
        <input type="checkbox" id="cat-title" name="cat-title">
        <label for="cat-title">Titre de l'album</label>
      </div>
      <div>
        <input type="checkbox" id="tags" name="tags">
        <label for="tags">Tags</label>
      </div>
      <div>
        <input type="checkbox" id="file" name="file">
        <label for="file">Nom de fichier</label>
      </div>
      <div>
        <input type="checkbox" id="name" name="name">
        <label for="name">Titre de la photo</label>
      </div>
      <div>
        <input type="checkbox" id="comment" name="comment">
        <label for="comment">Description de la photo</label>
      </div>
      <div>
        <input type="checkbox" id="cat-desc" name="cat-desc">
        <label for="cat-desc">Description de l'album</label>
      </div>
    </div>
    <div class="filter-validate">
      Valider
    </div>
   </div>
  </div>
  <div class="filter filter-tag">
    <span class="mcs-icon pwg-icon-tag">X</span>Tag: <span class="search-words">Un Tag</span><span class="filter-arrow pwg-icon-arrow-n"></span>

    <div class="filter-form filter-tag-form">
      <div class="search-params"> 
        <div>
          <input type="radio" id="tag-all" name="tag_mode" value="AND" checked>
          <label for="tag-all">{'All tags'|@translate}</label>
        </div>
        <div>
          <input type="radio" id="tag-one" name="tag_mode" value="OR">
          <label for="tag-one">{'Any tag'|@translate}</label>
        </div>
      </div>
      <select id="tag-search" placeholder="{'Type in a search term'|translate}" name="tags[]" multiple>
    {foreach from=$TAGS item=tag}
        <option value="{$tag.id}">{$tag.name} ({$tag.counter|translate_dec:'%d photo':'%d photos'})</option>
    {/foreach}
      </select>
      <div class="filter-validate">
        Valider
      </div>
    </div>
  </div>
  <div class="filter filter-date">
    <span class="mcs-icon pwg-icon-calendar"></span>Date: <span class="search-words">Balloon</span><span class="filter-arrow pwg-icon-arrow-n"></span>

    <div class="filter-form filter-date-form">
      date div
    </div>
  </div>
</div>

{if !empty($THUMBNAILS)}
<div class="loader"><img src="{$ROOT_URL}{$themeconf.img_dir}/ajax_loader.gif"></div>

<ul class="thumbnails" id="thumbnails">
  {$THUMBNAILS}
</ul>

{else}
<div class="mcs-no-result">
  <div class="text">
    <span>Aucun résultat n'est disponible.</span>
    <span>Vous pouvez tenter de modifier vos filtres et effectuer une nouvelle recherche.</span>
  </div>
</div>
{/if}
{if !empty($thumb_navbar)}
	{include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$thumb_navbar}
{/if}

{if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}
</div>{* <!-- content --> *}
{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
