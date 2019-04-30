﻿#
# Copyright 2019, Alexis La Goutte <alexis dot lagoutte at gmail dot com>
# Copyright 2019, Benjamin Perrier <ben dot perrier at outlook dot com>
#
# SPDX-License-Identifier: Apache-2.0
#

function Get-FGTAddressgroup {

    <#
        .SYNOPSIS
        Get addresses group configured

        .DESCRIPTION
        Show addresses group configured (Name, Member...)

        .EXAMPLE
        Get-FGTAddressgroup

        Display all addresses group.

    #>

    Param(
        [Parameter(Mandatory = $false)]
        [switch]$skip
    )

    Begin {
    }

    Process {

        $invokeParams = @{ }
        if ( $PsBoundParameters.ContainsKey('skip') ) {
            $invokeParams.add( 'skip', $skip )
        }

        $response = Invoke-FGTRestMethod -uri 'api/v2/cmdb/firewall/addrgrp' -method 'GET' @invokeParams
        $response.results
    }

    End {
    }
}