// GENERAL

// disable about:config warning
user_pref("browser.aboutConfig.showWarning", false);

// disable default browser check
user_pref("browser.shell.checkDefaultBrowser", false);

// allow userChrome/userContent
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// disable automatic updates
user_pref("app.update.auto", false);

// set preferred language for displaying pages
user_pref("intl.accept_languages", "en-US, en");

// restore the previous session on startup
user_pref("browser.startup.page", 3);

// disable showing about:blank as soon as possible during startup
user_pref("browser.startup.blankWindow", false);

// APPEARANCE

// use Dusk dark theme
user_pref("ui.systemUsesDarkTheme", 1);
user_pref("extensions.activeThemeID", "nova-dusk@mozilla.org");

// compact density, with the toolbar blending into the macOS titlebar
user_pref("browser.uidensity", 1);
user_pref("widget.macos.titlebar-blend-mode.behind-window", true);

// fonts
user_pref("font.name.monospace.x-western", "JetBrainsMono Nerd Font");
user_pref("font.size.variable.x-western", 14);

// reader view
user_pref("reader.content_width", 9);
user_pref("reader.font_size", 3);
user_pref("reader.font_weight", "light");

// hide the sidebar when it's closed
user_pref("sidebar.visibility", "hide-on-close");

// BOOKMARKS

// hide the bookmarks toolbar, but save new bookmarks to it
user_pref("browser.toolbars.bookmarks.visibility", "never");
user_pref("browser.bookmarks.defaultLocation", "toolbar_____");
user_pref("browser.bookmarks.showMobileBookmarks", false);

// open bookmarks in a new tab
user_pref("browser.tabs.loadBookmarksInTabs", true);

// NEW TAB PAGE (Activity Stream)

// disable Activity Stream telemetry
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);

// disable stories and sponsored content
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.section.topstories.rows", 2);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false);

// clear default topsites and hide shortcuts, highlights, search, and weather
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);

// don't recommend extensions or features as you browse
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// ADD-ONS

// disable recommendation pane in about:addons (uses Google Analytics)
user_pref("extensions.getAddons.showPane", false);

// disable recommendations in about:addons' Extensions and Themes panes
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// disable personalized extension recommendations
user_pref("browser.discovery.enabled", false);

// disable mozAddonManager Web API
user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);

// disable webextension restrictions on certain mozilla domains
user_pref("extensions.webextensions.restrictedDomains", "");

// remove built-in extra permissions for Mozilla sites
user_pref("permissions.manager.defaultsUrl", "");

// prevent Mozilla web pages from controlling the browser UI for product tours
user_pref("browser.uitour.enabled", false);

// TELEMETRY

// disable new data submission
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// disable Health Reports and the daily usage ping
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);

// disable telemetry
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);

// STUDIES

// disable Studies
user_pref("app.shield.optoutstudies.enabled", false);

// disable Normandy/Shield
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// CRASH REPORTS

// disable Crash Reports
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);

// enforce no submission of backlogged Crash Reports
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

// AI FEATURES

// block AI features
user_pref("browser.ai.control.default", "blocked");
user_pref("browser.ai.control.linkPreviewKeyPoints", "blocked");
user_pref("browser.ai.control.pdfjsAltText", "blocked");
user_pref("browser.ai.control.sidebarChatbot", "blocked");
user_pref("browser.ai.control.smartTabGroups", "blocked");
user_pref("browser.ai.control.smartWindow", "blocked");
user_pref("browser.ai.control.translations", "blocked");

// disable the AI chat sidebar, link previews, and smart window memories
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.linkPreview.enabled", false);
user_pref("browser.smartwindow.memories.generateFromConversation", false);
user_pref("browser.smartwindow.memories.generateFromHistory", false);

// disable translations and PDF alt-text generation
user_pref("browser.translations.enable", false);
user_pref("pdfjs.enableAltText", false);

// NETWORK

// use HTTPS-only mode, without a background plain-HTTP retry that leaks the URL
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_send_http_background_request", false);

// use beaconDB instead of Google for location lookups
user_pref("geo.provider.network.url", "https://api.beacondb.net/v1/geolocate");

// ask sites not to sell or share data
user_pref("privacy.globalprivacycontrol.enabled", true);

// disable Captive Portal detection and connectivity checks
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);

// disable region lookups based on IP address
user_pref("browser.region.update.enabled", false);

// show internationalized domain names as punycode, to expose look-alike domains
user_pref("network.IDN_show_punycode", true);

// limit WebRTC to the default route's address, so local and off-VPN addresses aren't exposed
user_pref("media.peerconnection.ice.default_address_only", true);

// BLOCK IMPLICIT OUTBOUND [not explicitly asked for - e.g. clicked on]

