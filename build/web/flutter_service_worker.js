'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "d5c12cb617d92bfe2bdc6992ba28c053",
"/": "d5c12cb617d92bfe2bdc6992ba28c053",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
".git/HEAD": "36d2e6bfefea098ed28d3260f6fd2002",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/COMMIT_EDITMSG": "7f2cd073622b49ae1655cffd8463aeb7",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/refs/remotes/origin/deploy": "50490a3a8d09627504798b81e26f4cf8",
".git/refs/heads/deploy": "50490a3a8d09627504798b81e26f4cf8",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/logs/HEAD": "ffc54be25a040934f7ff1fe3d3be9422",
".git/logs/refs/remotes/origin/deploy": "94c100a2dd0da8e8587d72e066b58515",
".git/logs/refs/heads/deploy": "ffc54be25a040934f7ff1fe3d3be9422",
".git/config": "9020b5fce4d22a3f27803cedc6fd898a",
".git/index": "adc680de0ad6b66628485c9bfd9c6532",
".git/objects/73/3a0e254b30f06d952872365f8794b911e161e6": "55a68eb9e4370987a6c67a5bb2c5e21b",
".git/objects/08/32d0db2def1613c1c45aa4fe9156a1c6b7d589": "e05df183e5eeaddf39672a2516f9c41d",
".git/objects/41/5c059c8094b888b0159fdedfd4e3cb08a8028e": "86914685ccd40e82a7fe5b70459fb9f7",
".git/objects/1b/b5cc9b06e4551a7c857187336cf349da74241e": "65b149068e81de671a858b9e5396c3fe",
".git/objects/19/816a503f2f9f11dbf9ae3257d69809190b9b5f": "976576dd3cb371c26695c955efb1b77d",
".git/objects/af/338506ecb8bb0a2f07923dedd81aa8daccace6": "502018c2e3b42b40230d5bedc02e56d0",
".git/objects/63/4fcb4f5c906ca44d95ba4ee55ae3fc7f1f1dd0": "1d4fff2882b36af471708a4619c3cc80",
".git/objects/0f/67b3e73430505562cc0065c09853a65cfec0f6": "d7fd6874e20b3d67766764c809e804c8",
".git/objects/d0/23371979cf1e985205df19078051c10de0a82d": "700b71074bad7afee32068791dec7442",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/92/eab450609b7dc5d076ddf6c8416de8209373e0": "9b3d4cb7f5916a87f36a18b466ea7ac4",
".git/objects/d5/80ce749ea55b12b92f5db7747290419c975070": "8b0329dbc6565154a5434e6a0f898fdb",
".git/objects/d5/bb50b3c3bc534b51ba035a5e8495ba7af5025b": "81d30e6f235d2cd1960b1a0d917b3043",
".git/objects/72/00c904519e2feee6415dc8c54008a7a14bdf4e": "22ea7ef2bc8fe46674cfbacb13ae2c61",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/38/7b1d5e3f20a85ec3855e17853f1eaf992ab6d7": "683da33c7b18070738756b1e84360368",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/8c/99266130a89547b4344f47e08aacad473b14e0": "41375232ceba14f47b99f9d83708cb79",
".git/objects/45/31e4ac0054778ce6ece78d852e5c7712fdfbb8": "5a2ec0b72663e3ad52facbb16990e93b",
".git/objects/13/e481579f72973426f667a085162e2416f91392": "636f8001352760a504dae92ad344b035",
".git/objects/2b/66368b680a9124c4206ed70fe4536ed2fa920d": "786de05433a8e42a9102926dc84f569e",
".git/objects/2b/b4b86b225602415af6278918d806d2cb577d44": "92ca6397c12ba5c7ac31b231f0d8af86",
".git/objects/9f/a043870598a049fb78e13ad78330ca6f1c1398": "2668dd49b779015ddea211ee6b973e85",
".git/objects/05/fe748207ad4e06e483159591e6a202069ce777": "3f634297ea178daf9fce225dd15df807",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/0b/41ae1c0f9328fbcce5daf588faa864954fb6dc": "8ccd4ea40110da1c29ff0ad733339c5d",
".git/objects/5d/803ac095a30dd53f2019e2695fd0f6798f776d": "d7fc8ea46e1d7e9a4ed08d517538d48e",
".git/objects/71/03c601bc8a97abd14606e7ca26b35cda1afde9": "57f46085b0a2732eddfd0b6e5e042c32",
".git/objects/f4/676ca7a1be08e5351907fa67dbea7b51b70239": "14eaf65d882c862f97d61a48825d1fe9",
".git/objects/f4/05934a0e11be336ada6b67b73bd4822e6fbeec": "b13ded6d9ef8118e28cbcf1a0239ff88",
".git/objects/df/a4e8dde931e8e1159350326b35bba2e0cfe819": "b5484da726629af5c3a12ba3a5d30796",
".git/objects/4f/0790d05fb93785519e488a0d6f33af5c915e5c": "17a925a5fd36187f65ec206a5497f5e2",
".git/objects/f1/f093446433f35b8b6feac8c689c2fa60ebc412": "b6a096b3019a71e7bd427c1455096213",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391": "c70c34cbeefd40e7c0149b7a0c2c64c2",
".git/objects/44/a8b8e41b111fcf913a963e318b98e7f6976886": "5014fdb68f6b941b7c134a717a3a2bc6",
".git/objects/2f/6ea39b5d4c9a6b004cd9c2fb9fcf7b6f75a724": "de62e1b698bc1ea7d9d8146f0f53bb6c",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/132251547b19d060082f3bc30eeb5635c38fbc": "317eb9e8215917d463434ddcde7d5014",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/65/1d319d86e3154617803bdd9a55052bef8e50a2": "30ce8157810e9a386b29fb04005f2e60",
".git/objects/76/0ff6af40e4946e3b2734c0e69a6e186ab4d8f4": "009b8f1268bb6c384d233bd88764e6f8",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/d9bbbfa758e9f751ecb4635307563bd3e034c5": "286a9b9ed18f61ea0549e8ef9adc3de3",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/b8/3c169d29289ad2a176ab9c85ab56783c76de95": "91b9771870192dc8505d78af5b9fdef7",
".git/objects/50/6e21dbfc8d39a28c96cbf8bf758a6bc8f0b6cd": "dda36595959bef1d8a04b83f317a9a37",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/fd/5ad17563caf9e8a6d145850a631d8e3440ddbe": "1ecce17bb4245a9a6fde137620a5b2e5",
".git/objects/35/85ecd8053c698bad0263239d599a8dbc1559b6": "58a70df29653ffc1e5a9aa02e0b4e799",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/10/92fccfe0e08d15978636cbac9d8777abc5ba0d": "822781aed018258726975658078bbf54",
".git/objects/b3/b7787c454744c43b738eab078cccf70aa4bea3": "a25eec4781d62011d169f751c654290d",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ac/edd5a28d008982f91c2abbd6eefcd07e60c4ab": "ae8a261993ec02ac4ef51839c524d5fe",
".git/objects/b4/4eb214324ca5175088e2409bc03b05f4f8fd10": "01d1ba927a0e1cd5b70eb1d5daf430fd",
".git/objects/39/d0cf3700ba98440c9e3bac034d067fd38564de": "4147b8413aa6b17ca0dcb1a034913870",
".git/objects/43/329f531c486281311590a250c810970296218d": "0848884db66eacb4cda55f41e065bed2",
".git/objects/21/3487eb6ce6bfa7b32f62f1d80e50d1c4500c54": "40d637484e29b3b06b518568455da215",
".git/objects/d3/2ab6b899eefea2f0f19f200531f238bedb5ba9": "462934d89eff0482783d09983f0f01a3",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/70/be5c3a7966959af61096f2ea2b4166d286f707": "27f516999bcd8890d06ac83d59990b66",
".git/objects/5e/f6470128269595f7738e7749f0b53d7cc194d2": "06c6025eed9a5a050d6d5ca9f6292927",
".git/objects/f0/7f28c4c1a8ee285b92c482d6a20c563f59495e": "b58b19a1fe00039e9ca623a853f12df0",
".git/objects/ad/87bf003acbdb7d011f7dfeeb48e56d78ef3f6a": "3704749d5b12277f7651a3c0f96e2feb",
".git/objects/ad/4c0ba9842f4de544316a62269732d33f652961": "d2648c4f7ac6a01d24dedabffef3980b",
".git/objects/da/fd65422747502c19b5c74b4230282644d2169c": "d8a62caf99a372ff6c7692e143787ce3",
".git/objects/9c/fea8956e6c44f32d70f4b75d04e7f58a1db592": "89c705c6f179fc9c0e6fdab9e7b7252d",
".git/objects/f5/c0b3b73dbc1f09a904e5144ccaf2b15b770386": "cbd7547e50a00006e363f47ed2def728",
".git/objects/8a/914f7a3ddd85c277721cde52790d5bf0b04174": "629bb0d166aee9756a01792374a16e52",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/85/33aca703eb5df99adc48691f814aed695f69e1": "07267f7cf26cac50d310cf3f751f41f5",
".git/objects/42/a248f4deb169b0e5c875ce84dc45834833ddab": "8bd401786fe2341c9fb7b74f02c9b774",
".git/objects/55/dee2b27f60ab5578f9f9efda24d7c137f9ad95": "8c219f4aa9d601762ff5ea842d3c98cb",
".git/objects/55/a5ba76672fdf6d597c8db939ed636a14d48759": "dfab32e6efefe385805c4dc4fb7ff306",
".git/objects/8b/909afcd8cd8ecf9d86eaa923cf581c4e0759de": "19acafcb81038858b0d5b9d693b15584",
".git/objects/40/0d5b186c9951e294699e64671b9dde52c6f6a0": "f6bd3c7f9b239e8898bace6f9a7446b9",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/87/070df4ba13743abd28600a53737f0c1e5a3499": "512d884184566aa56ef0d08a641ee350",
"flutter_bootstrap.js": "3837e0bc00a0422d4204b0b772045d7d",
"main.dart.js": "23ba2362332e217afa02a955c4f422f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/lib/view/asset/chat_doctor.png": "dbb36f1823cc518ffd242a87573c941d",
"assets/lib/view/asset/health_care_logo.svg": "f5ce7639efae7b424613b3f336732eae",
"assets/lib/view/asset/admin_logo.jpg": "e5097d563c348bfe599257fa5a811d50",
"assets/lib/view/asset/dot%2520dot%2520vertical.png": "58e4b1390eb5a22cc9b708609471c192",
"assets/lib/view/asset/plus%2520plus%2520horizontal.png": "bc8ae7ac798ad4706c08ee88a552fc5d",
"assets/lib/view/asset/plus%2520plus%2520vertical.png": "c73d33319c4c9dc56224a25c2df38a2f",
"assets/lib/view/asset/dot%2520dot%2520horizontal.png": "8f4a1f4752b9d448bcb4737ab0ee24e3",
"assets/lib/view/asset/logo.png": "1a1117d5be89e17ebf6c61fd1fe8b93e",
"assets/lib/view/asset/icons8-google.svg": "eba94b82c9c504902bf14007abbec876",
"assets/lib/view/asset/login-Ilustration.jpg": "ad19e2b893ffa7d7ee3b45ddd0968f55",
"assets/lib/view/asset/photo-1529665253569-6d01c0eaf7b6.jpeg": "533b98317741dc33d49cf39ec216a40b",
"assets/lib/view/asset/cek_kesehatan.png": "19d327b2ea6cca4ff7103da90cfd45fb",
"assets/lib/view/asset/layanan_bidan.png": "f5bdcc58e946afce7b76a59f50187200",
"assets/lib/view/asset/toko_kesehatan.png": "b6e159f32d01d824577e339e52dc5e09",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "2a61382732f1698a23891c3a9559f397",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin": "6c32c08c644ea432bf6520c834819280",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "67b3d11f73d0779f347d84f03f5c7f23",
"assets/AssetManifest.bin.json": "1a6a40f00defeb98878c3e5941bb695e",
"assets/fonts/MaterialIcons-Regular.otf": "32c4ee2f708520706b8a88bfb75f61e6",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"manifest.json": "55257f6180a9c4c5fffe8310345eb34c",
"version.json": "143fc906d4d581e9203cbeab6ccb2d42",
"flutter.js": "f393d3c16b631f36852323de8e583132"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
