{ config, inputs, pkgs, lib, ... }:

{
  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = [ "id_ID.UTF-8/UTF-8" ];
  i18n.extraLocaleSettings = {
    LC_TIME = "id_ID.UTF-8";
  };
}
