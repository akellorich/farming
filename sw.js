const CACHE_NAME = 'jukam-farm-v2';
const ASSETS_TO_CACHE = [
    'index.php',
    'css/bootstrap.css',
    'css/all.css',
    'css/style.css',
    'css/login.css',
    'css/alert.css',
    'image/icon-72x72.png',
    'image/icon-96x96.png',
    'image/icon-128x128.png',
    'image/icon-144x144.png',
    'image/icon-152x152.png',
    'image/icon-192x192.png',
    'image/icon-384x384.png',
    'image/icon-512x512.png',
    'manifest.json'
];

// Install Service Worker
self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME).then((cache) => {
            return cache.addAll(ASSETS_TO_CACHE);
        })
    );
});

// Activate and Cleanup Old Caches
self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then((cacheNames) => {
            return Promise.all(
                cacheNames.map((cache) => {
                    if (cache !== CACHE_NAME) {
                        return caches.delete(cache);
                    }
                })
            );
        })
    );
});

// Fetch Strategy: Network First falling back to Cache
self.addEventListener('fetch', (event) => {
    event.respondWith(
        fetch(event.request).catch(() => {
            return caches.match(event.request);
        })
    );
});