// disable link prefetching
user_pref("network.prefetch-next", false);

// disable DNS prefetching
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

// disable speculative connections from bookmarks and history
user_pref("browser.places.speculativeConnect.enabled", false);

// disable link-mouseover opening connection to linked server
user_pref("network.http.speculative-parallel-limit", 0);

// enforce no "Hyperlink Auditing" (click tracking)
user_pref("browser.send_pings", false);

// disable sending additional analytics to web servers
user_pref("beacon.enabled", false);

// LOCATION BAR

// display all parts of the URL in the location bar
user_pref("browser.urlbar.trimURLs", false);

// disable location bar making speculative connections
user_pref("browser.urlbar.speculativeConnect.enabled", false);

// disable sponsored location bar contextual suggestions
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);

// disable search engine suggestions
user_pref("browser.urlbar.suggest.engines", false);

// disable trending searches in an empty location bar
user_pref("browser.urlbar.trending.featureGate", false);

// FIND IN PAGE

// highlight all matches, and increase the maximum number of results shown with ⌘-F
user_pref("findbar.highlightAll", true);
user_pref("accessibility.typeaheadfind.matchesCountLimit", 10000);

// FORMS & PASSWORDS

// disable search and form history
user_pref("browser.formfill.enable", false);

// disable Form Autofill
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.available", "off");
user_pref("extensions.formautofill.creditCards.available", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

// disable the built-in password manager, password generation, and breach alerts
user_pref("signon.rememberSignons", false);
user_pref("signon.generation.enabled", false);
user_pref("signon.management.page.breach-alerts.enabled", false);

// disable auto-filling username & password form fields
user_pref("signon.autofillForms", false);

// block cross-site images and frames from showing login prompts
user_pref("network.auth.subresource-http-auth-allow", 1);

// prevents websites from blocking clipboard usage; helpful when pasting passwords from a password manager
user_pref("dom.event.clipboardevents.enabled", false);

// ETP (ENHANCED TRACKING PROTECTION)

// enable ETP Strict Mode, without site exceptions
user_pref("browser.contentblocking.category", "strict");
user_pref("privacy.trackingprotection.allow_list.baseline.enabled", false);

// CONTAINERS

// enable Container Tabs and its UI setting
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);

// SHUTDOWN & SANITIZING

// set/enforce what items to clear on shutdown
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown_v2.cache", true);
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", false);
user_pref("privacy.clearHistory.browsingHistoryAndDownloads", false);
user_pref("privacy.clearOnShutdown_v2.formdata", true);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);
user_pref("privacy.clearHistory.cookiesAndStorage", false);

// keep site permissions, including cookie exceptions
user_pref("privacy.clearOnShutdown_v2.siteSettings", false);

// DOWNLOADS & FILES

// remove temp files opened with an external application
user_pref("browser.helperApps.deleteTempFileOnExit", true);

// disable adding downloads to the system's "recent documents" list
user_pref("browser.download.manager.addToRecentDocs", false);

// disable media cache from writing to disk in Private Browsing
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("media.memory_cache_max_size", 65536);

// display advanced information on Insecure Connection warning pages
user_pref("browser.xul.error_pages.expert_bad_cert", true);

// WINDOWS & POPUPS

// prevent scripts from moving and resizing open windows
user_pref("dom.disable_window_move_resize", true);

// enforce links targeting new windows to open in a new tab instead
user_pref("browser.link.open_newwindow", 3);

// set all open window methods to abide by "browser.link.open_newwindow"
user_pref("browser.link.open_newwindow.restriction", 0);

// block popup windows
user_pref("dom.disable_open_during_load", true);

// limit events that can cause a popup
user_pref("dom.popup_allowed_events", "click dblclick mousedown pointerdown");

// RFP (RESIST FINGERPRINTING)

// enable privacy.resistFingerprinting
// user_pref("privacy.resistFingerprinting", true);

// set the window size
// user_pref("privacy.window.maxInnerWidth", 1600);
// user_pref("privacy.window.maxInnerHeight", 900);

// enable RFP letterboxing
// user_pref("privacy.resistFingerprinting.letterboxing", true);
// user_pref("privacy.resistFingerprinting.letterboxing.dimensions", "");

// experimental RFP
// user_pref("privacy.resistFingerprinting.exemptedDomains", "*.example.invalid");
// user_pref("privacy.resistFingerprinting.testGranularityMask", 0);

// set RFP's font visibility level
// user_pref("layout.css.font-visibility.resistFingerprinting", 1);

// disable using system colors
// user_pref("browser.display.use_system_colors", false);

// enforce non-native widget theme
// user_pref("widget.non-native-theme.enabled", true);
