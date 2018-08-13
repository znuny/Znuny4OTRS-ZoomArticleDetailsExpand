# --
# Copyright (C) 2012-2018 Znuny GmbH, http://znuny.com/
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
    $Self->{Translation}->{'Registers a PreApplication module that adds js for the package.'} = 'Registriert ein PreApplication Modul um Javascript für das Paket hinzuzufügen.';

    return 1;
}

1;
