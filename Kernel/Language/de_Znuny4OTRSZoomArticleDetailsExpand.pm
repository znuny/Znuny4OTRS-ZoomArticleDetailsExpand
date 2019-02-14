# --
# Copyright (C) 2012-2019 Znuny GmbH, http://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_Znuny4OTRSZoomArticleDetailsExpand;

use strict;
use warnings;

use utf8;

sub Data {
    my $Self = shift;

    # SysConfig
    $Self->{Translation}->{'Loader module registration for AgentTicketZoom.'} = 'Loader-Registrierung für AgentTicketZoom.';
    $Self->{Translation}->{'Pre-application module to add config settings to Javascript.'} = 'Pre-Application-Modul, welches Konfigurationsoptionen zu Javascript hinzufügt.';
    $Self->{Translation}->{'Expands details for all articles in complete article list.'} = 'Zeigt Details für alle Artikel in der kompletten Artikelliste an.';

    return 1;
}

1;
