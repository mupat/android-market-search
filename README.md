# android-market-search


Simple wrapper for android play market to search for app informations in API way. Like the itunes search api.

## Disclaimer

This is not an official google API. I am not afiliated with Google in any way and am not responsible of any damage that could be done with it. Use it at your own risk.

## Installation
For using it you need to start on your own server or local machine, like a normal node application.

```
npm install
```
```
coffee server.coffee (or any other start environment you prefer)
```

You can define the port via process variable

```
PORT=3333 coffee server.coffee
```


## Usage
If the application is up and running you can use by requesting the play store with a specific ```bundleId```

```
<domain>:<port>/?bundleId=<string>
```

### Example
Request

```
http://localhost:3333/?bundleId=com.ebay.kleinanzeigen
```

Response

```json
{
bundle_identifier: "com.ebay.kleinanzeigen",	
	language: "en",
app_url: "https://play.google.com/store/apps/details?id=com.ebay.kleinanzeigen",
logo: "https://lh3.ggpht.com/0IynlHiRW0EOI_s0OLRo1m_mbFPaLpyRW6nJKOdBVLMrH7cbdPea1ECi8tgPQX9_HA",
app_name: "eBay Kleinanzeigen for Germany",
developer: "eBay Classifieds Group",
developer_link: "https://play.google.com/store/apps/developer?id=eBay+Classifieds+Group",
category: "Lifestyle",
price: "Free",
screenshots: [
"https://lh3.ggpht.com/ANDNYgRSnBMAbH9WskSFpH5lqS_CyELoDU9ODL3inZCpnS19HOZsGR-mBxtg9angV_uq",
"https://lh3.ggpht.com/yNYgzNGlXX5mVu-BWMq2DVWAq9dC01c3r_qZIk-sg6gD7QTqqZCo37QFXORlPXzyfdl4",
"https://lh3.ggpht.com/4BZpJDp3qT8yaFNZWyr78LVqa0jz86dHAtY_l7fF6iwoRJRHmFy-2aeC8j7K4BofA_Y",
"https://lh5.ggpht.com/XRnxzKMXT86Qsc-Zzc4aMddZ-1WUDkfQvA1RJzTZsV7Ttwv4R-V2nwF9bUPNJduBcAU",
"https://lh4.ggpht.com/k5IsEw_mYM2ptKRZEPczTNBj-b1llykpXi5Z3nkB8AD8OybwLrLoVQE7i-thhPRLqiA",
"https://lh4.ggpht.com/1x-y19fr-1r4exf4nHv_f-UXyVyZshag5H8tIL4lFot4-7HBu3981FBI4J-v4QEC8g",
"https://lh3.ggpht.com/dBQSH32pADUjFUP4Uyv93QZKGGrYIWpxrwpYAjrrtokkJEEUIPNmrAZ4zD4b-pPBeQ"
],
description: "*Perfect for searching and posting free classified ads in your neighborhood in Germany. No matter if it's a used car, a flat for rent, second-hand furniture, a new job, or stuff for the kids. With the eBay Kleinanzeigen app, you can find over 4 million ads in more than 280 categories -­ for free. Install the free app now and get started! *Features*[✔] Post your ads for free----> Select a category, write a description, take a picture, and you’re ready to go [✔] Find ads near you----> Choose your location or use GPS to see all ads nearby [✔] Always up-to-date----> The latest ads from your neighborhood wherever you are*In case of suggestions or problems, you can send us e-mails to androidsupport@ebay-kleinanzeigen.de or call us at 033203/851555 (available on weekdays from 10.00 am to 6.00 pm)* *In these categories, you can find, sell, buy, swap, and give away almost anything*• Cars, bicycles & boats • Family, baby & kids stuff • Leisure, hobby & community • Home & garden • Jobs • Flats & houses • Pets • Multimedia & electronics • Music, film & books • Fashion & beauty • Tickets • Free stuff & stuff to swap/trade • Classes & lessonsIn case of suggestions or problems, you can send us e-mails to androidsupport@ebay-kleinanzeigen.de or call us at 033203/851555 (available on workdays from 10.00 to 12.00 am and from 2.00 to 5.00 pm)",
rating_value: "4.2079315",
rating_count: "9960",
last_update: "July 11, 2013",
file_size: "3.6M",
downloads: "1,000,000 - 5,000,000",
version: "3.0.2",
os_version: "2.2 and up",
content_rating: "Low Maturity"
}
```

