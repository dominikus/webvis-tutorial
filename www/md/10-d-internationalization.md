# Internationalization



# i18next
<iframe src="http://i18next.com" class="full"></iframe>



# IDB - demo



# locale files
translation-en.json:
```javascript
{
  "header": {
    "download": "Data<br/>download",
    "printLocation": "Find more information on",
    "title": "Country Profiles",
    "tooltip": "Back to Data & statistics"
  },
  ...
```
translation-es.json:
```javascript
{
  "header": {
    "download": "Descargar<br/>datos",
    "printLocation": "Mas información en",
    "title": "Perfiles de País",
    "tooltip": "Volver a Datos y estadísticas"
  },
  ...
```



# i18next (HTML)
```html
<div class="menu-bar">
	<!-- add header.tooltip as [title] attribute -->
	<a href="http://logisticsportal.iadb.org" data-i18n="[title]header.tooltip"></a>
</div>
```
<br/><br/>
```coffeescript
# translate the menu bar
$('.menu-bar').i18n()
```



# i18next (code)
```coffeescript
if i18n.exists("#{indicator}.unit")
	dataUnits[indicator] = i18n.t("#{indicator}.unit")
else
	dataUnits[indicator] = ""
if i18n.exists("#{indicator}.format")
	dataFormat[indicator] = i18n.t("#{indicator}.format")
```
