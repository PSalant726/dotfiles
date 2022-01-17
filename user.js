// disable about:config warning
user_pref("browser.aboutConfig.showWarning", false);

// disable default browser check
user_pref("browser.shell.checkDefaultBrowser", false);

// disable some Activity Stream items
// Activity Stream is the default homepage/newtab based on metadata and browsing behavior
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// clear default topsites
user_pref("browser.newtabpage.activity-stream.default.sites", "");

// set preferred language for displaying pages
user_pref("intl.accept_languages", "en-US, en");

// disable recommendation pane in about:addons (uses Google Analytics)
user_pref("extensions.getAddons.showPane", false);
// disable recommendations in about:addons' Extensions and Themes panes
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// TELEMETRY
// disable new data submission
user_pref("datareporting.policy.dataSubmissionEnabled", false);
// disable Health Reports
user_pref("datareporting.healthreport.uploadEnabled", false);
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
// disable Telemetry Coverage
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
// disable PingCentre telemetry (used in several System Add-ons)
user_pref("browser.ping-centre.telemetry", false);

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

// disable Captive Portal detection
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);

// BLOCK IMPLICIT OUTBOUND [not explicitly asked for - e.g. clicked on]
// disable link prefetching
user_pref("network.prefetch-next", false);
// disable DNS prefetching
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
// disable predictor / prefetching
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);
// disable link-mouseover opening connection to linked server
user_pref("network.http.speculative-parallel-limit", 0);
// enforce no "Hyperlink Auditing" (click tracking)
user_pref("browser.send_pings", false);

// display all parts of the URL in the location bar
user_pref("browser.urlbar.trimURLs", false);

// disable location bar making speculative connections
user_pref("browser.urlbar.speculativeConnect.enabled", false);

// disable sponsored location bar contextual suggestions
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);

// disable search and form history
user_pref("browser.formfill.enable", false);
// disable Form Autofill
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.available", "off");
user_pref("extensions.formautofill.creditCards.available", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.heuristics.enabled", false);
// disable auto-filling username & password form fields
user_pref("signon.autofillForms", false);

// disable media cache from writing to disk in Private Browsing
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("media.memory_cache_max_size", 65536);

// display advanced information on Insecure Connection warning pages
user_pref("browser.xul.error_pages.expert_bad_cert", true);

// CONTAINERS
// enable Container Tabs and its UI setting
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);

// prevent scripts from moving and resizing open windows
user_pref("dom.disable_window_move_resize", true);

// block popup windows
user_pref("dom.disable_open_during_load", true);
// limit events that can cause a popup
user_pref("dom.popup_allowed_events", "click dblclick mousedown pointerdown");

// disable sending additional analytics to web servers
user_pref("beacon.enabled", false);

// remove temp files opened with an external application
user_pref("browser.helperApps.deleteTempFileOnExit", true);

// disable adding downloads to the system's "recent documents" list
user_pref("browser.download.manager.addToRecentDocs", false);

// ETP (ENHANCED TRACKING PROTECTION)
// enable ETP Strict Mode
user_pref("browser.contentblocking.category", "strict");
// enable state partitioning of service workers
user_pref("privacy.partition.serviceWorkers", true);

// SHUTDOWN & SANITIZING
// delete cookies and site data on exit
user_pref("network.cookie.lifetimePolicy", 2);
// set third-party cookies to session-only
user_pref("network.cookie.thirdparty.sessionOnly", true);
user_pref("network.cookie.thirdparty.nonsecureSessionOnly", true);
// enable Firefox to clear items on shutdown
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
// set/enforce what items to clear on shutdown
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.cpd.history", false);
user_pref("privacy.clearOnShutdown.sessions", false);
user_pref("privacy.clearOnShutdown.offlineApps", false);
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.cpd.cookies", false);

// RFP (RESIST FINGERPRINTING)
// enable privacy.resistFingerprinting
user_pref("privacy.resistFingerprinting", true);
// disable mozAddonManager Web API
user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);
// disable webextension restrictions on certain mozilla domains
user_pref("extensions.webextensions.restrictedDomains", "");
// set the window size
user_pref("privacy.window.maxInnerWidth", 1600);
user_pref("privacy.window.maxInnerHeight", 900);
// disable RFP letterboxing
user_pref("privacy.resistFingerprinting.letterboxing", false);
// user_pref("privacy.resistFingerprinting.letterboxing.dimensions", "");
// experimental RFP
// user_pref("privacy.resistFingerprinting.exemptedDomains", "*.example.invalid");
// user_pref("privacy.resistFingerprinting.testGranularityMask", 0);
// set RFP's font visibility level
user_pref("layout.css.font-visibility.resistFingerprinting", 1);
// disable showing about:blank as soon as possible during startup
user_pref("browser.startup.blankWindow", false);
// disable using system colors
user_pref("browser.display.use_system_colors", false);
// enforce non-native widget theme
user_pref("widget.non-native-theme.enabled", true);
// enforce links targeting new windows to open in a new tab instead
user_pref("browser.link.open_newwindow", 3);
// set all open window methods to abide by "browser.link.open_newwindow"
user_pref("browser.link.open_newwindow.restriction", 0);
// disable WebGL (Web Graphics Library)
user_pref("webgl.disabled", true);

// disable automatic updates
user_pref("app.update.auto", false);

// allow userChrome/userContent
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// open bookmarks in a new tab
user_pref("browser.tabs.loadBookmarksInTabs", true);

// don't recommend extensions as you browse
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
// don't recommend features as you browse
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// increase the maximum number of results shown when searching a page for text with ⌘-F
user_pref("accessibility.typeaheadfind.matchesCountLimit", 10000)

// prevents websites from blocking clipboard usage; helpful when pasting passwords from a password manager
user_pref("dom.event.clipboardevents.enabled", false)

// use dark theme
user_pref("ui.systemUsesDarkTheme", 1);
user_pref("browser.theme.dark-toolbar-theme", true)
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org")