By default the request is to the play store is in englisch. If you like to change it, provide a second parameter.

```
<domain>:<port>/?bundleId=<string>&lang=<shortcode>
```

### Example
Request

```
http://localhost:3333/?bundleId=com.ebay.kleinanzeigen&lang=de
```

Response

```json
{
bundle_identifier: "com.ebay.kleinanzeigen",
language: "de",
app_url: "https://play.google.com/store/apps/details?id=com.ebay.kleinanzeigen",
logo: "https://lh3.ggpht.com/0IynlHiRW0EOI_s0OLRo1m_mbFPaLpyRW6nJKOdBVLMrH7cbdPea1ECi8tgPQX9_HA",
app_name: "eBay Kleinanzeigen",
developer: "eBay Classifieds Group",
developer_link: "https://play.google.com/store/apps/developer?id=eBay+Classifieds+Group",
category: "Lifestyle",
price: "Kostenlos",
screenshots: [
"https://lh3.ggpht.com/ANDNYgRSnBMAbH9WskSFpH5lqS_CyELoDU9ODL3inZCpnS19HOZsGR-mBxtg9angV_uq",
"https://lh3.ggpht.com/yNYgzNGlXX5mVu-BWMq2DVWAq9dC01c3r_qZIk-sg6gD7QTqqZCo37QFXORlPXzyfdl4",
"https://lh3.ggpht.com/4BZpJDp3qT8yaFNZWyr78LVqa0jz86dHAtY_l7fF6iwoRJRHmFy-2aeC8j7K4BofA_Y",
"https://lh5.ggpht.com/XRnxzKMXT86Qsc-Zzc4aMddZ-1WUDkfQvA1RJzTZsV7Ttwv4R-V2nwF9bUPNJduBcAU",
"https://lh4.ggpht.com/k5IsEw_mYM2ptKRZEPczTNBj-b1llykpXi5Z3nkB8AD8OybwLrLoVQE7i-thhPRLqiA",
"https://lh4.ggpht.com/1x-y19fr-1r4exf4nHv_f-UXyVyZshag5H8tIL4lFot4-7HBu3981FBI4J-v4QEC8g",
"https://lh3.ggpht.com/dBQSH32pADUjFUP4Uyv93QZKGGrYIWpxrwpYAjrrtokkJEEUIPNmrAZ4zD4b-pPBeQ"
],
description: "*Das meistbesuchte Kleinanzeigenportal Deutschlands. Ideal zum Suchen und Einstellen von Kleinanzeigen in eurer direkten Umgebung. Egal ob Gebrauchtwagen, Mietwohnungen, Jobs, gebrauchte Möbel oder Kindersachen. Mit der eBay Kleinanzeigen App für Android-Smartphones habt ihr vollen Zugriff auf alle Inserate aus über 280 Kategorien, jederzeit und kostenlos.*Das kann die Android App*[✔] Kostenlos Anzeigen aufgeben----> Kategorie auswählen, kurze Beschreibung eingeben, Foto machen, fertig![✔] Kleinanzeigen in eurer Nähe finden----> Über Ortseingabe oder GPS alle Anzeigen in eurer Umgebung finden.[✔] Ständig neue Kleinanzeigen----> Neueste Anzeigen aus eurer Umgebung, wo immer ihr euch befindet.*In diesen Kategorien kann man fast alles finden, kaufen, verkaufen, tauschen und verschenken*• Auto, Rad & Boot• Familie, Kind & Baby• Freizeit & Nachbarschaft• Haus & Garten• Jobs• Immobilien• Haustiere• Multimedia & Elektronik• Musik, Film & Bücher• Mode & Beauty• Eintrittskarten & Tickets• Zu verschenken & Tauschen• Unterricht & KurseVielen Dank für eure Hinweise. Wir arbeiten weiter daran, die App für euch zu verbessern.Bei weiteren Vorschlägen oder Problemen freuen wir uns über E-Mails an androidsupport@ebay-kleinanzeigen.de und Anrufe unter 033203/851555 (werktags von 10.00 bis 12.00 und von 14.00 bis 17.00 Uhr erreichbar)",
rating_value: "4.2079315",
rating_count: "9960",
last_update: "11. Juli 2013",
file_size: "3,6M",
downloads: "1.000.000–5.000.000",
version: "3.0.2",
os_version: "2.2 oder höher",
content_rating: "Stufe 3 - Niedrig"
}
```
