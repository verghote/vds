<?php

/**
 * Classe utilitaire dédiée à l’analyse de l’environnement client HTTP.
 * Permet notamment de détecter les robots, identifier le navigateur et l’OS.
 *
 * Toutes les méthodes sont statiques car la classe n’a pas besoin d’instanciation :
 * elle s’appuie uniquement sur des superglobales (ex. $_SERVER).
 *
 * @author Guy Verghote
 * @version 2025.1
 * @date 05/05/2025
 */
class ClientHttp
{
    /**
     * Détecte si le client actuel est probablement un robot ou un crawler.
     * La détection est basée sur l’analyse heuristique de la chaîne User-Agent.
     * Cette méthode ne garantit pas l’exactitude, mais élimine la majorité des robots connus.
     *
     * @return bool true si l’on soupçonne un robot, false sinon.
     */
    public static function estUnRobot(): bool
    {
        $agent = $_SERVER['HTTP_USER_AGENT'] ?? '';
        if ($agent === '') {
            return false; // Aucun User-Agent : souvent CLI, CRON ou PHP en local
        }
        // Liste unique de motifs, spécifiques puis génériques (ordre important)
        $motifs = [
            'Googlebot', 'Bingbot', 'Slurp', 'DuckDuckBot', 'Baiduspider',
            'YandexBot', 'Sogou', 'Exabot', 'facebookexternalhit',
            'bot', 'crawl', 'spider', 'wget', 'curl', 'python', 'libwww', 'scrapy', 'nutch'
        ];
        foreach ($motifs as $motif) {
            if (stripos($agent, $motif) !== false) {
                return true;
            }
        }
        return false;
    }

    /**
     * Tente d’identifier le navigateur web utilisé par le client.
     * @return string Nom du navigateur détecté, ou "Inconnu".
     */
    public static function getNavigateur(): string
    {
        $ua = $_SERVER['HTTP_USER_AGENT'] ?? '';

        // Exemples simples. Pour une détection plus fiable, utiliser une librairie tierce.
        if (stripos($ua, 'firefox') !== false) return 'Firefox';
        if (stripos($ua, 'edg') !== false)     return 'Edge';
        if (stripos($ua, 'chrome') !== false)  return 'Chrome';
        if (stripos($ua, 'safari') !== false)  return 'Safari';
        if (stripos($ua, 'opera') !== false || stripos($ua, 'opr') !== false) return 'Opera';
        return 'Inconnu';
    }

    /**
     * Tente d’identifier le système d’exploitation du client.
     * @return string Nom de l’OS détecté, ou "Inconnu".
     */
    public static function getSystemeExploitation(): string
    {
        $ua = $_SERVER['HTTP_USER_AGENT'] ?? '';

        if (stripos($ua, 'windows') !== false) return 'Windows';
        if (stripos($ua, 'macintosh') !== false || stripos($ua, 'mac os') !== false) return 'macOS';
        if (stripos($ua, 'linux') !== false)   return 'Linux';
        if (stripos($ua, 'android') !== false) return 'Android';
        if (stripos($ua, 'iphone') !== false || stripos($ua, 'ipad') !== false) return 'iOS';
        return 'Inconnu';
    }

    /**
     * Renvoie l’adresse IP du client en prenant en compte les proxys éventuels.
     * @return string Adresse IP du client ou "0.0.0.0" si inconnue.
     */
    public static function getAdresseIP(): string
    {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            return $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            // Peut contenir une liste de IP séparées par des virgules.
            $ip = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR'])[0];
            return trim($ip);
        } elseif (!empty($_SERVER['REMOTE_ADDR'])) {
            return $_SERVER['REMOTE_ADDR'];
        }
        return '0.0.0.0';
    }
}
