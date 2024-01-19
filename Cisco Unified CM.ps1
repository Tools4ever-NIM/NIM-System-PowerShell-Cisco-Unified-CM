#
# Cisco Unified CM.ps1 - Cisco Unified CM (AXL API)
#
$Log_MaskableKeys = @(
    # Put a comma-separated list of attribute names here, whose value should be masked before 
    'Password'
)

#
# System functions
#
function Idm-SystemInfo {
    param (
        # Operations
        [switch] $Connection,
        [switch] $TestConnection,
        [switch] $Configuration,
        # Parameters
        [string] $ConnectionParams
    )

    Log info "-Connection=$Connection -TestConnection=$TestConnection -Configuration=$Configuration -ConnectionParams='$ConnectionParams'"
    
    if ($Connection) {
        @(
            @{
                name = 'hostname'
                type = 'textbox'
                label = 'Hostname'
                description = 'Hostname of server'
                value = ''
            }
            @{
                name = 'username'
                type = 'textbox'
                label = 'Username'
                label_indent = $true
                description = 'User account name'
                value = ''
            }
            @{
                name = 'password'
                type = 'textbox'
                password = $true
                label = 'Password'
                label_indent = $true
                description = 'User account password'
                value = ''
            }
            @{
                name = 'version'
                type = 'textbox'
                label = 'Version'
                label_indent = $true
                description = 'AXL API Version'
                value = '14.0'
            }
            @{
                name = 'use_proxy'
                type = 'checkbox'
                label = 'Use Proxy'
                description = 'Use Proxy server for requets'
                value = $false                  # Default value of checkbox item
            }
            @{
                name = 'proxy_address'
                type = 'textbox'
                label = 'Proxy Address'
                description = 'Address of the proxy server'
                value = 'http://localhost:8888'
                disabled = '!use_proxy'
                hidden = '!use_proxy'
            }
            @{
                name = 'use_proxy_credentials'
                type = 'checkbox'
                label = 'Use Proxy'
                description = 'Use Proxy server for requets'
                value = $false
                disabled = '!use_proxy'
                hidden = '!use_proxy'
            }
            @{
                name = 'proxy_username'
                type = 'textbox'
                label = 'Proxy Username'
                label_indent = $true
                description = 'Username account'
                value = ''
                disabled = '!use_proxy_credentials'
                hidden = '!use_proxy_credentials'
            }
            @{
                name = 'proxy_password'
                type = 'textbox'
                password = $true
                label = 'Proxy Password'
                label_indent = $true
                description = 'User account password'
                value = ''
                disabled = '!use_proxy_credentials'
                hidden = '!use_proxy_credentials'
            }
            @{
                name = 'nr_of_sessions'
                type = 'textbox'
                label = 'Max. number of simultaneous sessions'
                description = ''
                value = 5
            }
            @{
                name = 'sessions_idle_timeout'
                type = 'textbox'
                label = 'Session cleanup idle time (minutes)'
                description = ''
                value = 30
            }
        )
    }

    if ($TestConnection) {
        
    }

    if ($Configuration) {
        @()
    }

    Log info "Done"
}

function Idm-OnUnload {
}

#
# Object CRUD functions
#
$Properties = @{
    ApplicationUser = @(
        @{ name = 'pkid';                              options = @('default','key')                      }        
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'isstandard';                              options = @('default')                      }
        @{ name = 'userrank';                              options = @('default')                      }
    )
    ApplicationUserDeviceMap = @(
        @{ name = 'pkid';                              options = @('default','key')                      }        
        @{ name = 'description';                              options = @('default')                      }
        @{ name = 'fkdevice';                              options = @('default')                      }
        @{ name = 'fkapplicationuser';                              options = @('default')                      }
        @{ name = 'tkuserassociation';                              options = @('default')                      }
    )
    Line = @(
        @{ name = 'uuid';                              options = @('default','key')                      }    
        @{ name = 'pattern';                              options = @('default')                      }
        @{ name = 'description';                              options = @('default')                      }
        @{ name = 'usage';                              options = @('default')                      }
        @{ name = 'routePartitionName';                              options = @('default')                      }
        @{ name = 'aarNeighborhoodName';                              options = @('default')                      }
        @{ name = 'aarDestinationMask';                              options = @('default')                      }
        @{ name = 'aarKeepCallHistory';                              options = @('default')                      }
        @{ name = 'aarVoiceMailEnabled';                              options = @('default')                      }
        @{ name = 'callPickupGroupName';                              options = @('default')                      }
        @{ name = 'autoAnswer';                              options = @('default')                      }
        @{ name = 'networkHoldMohAudioSourceId';                              options = @('default')                      }
        @{ name = 'userHoldMohAudioSourceId';                              options = @('default')                      }
        @{ name = 'callingIdPresentationWhenDiverted';                              options = @('default')                      }
        @{ name = 'alertingName';                              options = @('default')                      }
        @{ name = 'asciiAlertingName';                              options = @('default')                      }
        @{ name = 'presenceGroupName';                              options = @('default')                      }
        @{ name = 'shareLineAppearanceCssName';                              options = @('default')                      }
        @{ name = 'voiceMailProfileName';                              options = @('default')                      }
        @{ name = 'patternPrecedence';                              options = @('default')                      }
        @{ name = 'releaseClause';                              options = @('default')                      }
        @{ name = 'hrDuration';                              options = @('default')                      }
        @{ name = 'hrInterval';                              options = @('default')                      }
        @{ name = 'cfaCssPolicy';                              options = @('default')                      }
        @{ name = 'defaultActivatedDeviceName';                              options = @('default')                      }
        @{ name = 'parkMonForwardNoRetrieveDn';                              options = @('default')                      }
        @{ name = 'parkMonForwardNoRetrieveIntDn';                              options = @('default')                      }
        @{ name = 'parkMonForwardNoRetrieveVmEnabled';                              options = @('default')                      }
        @{ name = 'parkMonForwardNoRetrieveIntVmEnabled';                              options = @('default')                      }
        @{ name = 'parkMonForwardNoRetrieveCssName';                              options = @('default')                      }
        @{ name = 'parkMonForwardNoRetrieveIntCssName';                              options = @('default')                      }
        @{ name = 'parkMonReversionTimer';                              options = @('default')                      }
        @{ name = 'partyEntranceTone';                              options = @('default')                      }
        @{ name = 'allowCtiControlFlag';                              options = @('default')                      }
        @{ name = 'rejectAnonymousCall';                              options = @('default')                      }
        @{ name = 'confidentialAccess';                              options = @('default')                      }
        @{ name = 'externalCallControlProfile';                              options = @('default')                      }
        @{ name = 'enterpriseAltNum';                              options = @('default')                      }
        @{ name = 'e164AltNum';                              options = @('default')                      }
        @{ name = 'pstnFailover';                              options = @('default')                      }
    )
    CallingSearchSpace = @(
        @{ name = 'uuid';                              options = @('default','key')                      }    
        @{ name = 'description';                              options = @('default')                      }
        @{ name = 'clause';                              options = @('default')                      }
        @{ name = 'dialPlanWizardGenId';                              options = @('default')                      }
        @{ name = 'partitionUsage';                              options = @('default')                      }
        @{ name = 'name';                              options = @('default')                      }

    )
    CommonPhoneConfig = @(
        @{ name = 'uuid';                              options = @('default','key')                      }    
        @{ name = 'description';                              options = @('default')                      }
        @{ name = 'dndOption';                              options = @('default')                      }
        @{ name = 'dndAlertingType';                              options = @('default')                      }
        @{ name = 'backgroundImage';                              options = @('default')                      }
        @{ name = 'phonePersonalization';                              options = @('default')                      }
        @{ name = 'phoneServiceDisplay';                              options = @('default')                      }
        @{ name = 'sshUserId';                              options = @('default')                      }
        @{ name = 'alwaysUsePrimeLine';                              options = @('default')                      }
        @{ name = 'allwaysUsePrimeLineForVoiceMessage';                              options = @('default')                      }
        @{ name = 'vpnGroupName';                              options = @('default')                      }
        @{ name = 'vpnProfileName';                              options = @('default')                      }
        @{ name = 'featureControlPolicy';                              options = @('default')                      }
    )
    Device = @(
    @{ name = 'pkid';                              options = @('default','key')                      }            
        @{ name = 'name';                              options = @('default')                      }        
        @{ name = 'description';                              options = @('default')                      }        
        @{ name = 'tkmodel';                              options = @('default')                      }
        @{ name = 'tkclass';                              options = @('default')                      }        
        @{ name = 'tkproduct';                              options = @('default')                      }        
        @{ name = 'fklocation';                              options = @('default')                      }        
        @{ name = 'fkenduser';                              options = @('default')                      }        
        @{ name = 'isactive';                              options = @('default')                      }        
    )
    DevicePool = @(
        @{ name = 'uuid';                              options = @('default','key')                      }        
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'autoSearchSpaceName';                              options = @('default')                      }
        @{ name = 'dateTimeSettingName_uuid';                              options = @('default')                      }
        @{ name = 'dateTimeSettingName_text';                              options = @('default')                      }
        @{ name = 'callManagerGroupName_uuid';                              options = @('default')                      }
        @{ name = 'callManagerGroupName_text';                              options = @('default')                      }
        @{ name = 'mediaResourceListName_uuid';                              options = @('default')                      }
        @{ name = 'mediaResourceListName_text';                              options = @('default')                      }
        @{ name = 'regionName_uuid';                              options = @('default')                      }
        @{ name = 'regionName_text';                              options = @('default')                      }
        @{ name = 'networkLocale';                              options = @('default')                      }
        @{ name = 'srstName_uuid';                              options = @('default')                      }
        @{ name = 'srstName_text';                              options = @('default')                      }
        @{ name = 'connectionMonitorDuration';                              options = @('default')                      }
        @{ name = 'automatedAlternateRoutingCssName';                              options = @('default')                      }
        @{ name = 'aarNeighborhoodName';                              options = @('default')                      }
        @{ name = 'locationName';                              options = @('default')                      }
        @{ name = 'mobilityCssName';                              options = @('default')                      }
        @{ name = 'physicalLocationName';                              options = @('default')                      }
        @{ name = 'deviceMobilityGroupName';                              options = @('default')                      }
        @{ name = 'revertPriority';                              options = @('default')                      }
        @{ name = 'singleButtonBarge';                              options = @('default')                      }
        @{ name = 'joinAcrossLines';                              options = @('default')                      }
        @{ name = 'cgpnTransformationCssName';                              options = @('default')                      }
        @{ name = 'cdpnTransformationCssName';                              options = @('default')                      }
        @{ name = 'localRouteGroupName';                              options = @('default')                      }
        @{ name = 'geoLocationName';                              options = @('default')                      }
        @{ name = 'geoLocationFilterName';                              options = @('default')                      }
        @{ name = 'callingPartyNationalPrefix';                              options = @('default')                      }
        @{ name = 'callingPartyInternationalPrefix';                              options = @('default')                      }
        @{ name = 'callingPartyUnknownPrefix';                              options = @('default')                      }
        @{ name = 'callingPartySubscriberPrefix';                              options = @('default')                      }
        @{ name = 'adjunctCallingSearchSpace';                              options = @('default')                      }
        @{ name = 'callingPartyNationalStripDigits';                              options = @('default')                      }
        @{ name = 'callingPartyInternationalStripDigits';                              options = @('default')                      }
        @{ name = 'callingPartyUnknownStripDigits';                              options = @('default')                      }
        @{ name = 'callingPartySubscriberStripDigits';                              options = @('default')                      }
        @{ name = 'callingPartyNationalTransformationCssName';                              options = @('default')                      }
        @{ name = 'callingPartyInternationalTransformationCssName';                              options = @('default')                      }
        @{ name = 'callingPartyUnknownTransformationCssName';                              options = @('default')                      }
        @{ name = 'callingPartySubscriberTransformationCssName';                              options = @('default')                      }
        @{ name = 'calledPartyNationalPrefix';                              options = @('default')                      }
        @{ name = 'calledPartyInternationalPrefix';                              options = @('default')                      }
        @{ name = 'calledPartyUnknownPrefix';                              options = @('default')                      }
        @{ name = 'calledPartySubscriberPrefix';                              options = @('default')                      }
        @{ name = 'calledPartyNationalStripDigits';                              options = @('default')                      }
        @{ name = 'calledPartyInternationalStripDigits';                              options = @('default')                      }
        @{ name = 'calledPartyUnknownStripDigits';                              options = @('default')                      }
        @{ name = 'calledPartySubscriberStripDigits';                              options = @('default')                      }
        @{ name = 'calledPartyNationalTransformationCssName';                              options = @('default')                      }
        @{ name = 'calledPartyInternationalTransformationCssName';                              options = @('default')                      }
        @{ name = 'calledPartyUnknownTransformationCssName';                              options = @('default')                      }
        @{ name = 'calledPartySubscriberTransformationCssName';                              options = @('default')                      }
        @{ name = 'imeEnrolledPatternGroupName';                              options = @('default')                      }
        @{ name = 'localRouteGroup';                              options = @('default')                      }
        @{ name = 'mraServiceDomain';                              options = @('default')                      }
    )
    EndUser = @(
        @{ name = 'pkid';                              options = @('default','key')                      }        
        @{ name = 'firstname';                              options = @('default')                      }
        @{ name = 'middlename';                              options = @('default')                      }
        @{ name = 'lastname';                              options = @('default')                      }
        @{ name = 'userid';                              options = @('default')                      }
        @{ name = 'status';                              options = @('default')                      }
        @{ name = 'uniqueidentifier';                              options = @('default')                      }
        @{ name = 'homephone';                              options = @('default')                      }
        @{ name = 'mobile';                              options = @('default')                      }
        @{ name = 'nickname';                              options = @('default')                      }
        @{ name = 'telephoneNumber';                              options = @('default')                      }
        @{ name = 'dnorpattern';                              options = @('default')                      }
        @{ name = 'routePartitionName';                              options = @('default')                      }
       
    )
    EndUserDevice = @(
        @{ name = 'userpkid';                              options = @('default')                      }            
        @{ name = 'userguid';                              options = @('default')                      }        
        @{ name = 'userid';                              options = @('default')                      }        
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'devicepkid';                              options = @('default')                      }        
        @{ name = 'deviceguid';                              options = @('default')                      }        
    )
    EndUserDeviceMap = @(
        @{ name = 'pkid';                              options = @('default','key')                      }            
        @{ name = 'fkenduser';                              options = @('default')                      }        
        @{ name = 'fkdevice';                              options = @('default')                      }        
        @{ name = 'defaultprofile';                              options = @('default')                      }
        @{ name = 'description';                              options = @('default')                      }        
        @{ name = 'tkuserassociation';                              options = @('default')                      }        
    )
    Location = @(
        @{ name = 'uuid';                              options = @('default','key')                      }        
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'withinAudioBandwidth';                              options = @('default')                      }
        @{ name = 'withinVideoBandwidth';                              options = @('default')                      }
        @{ name = 'withinImmersiveKbits';                              options = @('default')                      }
       
    )
    MediaResourceGroup = @(
        @{ name = 'uuid';                              options = @('default','key')                      }        
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'clause';                              options = @('default')                      }      
    )
    MohAudioSource = @(
        @{ name = 'uuid';                              options = @('default','key')                      }        
        @{ name = 'sourceId';                              options = @('default')                      }
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'sourceFile';                              options = @('default')                      }      
        @{ name = 'multicast';                              options = @('default')                      }      
        @{ name = 'mohFileStatus';                              options = @('default')                      }      
        @{ name = 'initialAnnouncement';                              options = @('default')                      }      
        @{ name = 'periodicAnnouncement';                              options = @('default')                      }      
        @{ name = 'periodicAnnouncementInterval';                              options = @('default')                      }      
        @{ name = 'localeAnnouncement';                              options = @('default')                      }      
        @{ name = 'initialAnnouncementPlayed';                              options = @('default')                      }      
    )
    Phone = @(
        @{ name = 'uuid';                              options = @('default','key')                      }        
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'description';                              options = @('default')                      }
        @{ name = 'product';                              options = @('default')                      }
        @{ name = 'model';                              options = @('default')                      }
        @{ name = 'class';                              options = @('default')                      }
        @{ name = 'protocol';                              options = @('default')                      }
        @{ name = 'protocolSide';                              options = @('default')                      }
        @{ name = 'callingSearchSpaceName';                              options = @('default')                      }
        @{ name = 'devicePoolName';                              options = @('default')                      }
        @{ name = 'commonDeviceConfigName';                              options = @('default')                      }
        @{ name = 'commonPhoneConfigName';                              options = @('default')                      }
        @{ name = 'networkLocation';                              options = @('default')                      }
        @{ name = 'locationName';                              options = @('default')                      }
        @{ name = 'mediaResourceListName';                              options = @('default')                      }
        @{ name = 'networkHoldMohAudioSourceId';                              options = @('default')                      }
        @{ name = 'userHoldMohAudioSourceId';                              options = @('default')                      }
        @{ name = 'automatedAlternateRoutingCssName';                              options = @('default')                      }
        @{ name = 'aarNeighborhoodName';                              options = @('default')                      }
        @{ name = 'loadInformation';                              options = @('default')                      }
        @{ name = 'traceFlag';                              options = @('default')                      }
        @{ name = 'mlppIndicationStatus';                              options = @('default')                      }
        @{ name = 'preemption';                              options = @('default')                      }
        @{ name = 'useTrustedRelayPoint';                              options = @('default')                      }
        @{ name = 'retryVideoCallAsAudio';                              options = @('default')                      }
        @{ name = 'securityProfileName';                              options = @('default')                      }
        @{ name = 'sipProfileName';                              options = @('default')                      }
        @{ name = 'cgpnTransformationCssName';                              options = @('default')                      }
        @{ name = 'useDevicePoolCgpnTransformCss';                              options = @('default')                      }
        @{ name = 'geoLocationName';                              options = @('default')                      }
        @{ name = 'geoLocationFilterName';                              options = @('default')                      }
        @{ name = 'sendGeoLocation';                              options = @('default')                      }
        @{ name = 'numberOfButtons';                              options = @('default')                      }
        @{ name = 'phoneTemplateName';                              options = @('default')                      }
        @{ name = 'primaryPhoneName';                              options = @('default')                      }
        @{ name = 'ringSettingIdleBlfAudibleAlert';                              options = @('default')                      }
        @{ name = 'ringSettingBusyBlfAudibleAlert';                              options = @('default')                      }
        @{ name = 'userLocale';                              options = @('default')                      }
        @{ name = 'networkLocale';                              options = @('default')                      }
        @{ name = 'idleTimeout';                              options = @('default')                      }
        @{ name = 'authenticationUrl';                              options = @('default')                      }
        @{ name = 'directoryUrl';                              options = @('default')                      }
        @{ name = 'idleUrl';                              options = @('default')                      }
        @{ name = 'informationUrl';                              options = @('default')                      }
        @{ name = 'messagesUrl';                              options = @('default')                      }
        @{ name = 'proxyServerUrl';                              options = @('default')                      }
        @{ name = 'servicesUrl';                              options = @('default')                      }
        @{ name = 'softkeyTemplateName';                              options = @('default')                      }
        @{ name = 'loginUserId';                              options = @('default')                      }
        @{ name = 'defaultProfileName';                              options = @('default')                      }
        @{ name = 'enableExtensionMobility';                              options = @('default')                      }
        @{ name = 'currentProfileName';                              options = @('default')                      }
        @{ name = 'loginTime';                              options = @('default')                      }
        @{ name = 'loginDuration';                              options = @('default')                      }
        @{ name = 'currentConfig';                              options = @('default')                      }
        @{ name = 'singleButtonBarge';                              options = @('default')                      }
        @{ name = 'joinAcrossLines';                              options = @('default')                      }
        @{ name = 'builtInBridgeStatus';                              options = @('default')                      }
        @{ name = 'callInfoPrivacyStatus';                              options = @('default')                      }
        @{ name = 'hlogStatus';                              options = @('default')                      }
        @{ name = 'ownerUserName_uuid';                              options = @('default')                      }
        @{ name = 'ownerUserName_text';                              options = @('default')                      }
        @{ name = 'ignorePresentationIndicators';                              options = @('default')                      }
        @{ name = 'packetCaptureMode';                              options = @('default')                      }
        @{ name = 'packetCaptureDuration';                              options = @('default')                      }
        @{ name = 'subscribeCallingSearchSpaceName';                              options = @('default')                      }
        @{ name = 'rerouteCallingSearchSpaceName';                              options = @('default')                      }
        @{ name = 'allowCtiControlFlag';                              options = @('default')                      }
        @{ name = 'presenceGroupName';                              options = @('default')                      }
        @{ name = 'unattendedPort';                              options = @('default')                      }
        @{ name = 'requireDtmfReception';                              options = @('default')                      }
        @{ name = 'rfc2833Disabled';                              options = @('default')                      }
        @{ name = 'certificateOperation';                              options = @('default')                      }
        @{ name = 'authenticationMode';                              options = @('default')                      }
        @{ name = 'keySize';                              options = @('default')                      }
        @{ name = 'keyOrder';                              options = @('default')                      }
        @{ name = 'ecKeySize';                              options = @('default')                      }
        @{ name = 'authenticationString';                              options = @('default')                      }
        @{ name = 'certificateStatus';                              options = @('default')                      }
        @{ name = 'upgradeFinishTime';                              options = @('default')                      }
        @{ name = 'deviceMobilityMode';                              options = @('default')                      }
        @{ name = 'roamingDevicePoolName';                              options = @('default')                      }
        @{ name = 'remoteDevice';                              options = @('default')                      }
        @{ name = 'dndOption';                              options = @('default')                      }
        @{ name = 'dndRingSetting';                              options = @('default')                      }
        @{ name = 'dndStatus';                              options = @('default')                      }
        @{ name = 'isActive';                              options = @('default')                      }
        @{ name = 'isDualMode';                              options = @('default')                      }
        @{ name = 'mobilityUserIdName';                              options = @('default')                      }
        @{ name = 'phoneSuite';                              options = @('default')                      }
        @{ name = 'phoneServiceDisplay';                              options = @('default')                      }
        @{ name = 'isProtected';                              options = @('default')                      }
        @{ name = 'mtpRequired';                              options = @('default')                      }
        @{ name = 'mtpPreferedCodec';                              options = @('default')                      }
        @{ name = 'dialRulesName';                              options = @('default')                      }
        @{ name = 'sshUserId';                              options = @('default')                      }
        @{ name = 'digestUser';                              options = @('default')                      }
        @{ name = 'outboundCallRollover';                              options = @('default')                      }
        @{ name = 'hotlineDevice';                              options = @('default')                      }
        @{ name = 'secureInformationUrl';                              options = @('default')                      }
        @{ name = 'secureDirectoryUrl';                              options = @('default')                      }
        @{ name = 'secureMessageUrl';                              options = @('default')                      }
        @{ name = 'secureServicesUrl';                              options = @('default')                      }
        @{ name = 'secureAuthenticationUrl';                              options = @('default')                      }
        @{ name = 'secureIdleUrl';                              options = @('default')                      }
        @{ name = 'alwaysUsePrimeLine';                              options = @('default')                      }
        @{ name = 'alwaysUsePrimeLineForVoiceMessage';                              options = @('default')                      }
        @{ name = 'featureControlPolicy';                              options = @('default')                      }
        @{ name = 'deviceTrustMode';                              options = @('default')                      }
        @{ name = 'earlyOfferSupportForVoiceCall';                              options = @('default')                      }
        @{ name = 'requireThirdPartyRegistration';                              options = @('default')                      }
        @{ name = 'blockIncomingCallsWhenRoaming';                              options = @('default')                      }
        @{ name = 'homeNetworkId';                              options = @('default')                      }
        @{ name = 'AllowPresentationSharingUsingBfcp';                              options = @('default')                      }
        @{ name = 'confidentialAccess';                              options = @('default')                      }
        @{ name = 'requireOffPremiseLocation';                              options = @('default')                      }
        @{ name = 'allowiXApplicableMedia';                              options = @('default')                      }
        @{ name = 'enableCallRoutingToRdWhenNoneIsActive';                              options = @('default')                      }
        @{ name = 'enableActivationID';                              options = @('default')                      }
        @{ name = 'mraServiceDomain';                              options = @('default')                      }
        @{ name = 'allowMraMode';                              options = @('default')                      }  
        
    )
    PhoneLine = @(
        @{ name = 'uuid';                              options = @('default','key')                      }        
        @{ name = 'index';                              options = @('default')                      }
        @{ name = 'label';                              options = @('default')                      }
        @{ name = 'display';                              options = @('default')                      }
        @{ name = 'dirn_uuid';                              options = @('default')                      }
        @{ name = 'dirn_pattern';                              options = @('default')                      }
        @{ name = 'dirn_routePartitionName';                              options = @('default')                      }
        @{ name = 'e164Mask';                              options = @('default')                      }
        @{ name = 'phone_uuid';                              options = @('default')                      }
        @{ name = 'userId';                              options = @('default')                      }
    )
    PhoneTemplate = @(
        @{ name = 'pkid';                              options = @('default','key')                      }        
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'numofbuttons';                              options = @('default')                      }
        @{ name = 'usermodifiable';                              options = @('default')                      }
        @{ name = 'tkmodel';                              options = @('default')                      }
        @{ name = 'tkdeviceprotocol';                              options = @('default')                      }
        @{ name = 'privatetemplate';                              options = @('default')                      }
        @{ name = 'versionstamp';                              options = @('default')                      }
        @{ name = 'resettoggle';                              options = @('default')                      }
        @{ name = 'tkreset';                              options = @('default')                      }
    )
    Product = @(
        @{ name = 'enum';                              options = @('default','key')                      }        
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'moniker';                              options = @('default')                      }
        @{ name = 'tkmodel';                              options = @('default')                      }
        @{ name = 'maxports';                              options = @('default')                      }
        @{ name = 'showindropdown';                              options = @('default')                      }
        @{ name = 'devicenameformat';                              options = @('default')                      }
        @{ name = 'isinstalleddefault';                              options = @('default')                      }
        @{ name = 'devicenamestring';                              options = @('default')                      }
    )
    SipProfile = @(
        @{ name = 'uuid';                              options = @('default','key')                      }            
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'description';                              options = @('default')                      }
        @{ name = 'defaultTelephonyEventPayloadType';                              options = @('default')                      }
        @{ name = 'redirectByApplication';                              options = @('default')                      }
        @{ name = 'ringing180';                              options = @('default')                      }
        @{ name = 'timerInvite';                              options = @('default')                      }
        @{ name = 'timerRegisterDelta';                              options = @('default')                      }
        @{ name = 'timerRegister';                              options = @('default')                      }
        @{ name = 'timerT1';                              options = @('default')                      }
        @{ name = 'timerT2';                              options = @('default')                      }
        @{ name = 'retryInvite';                              options = @('default')                      }
        @{ name = 'retryNotInvite';                              options = @('default')                      }
        @{ name = 'startMediaPort';                              options = @('default')                      }
        @{ name = 'stopMediaPort';                              options = @('default')                      }
        @{ name = 'callpickupListUri';                              options = @('default')                      }
        @{ name = 'callpickupGroupUri';                              options = @('default')                      }
        @{ name = 'meetmeServiceUrl';                              options = @('default')                      }
        @{ name = 'userInfo';                              options = @('default')                      }
        @{ name = 'dtmfDbLevel';                              options = @('default')                      }
        @{ name = 'callHoldRingback';                              options = @('default')                      }
        @{ name = 'anonymousCallBlock';                              options = @('default')                      }
        @{ name = 'callerIdBlock';                              options = @('default')                      }
        @{ name = 'dndControl';                              options = @('default')                      }
        @{ name = 'telnetLevel';                              options = @('default')                      }
        @{ name = 'timerKeepAlive';                              options = @('default')                      }
        @{ name = 'timerSubscribe';                              options = @('default')                      }
        @{ name = 'timerSubscribeDelta';                              options = @('default')                      }
        @{ name = 'maxRedirects';                              options = @('default')                      }
        @{ name = 'timerOffHookToFirstDigit';                              options = @('default')                      }
        @{ name = 'callForwardUri';                              options = @('default')                      }
        @{ name = 'abbreviatedDialUri';                              options = @('default')                      }
        @{ name = 'confJointEnable';                              options = @('default')                      }
        @{ name = 'rfc2543Hold';                              options = @('default')                      }
        @{ name = 'semiAttendedTransfer';                              options = @('default')                      }
        @{ name = 'enableVad';                              options = @('default')                      }
        @{ name = 'stutterMsgWaiting';                              options = @('default')                      }
        @{ name = 'callStats';                              options = @('default')                      }
        @{ name = 't38Invite';                              options = @('default')                      }
        @{ name = 'faxInvite';                              options = @('default')                      }
        @{ name = 'rerouteIncomingRequest';                              options = @('default')                      }
        @{ name = 'resourcePriorityNamespaceListName';                              options = @('default')                      }
        @{ name = 'enableAnatForEarlyOfferCalls';                              options = @('default')                      }
        @{ name = 'rsvpOverSip';                              options = @('default')                      }
        @{ name = 'fallbackToLocalRsvp';                              options = @('default')                      }
        @{ name = 'sipRe11XxEnabled';                              options = @('default')                      }
        @{ name = 'gClear';                              options = @('default')                      }
        @{ name = 'sendRecvSDPInMidCallInvite';                              options = @('default')                      }
        @{ name = 'enableOutboundOptionsPing';                              options = @('default')                      }
        @{ name = 'optionsPingIntervalWhenStatusOK';                              options = @('default')                      }
        @{ name = 'optionsPingIntervalWhenStatusNotOK';                              options = @('default')                      }
        @{ name = 'deliverConferenceBridgeIdentifier';                              options = @('default')                      }
        @{ name = 'sipOptionsRetryCount';                              options = @('default')                      }
        @{ name = 'sipOptionsRetryTimer';                              options = @('default')                      }
        @{ name = 'sipBandwidthModifier';                              options = @('default')                      }
        @{ name = 'enableUriOutdialSupport';                              options = @('default')                      }
        @{ name = 'userAgentServerHeaderInfo';                              options = @('default')                      }
        @{ name = 'allowPresentationSharingUsingBfcp';                              options = @('default')                      }
        @{ name = 'scriptParameters';                              options = @('default')                      }
        @{ name = 'isScriptTraceEnabled';                              options = @('default')                      }
        @{ name = 'sipNormalizationScript';                              options = @('default')                      }
        @{ name = 'allowiXApplicationMedia';                              options = @('default')                      }
        @{ name = 'dialStringInterpretation';                              options = @('default')                      }
        @{ name = 'acceptAudioCodecPreferences';                              options = @('default')                      }
        @{ name = 'mlppUserAuthorization';                              options = @('default')                      }
        @{ name = 'isAssuredSipServiceEnabled';                              options = @('default')                      }
        @{ name = 'resourcePriorityNamespace';                              options = @('default')                      }
        @{ name = 'useCallerIdCallerNameinUriOutgoingRequest';                              options = @('default')                      }
        @{ name = 'callingLineIdentification';                              options = @('default')                      }
        @{ name = 'rejectAnonymousIncomingCall';                              options = @('default')                      }
        @{ name = 'callpickupUri';                              options = @('default')                      }
        @{ name = 'rejectAnonymousOutgoingCall';                              options = @('default')                      }
        @{ name = 'videoCallTrafficClass';                              options = @('default')                      }
        @{ name = 'sdpTransparency';                              options = @('default')                      }
        @{ name = 'allowMultipleCodecs';                              options = @('default')                      }
        @{ name = 'sipSessionRefreshMethod';                              options = @('default')                      }
        @{ name = 'earlyOfferSuppVoiceCall';                              options = @('default')                      }
        @{ name = 'cucmVersionInSipHeader';                              options = @('default')                      }
        @{ name = 'confidentialAccessLevelHeaders';                              options = @('default')                      }
        @{ name = 'destRouteString';                              options = @('default')                      }
        @{ name = 'inactiveSDPRequired';                              options = @('default')                      }
        @{ name = 'allowRRAndRSBandwidthModifier';                              options = @('default')                      }
    )
    UniversalDeviceTemplate = @(
        @{ name = 'uuid';                              options = @('default','key')                      }                
        @{ name = 'name';                              options = @('default')                      }
        @{ name = 'deviceDescription';                              options = @('default')                      }
        @{ name = 'devicePool';                              options = @('default')                      }
        @{ name = 'deviceSecurityProfile';                              options = @('default')                      }
        @{ name = 'sipProfile';                              options = @('default')                      }
        @{ name = 'phoneButtonTemplate';                              options = @('default')                      }
        @{ name = 'sipDialRules';                              options = @('default')                      }
        @{ name = 'callingSearchSpace';                              options = @('default')                      }
        @{ name = 'callingPartyTransformationCSSForInboundCalls';                              options = @('default')                      }
        @{ name = 'callingPartyTransformationCSSForOutboundCalls';                              options = @('default')                      }
        @{ name = 'reroutingCallingSearchSpace';                              options = @('default')                      }
        @{ name = 'subscribeCallingSearchSpaceName';                              options = @('default')                      }
        @{ name = 'useDevicePoolCallingPartyTransformationCSSforInboundCalls';                              options = @('default')                      }
        @{ name = 'useDevicePoolCallingPartyTransformationCSSforOutboundCalls';                              options = @('default')                      }
        @{ name = 'commonPhoneProfile';                              options = @('default')                      }
        @{ name = 'commonDeviceConfiguration';                              options = @('default')                      }
        @{ name = 'softkeyTemplate';                              options = @('default')                      }
        @{ name = 'featureControlPolicy';                              options = @('default')                      }
        @{ name = 'phonePersonalization';                              options = @('default')                      }
        @{ name = 'mtpPreferredOriginatingCodec';                              options = @('default')                      }
        @{ name = 'outboundCallRollover';                              options = @('default')                      }
        @{ name = 'mediaTerminationPointRequired';                              options = @('default')                      }
        @{ name = 'unattendedPort';                              options = @('default')                      }
        @{ name = 'requiredDtmfReception';                              options = @('default')                      }
        @{ name = 'rfc2833Disabled';                              options = @('default')                      }
        @{ name = 'useTrustedRelayPoint';                              options = @('default')                      }
        @{ name = 'protectedDevice';                              options = @('default')                      }
        @{ name = 'certificateOperation';                              options = @('default')                      }
        @{ name = 'authenticationMode';                              options = @('default')                      }
        @{ name = 'authenticationString';                              options = @('default')                      }
        @{ name = 'keySize';                              options = @('default')                      }
        @{ name = 'keyOrder';                              options = @('default')                      }
        @{ name = 'ecKeySize';                              options = @('default')                      }
        @{ name = 'servicesProvisioning';                              options = @('default')                      }
        @{ name = 'packetCaptureMode';                              options = @('default')                      }
        @{ name = 'packetCaptureDuration';                              options = @('default')                      }
        @{ name = 'secureShellUser';                              options = @('default')                      }
        @{ name = 'secureShellPassword';                              options = @('default')                      }
        @{ name = 'userLocale';                              options = @('default')                      }
        @{ name = 'networkLocale';                              options = @('default')                      }
        @{ name = 'mlppDomain';                              options = @('default')                      }
        @{ name = 'mlppIndication';                              options = @('default')                      }
        @{ name = 'mlppPreemption';                              options = @('default')                      }
        @{ name = 'doNotDisturb';                              options = @('default')                      }
        @{ name = 'dndOption';                              options = @('default')                      }
        @{ name = 'dndIncomingCallAlert';                              options = @('default')                      }
        @{ name = 'aarGroup';                              options = @('default')                      }
        @{ name = 'aarCallingSearchSpace';                              options = @('default')                      }
        @{ name = 'blfPresenceGroup';                              options = @('default')                      }
        @{ name = 'blfAudibleAlertSettingPhoneBusy';                              options = @('default')                      }
        @{ name = 'blfAudibleAlertSettingPhoneIdle';                              options = @('default')                      }
        @{ name = 'userHoldMohAudioSource';                              options = @('default')                      }
        @{ name = 'networkHoldMohAudioSource';                              options = @('default')                      }
        @{ name = 'location';                              options = @('default')                      }
        @{ name = 'geoLocation';                              options = @('default')                      }
        @{ name = 'deviceMobilityMode';                              options = @('default')                      }
        @{ name = 'mediaResourceGroupList';                              options = @('default')                      }
        @{ name = 'remoteDevice';                              options = @('default')                      }
        @{ name = 'hotlineDevice';                              options = @('default')                      }
        @{ name = 'retryVideoCallAsAudio';                              options = @('default')                      }
        @{ name = 'requireOffPremiseLocation';                              options = @('default')                      }
        @{ name = 'ownerUserId';                              options = @('default')                      }
        @{ name = 'mobilityUserId';                              options = @('default')                      }
        @{ name = 'joinAcrossLines';                              options = @('default')                      }
        @{ name = 'alwaysUsePrimeLine';                              options = @('default')                      }
        @{ name = 'alwaysUsePrimeLineForVoiceMessage';                              options = @('default')                      }
        @{ name = 'singleButtonBarge';                              options = @('default')                      }
        @{ name = 'builtInBridge';                              options = @('default')                      }
        @{ name = 'allowControlOfDeviceFromCti';                              options = @('default')                      }
        @{ name = 'ignorePresentationIndicators';                              options = @('default')                      }
        @{ name = 'enableExtensionMobility';                              options = @('default')                      }
        @{ name = 'privacy';                              options = @('default')                      }
        @{ name = 'loggedIntoHuntGroup';                              options = @('default')                      }
        @{ name = 'proxyServer';                              options = @('default')                      }
        @{ name = 'servicesUrl';                              options = @('default')                      }
        @{ name = 'idle';                              options = @('default')                      }
        @{ name = 'idleTimer';                              options = @('default')                      }
        @{ name = 'secureDirUrl';                              options = @('default')                      }
        @{ name = 'messages';                              options = @('default')                      }
        @{ name = 'secureIdleUrl';                              options = @('default')                      }
        @{ name = 'authenticationServer';                              options = @('default')                      }
        @{ name = 'directory';                              options = @('default')                      }
        @{ name = 'secureServicesUrl';                              options = @('default')                      }
        @{ name = 'information';                              options = @('default')                      }
        @{ name = 'secureMessagesUrl';                              options = @('default')                      }
        @{ name = 'secureInformationUrl';                              options = @('default')                      }
        @{ name = 'secureAuthenticationUrl';                              options = @('default')                      }
        @{ name = 'confidentialAccess';                              options = @('default')                      }
    )
}

function Idm-ApplicationUsersRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "ApplicationUser"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLQuery>
                      <sql>SELECT 
                      pkid,name,isstandard,userrank
                  FROM 
                      applicationuser</sql>
                   </ns:executeSQLQuery>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLQuery" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.executeSQLQueryResponse.return.row )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-ApplicationUserDeviceMapsRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "ApplicationUserDeviceMap"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLQuery>
                      <sql>SELECT pkid,description,fkdevice,fkapplicationuser,tkuserassociation FROM applicationuserdevicemap</sql>
                   </ns:executeSQLQuery>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLQuery" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.executeSQLQueryResponse.return.row )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-LinesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )
    $Class = "Line"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                    <ns:listLine>
                        <searchCriteria>
                            <pattern>%</pattern>
                        </searchCriteria>
                        <returnedTags>
                            <pattern>?</pattern>
                            <description>?</description>
                            <usage>?</usage>
                            <aarVoiceMailEnabled>?</aarVoiceMailEnabled>
                            <alertingName>?</alertingName>
                            <asciiAlertingName>?</asciiAlertingName>
                        </returnedTags>
                    </ns:listLine>
                </soapenv:Body>
                </soapenv:Envelope>' -f $system_params.version

                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listLine" -SoapBody $xmlRequest

                $response.Envelope.Body.listLineResponse.return.line | Select-Object $properties
            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-LinesUpdate {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'update'
            parameters = @(
                @{ name = 'uuid';       allowance = 'mandatory'   }    
                @{ name = 'description';       allowance = 'mandatory'   } 
                @{ name = 'alertingName';       allowance = 'mandatory'   } 
                @{ name = 'asciiAlertingName';       allowance = 'mandatory'   }
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            LogIO info "LinesUpdate" -In -UUID $function_params.uuid -description $function_params.description -alertingName $function_params.alertingName -asciiAlertingName $function_params.asciiAlertingName
            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
            <soapenv:Header/>
            <soapenv:Body>
                <ns:updateLine sequence="?">
                    <uuid>{1}</uuid>
                    <description>{2}</description>
                    <alertingName>{3}</alertingName>
                    <asciiAlertingName>{4}</asciiAlertingName>
                </ns:updateLine>
            </soapenv:Body>
            </soapenv:Envelope>' -f $system_params.version, $function_params.uuid, $function_params.description, $function_params.alertingName, $function_params.asciiAlertingName
            Log info "Log params"   
            Log info ($SystemParams)
            Log info "Log params done"   
            $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "updateLine" -SoapBody $xmlRequest
  
            foreach($item in $response.Envelope.Body.updateLineResponse.return.row )
            {
                ($item | ConvertTo-FlatObject) | Select-Object $properties                 
            }
            $rv = $true;
            LogIO info "LinesUpdate" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-CallingSearchSpacesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "CallingSearchSpace"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:listCss>
                      <searchCriteria>
                         <name>%</name>
                      </searchCriteria>
                      <returnedTags uuid="?">
                         <description>?</description>
                         <clause>?</clause>
                         <dialPlanWizardGenId>?</dialPlanWizardGenId>
                         <partitionUsage>?</partitionUsage>
                         <name>?</name>
                      </returnedTags>
                   </ns:listCss>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version

                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listCss" -SoapBody $xmlRequest

                $response.Envelope.Body.listCssResponse.return.css | Select-Object $properties
            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-CommonPhoneConfigRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )
    $Class = "CommonPhoneConfig"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:listCommonPhoneConfig>
                      <searchCriteria>
                         <name>%</name>
                      </searchCriteria>
                      <returnedTags>
                         <name/>
                         <description/>
                         <dndOption/>
                         <dndAlertingType/>
                         <backgroundImage/>
                         <phonePersonalization/>
                         <phoneServiceDisplay/>
                         <sshUserId/>
                         <alwaysUsePrimeLine/>
                         <alwaysUsePrimeLineForVoiceMessage/>
                         <vpnGroupName/>
                         <vpnProfileName/>
                         <featureControlPolicy/>
                      </returnedTags>
                   </ns:listCommonPhoneConfig>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listCommonPhoneConfig" -SoapBody $xmlRequest

                $response.Envelope.Body.listCommonPhoneConfigResponse.return.commonPhoneConfig | Select-Object $properties
            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-DevicesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "Device"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLQuery>
                      <sql>select pkid,name,description,tkmodel,tkclass,tkproduct,fklocation,fkenduser,isactive from device</sql>
                   </ns:executeSQLQuery>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLQuery" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.executeSQLQueryResponse.return.row )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-DevicePoolsRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "DevicePool"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:listDevicePool>
                      <searchCriteria>
                            <name>%</name>
                       </searchCriteria>
                       <returnedTags>
                         <name/>
                         <autoSearchSpaceName/>
                         <dateTimeSettingName/>
                         <callManagerGroupName/>
                         <mediaResourceListName/>
                         <regionName/>
                         <networkLocale/>
                         <srstName/>
                         <connectionMonitorDuration/>
                         <automatedAlternateRoutingCssName/>
                         <aarNeighborhoodName/>
                         <locationName/>
                         <mobilityCssName/>
                         <physicalLocationName/>
                         <deviceMobilityGroupName/>
                         <revertPriority/>
                         <singleButtonBarge/>
                         <joinAcrossLines/>
                         <cgpnTransformationCssName/>
                         <cdpnTransformationCssName/>
                         <localRouteGroupName/>
                         <geoLocationName/>
                         <geoLocationFilterName/>
                         <callingPartyNationalPrefix/>
                         <callingPartyInternationalPrefix/>
                         <callingPartyUnknownPrefix/>
                         <callingPartySubscriberPrefix/>
                         <adjunctCallingSearchSpace/>
                         <callingPartyNationalStripDigits/>
                         <callingPartyInternationalStripDigits/>
                         <callingPartyUnknownStripDigits/>
                         <callingPartySubscriberStripDigits/>
                         <callingPartyNationalTransformationCssName/>
                         <callingPartyInternationalTransformationCssName/>
                         <callingPartyUnknownTransformationCssName/>
                         <callingPartySubscriberTransformationCssName/>
                         <calledPartyNationalPrefix/>
                         <calledPartyInternationalPrefix/>
                         <calledPartyUnknownPrefix/>
                         <calledPartySubscriberPrefix/>
                         <calledPartyNationalStripDigits/>
                         <calledPartyInternationalStripDigits/>
                         <calledPartyUnknownStripDigits/>
                         <calledPartySubscriberStripDigits/>
                         <calledPartyNationalTransformationCssName/>
                         <calledPartyInternationalTransformationCssName/>
                         <calledPartyUnknownTransformationCssName/>
                         <calledPartySubscriberTransformationCssName/>
                         <imeEnrolledPatternGroupName/>
                         <localRouteGroup>
                            <name/>
                            <value/>
                         </localRouteGroup>
                      </returnedTags>
                   </ns:listDevicePool>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listDevicePool" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.listDevicePoolResponse.return.devicePool )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-EndUsersRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "EndUser"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLQuery>
                      <sql>SELECT 
                      e.pkid, 
                      e.firstname, 
                      e.middlename, 
                      e.lastname, 
                      e.userid, 
                      e.status, 
                      e.uniqueidentifier, 
                      e.homephone, 
                      e.mobile,
                      e.nickname, 
                      e.telephoneNumber, 
                      n.dnorpattern
                  FROM 
                      enduser AS e
                  LEFT JOIN 
                      endusernumplanmap AS x ON e.pkid = x.fkenduser
                  LEFT JOIN 
                      numplan AS n ON x.fknumplan = n.pkid</sql>
                   </ns:executeSQLQuery>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLQuery" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.executeSQLQueryResponse.return.row )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-EndUsersCreate {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'create'
            parameters = @(
                @{ name = 'firstname';       allowance = 'mandatory'   }    
                @{ name = 'lastname';       allowance = 'mandatory'   } 
                @{ name = 'userid';       allowance = 'mandatory'   } 
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            LogIO info "EndUsersCreate" -In -UUID $function_params.uuid -Name $function_params.Name
            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
            <soapenv:Header/>
            <soapenv:Body>
                <ns:addUser sequence="?">
                    <user>
                        <firstName>{1}</firstName>
                        <lastName>{2}</lastName>
                        <userid>{3}/userid>
                    </user>
                </ns:addUser>
            </soapenv:Body>
            </soapenv:Envelope>' -f $system_params.version, $function_params.firstname, $function_params.lastname, $function_params.userid
            
            $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "addUser" -SoapBody $xmlRequest
  
            foreach($item in $response.Envelope.Body.addUserResponse.return.row )
            {
                ($item | ConvertTo-FlatObject) | Select-Object $properties                 
            }
            $rv = $true;
            LogIO info "EndUsersCreate" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-EndUsersUpdate {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'update'
            parameters = @(
                @{ name = 'userid';       allowance = 'mandatory'   } 
                @{ name = 'firstname';       allowance = 'optional'   }    
                @{ name = 'lastname';       allowance = 'optional'   } 
                @{ name = 'dnorpattern';       allowance = 'optional'   } 
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            LogIO info "EndUsersUpdate" -In @function_params
            $user = ''
            foreach($item in $function_params.GetEnumerator()) {
                if($item.Name -eq 'routePartitionName') { continue }
                if($item.Name -eq 'dnorpattern') {
                    $user += "<primaryExtension>
                    <pattern>$($item.Value)</pattern>
                    <routePartitionName>$function_params.routePartitionName</routePartitionName>
                 </primaryExtension>" 
                } else {
                    $user += "<$($item.Name)>$($item.Value)</$($item.Name)>"
                }
            }
            
            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
            <soapenv:Header/>
            <soapenv:Body>
                <ns:addUser sequence="?">
                    <user>
                        {1}
                    </user>
                </ns:addUser>
            </soapenv:Body>
            </soapenv:Envelope>' -f $system_params.version, $user
            
            #$response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "addUser" -SoapBody $xmlRequest
  
            foreach($item in $response.Envelope.Body.updateUserResponse.return.row )
            {
                ($item | ConvertTo-FlatObject) | Select-Object $properties                 
            }
            $rv = $true;
            LogIO info "EndUsersCreate" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-EndUserDevicesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "EndUserDevice"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLQuery>
                      <sql>select enduser.pkid userpkid, enduser.userid, device.name, device.pkid devicepkid from enduser,device,enduserdevicemap
                      where enduserdevicemap.fkenduser=enduser.pkid and enduserdevicemap.fkdevice=device.pkid</sql>
                   </ns:executeSQLQuery>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLQuery" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.executeSQLQueryResponse.return.row )
                {
                    [PSCustomObject]@{
                        userpkid = $item.userpkid
                        userguid = "{$($item.userpkid)}"
                        userid = $item.userid
                        name = $item.name
                        devicepkid = $item.devicepkid
                        deviceguid = "{$($item.devicepkid)}"
                    }
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-EndUserDeviceMapsRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "EndUserDeviceMap"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLQuery>
                      <sql>SELECT pkid,fkenduser,fkdevice,defaultprofile,description,tkuserassociation FROM enduserdevicemap</sql>
                   </ns:executeSQLQuery>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLQuery" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.executeSQLQueryResponse.return.row )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-EndUserDeviceMapsCreate {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'create'
            parameters = @(
                @{ name = 'fkenduser';       allowance = 'mandatory'   }    
                @{ name = 'fkdevice';       allowance = 'mandatory'   }    
                @{ name = 'tkuserassociation';       allowance = 'mandatory'   }
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            LogIO info "EndUserDeviceMapsCreate" -In -fkenduser $function_params.fkenduser -fkdevice $function_params.fkdevice -tkuserassociation $function_params.tkuserassociation
            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLUpdate>
                      <sql>INSERT INTO enduserdevicemap (pkid,fkenduser,fkdevice,tkuserassociation) VALUES (newid(),"{1}","{2}",{3})</sql>
                   </ns:executeSQLUpdate>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version, $function_params.fkenduser, $function_params.fkdevice, $function_params.tkuserassociation
            
            $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLUpdate" -SoapBody $xmlRequest
  
            foreach($item in $response.Envelope.Body.addUserResponse.return.row )
            {
                ($item | ConvertTo-FlatObject) | Select-Object $properties                 
            }
            $rv = $true;
            LogIO info "EndUserDeviceMapsCreate" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-EndUserDeviceMapsDelete {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'delete'
            parameters = @(
                @{ name = 'pkid';       allowance = 'mandatory'   }    
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            #Only used for table removal, not target system request is made
            LogIO info "EndUserDeviceMapsDelete" -In -pkid $function_params.pkid
            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLUpdate>
                      <sql>DELETE FROM enduserdevicemap WHERE pkid = "{1}" LIMIT 1</sql>
                   </ns:executeSQLUpdate>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version, $function_params.pkid
            
            $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLUpdate" -SoapBody $xmlRequest
  
            $rv = $true;
            LogIO info "EndUserDeviceMapsDelete" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-LocationsRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "Location"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:listLocation>
                      <searchCriteria>
                         <name>%</name>
                      </searchCriteria>
                      <returnedTags>
                         <name/>
                         <id/>
                         <withinAudioBandwidth/>
                         <withinVideoBandwidth/>
                         <withinImmersiveKbits/>
                      </returnedTags>
                   </ns:listLocation>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listLocation" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.listLocationResponse.return.location )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-MediaResourceGroupsRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "MediaResourceGroup"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:listMediaResourceGroup>
                      <searchCriteria>
                         <name>%</name>
                      </searchCriteria>
                      <returnedTags>
                         <name/>
                         <description/>
                         <multicast/>
                      </returnedTags>
                   </ns:listMediaResourceGroup>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listMediaResourceGroup" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.listMediaResourceGroupResponse.return.mediaResourceGroup )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-MohAudioSourcesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "MohAudioSource"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:listMohAudioSource>
                      <searchCriteria>
                         <name>%</name>
                      </searchCriteria>
                      <returnedTags>
                         <sourceId/>
                         <name/>
                         <sourceFile/>
                         <multicast/>
                         <mohFileStatus/>
                         <initialAnnouncement/>
                         <periodicAnnouncement/>
                         <periodicAnnouncementInterval/>
                         <localeAnnouncement/>
                         <initialAnnouncementPlayed/>
                      </returnedTags>
                   </ns:listMohAudioSource>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listMohAudioSource" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.listMohAudioSourceResponse.return.mohAudioSource )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-PhonesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "Phone"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:listPhone>
                      <searchCriteria>
                            <name>%</name>
                       </searchCriteria>
                       <returnedTags>
                         <name/>
                         <description/>
                         <product/>
                         <model/>
                         <class/>
                         <ownerUserName uuid="?">?</ownerUserName>
                      </returnedTags>
                   </ns:listPhone>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listPhone" -SoapBody $xmlRequest
                
                foreach($item in $response.Envelope.Body.listPhoneResponse.return.phone )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties            
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-PhonesCreate {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'create'
            parameters = @(
                @{ name = 'name';       allowance = 'mandatory'   }    
                @{ name = 'description';       allowance = 'mandatory'   } 
                @{ name = 'product';       allowance = 'mandatory'   } 
                @{ name = 'ownerUsername_text';       allowance = 'mandatory'   } 
                @{ name = 'class';       allowance = 'mandatory'   } 
                @{ name = 'protocol';       allowance = 'mandatory'   } 
                @{ name = 'protocolSide';       allowance = 'mandatory'   } 
                @{ name = 'useTrustedRelayPoint';       allowance = 'mandatory'   } 
                @{ name = 'builtInBridgeStatus';       allowance = 'mandatory'   } 
                @{ name = 'packetCaptureMode';       allowance = 'mandatory'   } 
                @{ name = 'certificateOperation';       allowance = 'mandatory'   } 
                @{ name = 'deviceMobilityMode';       allowance = 'mandatory'   } 
                @{ name = 'networkLocation';       allowance = 'mandatory'   } 
                @{ name = 'networkLocale';       allowance = 'mandatory'   } 
                @{ name = 'enableExtensionMobility';       allowance = 'mandatory'   } 
                @{ name = 'primaryPhoneName';       allowance = 'mandatory'   } 
                @{ name = 'networkHoldMohAudioSourceId';       allowance = 'mandatory'   } 
                @{ name = 'userHoldMohAudioSourceId';       allowance = 'mandatory'   } 
                @{ name = 'devicePoolName';       allowance = 'mandatory'   } 
                @{ name = 'phoneTemplateName';       allowance = 'mandatory'   } 
                @{ name = 'callingSearchSpaceName';       allowance = 'mandatory'   } 
                @{ name = 'locationName';       allowance = 'mandatory'   } 
                @{ name = 'mediaResourceListName';       allowance = 'mandatory'   } 
                @{ name = 'sipProfileName';       allowance = 'mandatory'   } 
                @{ name = 'directoryNumber';       allowance = 'mandatory'   } 
                @{ name = 'routePartitionName';       allowance = 'mandatory'   } 
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            LogIO info "PhonesCreate" -In -UUID $function_params.uuid -Name $function_params.Name
            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
            <soapenv:Header/>
            <soapenv:Body>
                <ns:addPhone>
                    <phone>
                        <name>{1}</name>
                        <description>{2}</description>
                        <product>{3}</product>
                        <ownerUserName>{4}</ownerUserName>

                        <class>{5}</class>
                        <protocol>{6}</protocol>
                        <protocolSide>{7}</protocolSide>
                        <useTrustedRelayPoint>{8}</useTrustedRelayPoint>
                        <builtInBridgeStatus>{9}</builtInBridgeStatus>
                        <packetCaptureMode>{10}</packetCaptureMode>
                        <certificateOperation>{11}</certificateOperation>
                        <deviceMobilityMode>{12}</deviceMobilityMode>
                        <networkLocation>{13}</networkLocation>
                        <networkLocale>{14}</networkLocale>
                        <enableExtensionMobility>{15}</enableExtensionMobility>

                        <primaryPhoneName>{16}</primaryPhoneName>

                        <networkHoldMohAudioSourceId>{17}</networkHoldMohAudioSourceId>
                        <userHoldMohAudioSourceId>{18}</userHoldMohAudioSourceId>

                        <devicePoolName uuid="{19}" />
                        <phoneTemplateName uuid="{20}" />
                        <callingSearchSpaceName uuid="{21}" />
                        <locationName uuid="{22}" />
                        <mediaResourceListName uuid="{23}" />
                        <sipProfileName uuid="{24}" />

                        <lines>
                        <lineIdentifier>
                        <directoryNumber>{25}</directoryNumber>
                        <routePartitionName>{26}</routePartitionName>
                        </lineIdentifier>
                        </lines>

                    </phone>
                </ns:addPhone>
            </soapenv:Body>
            </soapenv:Envelope>' -f $system_params.version, $function_params.name, $function_params.description, $function_params.product, $function_params.ownerUserName_text, $function_params.class, $function_params.protocol,$function_params.protocolSide, $function_params.useTrustedRelayPoint,
            $function_params.builtInBridgeStatus,$function_params.packetCaptureMode, $function_params.certificateOperation,$function_params.deviceMobilityMode,$function_params.networkLocation,$function_params.networkLocale,$function_params.enableExtensionMobility,$function_params.primaryPhoneName,
            $function_params.devicePoolName,$function_params.phoneTemplateName, $function_params.callingSearchSpaceName,$function_params.locationName, $function_params.mediaResourceListName, $function_params.sipProfileName,$function_params.directoryNumber,$function_params.routePartitionName
            
            $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "addPhone" -SoapBody $xmlRequest
  
            foreach($item in $response.Envelope.Body.addPhoneResponse.return.row )
            {
                ($item | ConvertTo-FlatObject) | Select-Object $properties                 
            }
            $rv = $true;
            LogIO info "PhonesCreate" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-PhonesUpdate {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'update'
            parameters = @(
                @{ name = 'uuid';       allowance = 'mandatory'   }    
                @{ name = 'ownerUserName';       allowance = 'mandatory'   } 
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            LogIO info "PhonesUpdate" -In -UUID $function_params.uuid -Index $function_params.index
            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
            <soapenv:Header/>
            <soapenv:Body>
                <ns:updatePhone sequence="?">
                    <uuid>{1}</uuid>
                    <ownerUserName>{2}</ownerUserName>
                </ns:updatePhone>
            </soapenv:Body>
            </soapenv:Envelope>' -f $system_params.version, $function_params.uuid, $function_params.ownerUserName
            
            $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "updatePhone" -SoapBody $xmlRequest
  
            foreach($item in $response.Envelope.Body.updateLineResponse.return.row )
            {
                ($item | ConvertTo-FlatObject) | Select-Object $properties                 
            }
            $rv = $true;
            LogIO info "PhonesUpdate" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-PhonesDelete {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'delete'
            parameters = @(
                @{ name = 'uuid';       allowance = 'mandatory'   }    
                @{ name = 'name';       allowance = 'mandatory'   } 
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            LogIO info "removePhone" -In -UUID $function_params.uuid -Name $function_params.Name
            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
            <soapenv:Header/>
            <soapenv:Body>
                <ns:removePhone>
                    <name>{1}</name>
                </ns:removePhone>
            </soapenv:Body>
         </soapenv:Envelope>' -f $system_params.version, $function_params.name
            
            $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "removePhone" -SoapBody $xmlRequest
  
            foreach($item in $response.Envelope.Body.removePhoneResponse.return.row )
            {
                ($item | ConvertTo-FlatObject) | Select-Object $properties                 
            }
            $rv = $true;
            LogIO info "removePhone" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-PhoneLinesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "PhoneLine"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                Log info "Gathering phones for line retrieval"
                # Get Phone UUID's
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                <ns:listPhone>
                    <searchCriteria>
                        <name>%</name>
                    </searchCriteria>
                    <returnedTags>
                    </returnedTags>
                </ns:listPhone>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listPhone" -SoapBody $xmlRequest
                
                $phoneList = [System.Collections.ArrayList]@();

                foreach($item in $response.Envelope.Body.listPhoneResponse.return.phone )
                {
                    $phone = ($item | ConvertTo-FlatObject) | Select-Object uuid
                    [void]$phoneList.Add($phone)
                }

                # Get Phone Lines for each phone
                $_i = 0
                $now = Get-Date
                foreach($phone in $phoneList)
                {
                    try {
                    if(($_i++ % 100) -eq 0)
                    {
                        Log info ('Retrieving Phone Lines: ({0}/{1}) {2:n1} s...' -f $_i,$phoneList.count,((Get-Date) - $now).TotalSeconds)
                    }
                    
                    $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                        <soapenv:Header/>
                        <soapenv:Body>
                        <ns:getPhone>
                            <uuid>{1}</uuid>
                            <returnedTags>
                            <name>?</name>
                            <description>?</description>
                            <model>?</model>
                            <class>?</class>
                            <lines>
                                <!--Zero or more repetitions:-->
                                <line ctiid="?" uuid="?">
                                    <index>?</index>
                                    <label>?</label>
                                    <display>?</display>
                                    <dirn uuid="?">
                                        <pattern>?</pattern>
                                        <routePartitionName uuid="?">?</routePartitionName>
                                    </dirn>
                                    <e164Mask>?</e164Mask>
                                </line>
                            </lines>
                            <ownerUserName uuid="?">?</ownerUserName>
                            </returnedTags>
                        </ns:getPhone>
                        </soapenv:Body>
                    </soapenv:Envelope>' -f $system_params.version, $phone.uuid
                    
                    $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "getPhone" -SoapBody $xmlRequest
                    
                    #$item = $response.Envelope.Body.getPhoneResponse.return.phone.lines.line
                    $lines = $response.Envelope.Body.getPhoneResponse.return.phone.lines.line

                    foreach($item in $lines) {
                        $converted = ($item | ConvertTo-FlatObject) | Select-Object $properties
                        $hash_table = [ordered]@{}
                        
                        foreach ($column_name in $properties) {
                            $hash_table[$column_name] = $converted.$column_name
                        }
                        
                        $hash_table["phone_uuid"] = $phone.uuid
                        
                        # Output data
                        New-Object -TypeName PSObject -Property $hash_table
                    }
                } catch { 
                    Log debug "error - $($_)"
                    Log debug ($phone | ConvertTo-Json)
                }
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-PhoneLinesCreate {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'create'
            parameters = @(
                @{ name = 'uuid';       allowance = 'mandatory'   }    
                @{ name = 'index';       allowance = 'mandatory'   } 
                @{ name = 'dirn_pattern';       allowance = 'mandatory'   } 
                @{ name = 'dirn_routePartitionName';       allowance = 'mandatory'   } 
                @{ name = 'label';       allowance = 'mandatory'   }
                @{ name = 'display';       allowance = 'mandatory'   }
                @{ name = 'e164Mask';       allowance = 'mandatory'   }
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            LogIO info "PhoneLinesCreate" -In -UUID $function_params.uuid -Index $function_params.index
            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
            <soapenv:Header/>
            <soapenv:Body>
                <ns:updatePhone sequence="?">
                    <uuid>{1}</uuid>
                    <addLines>
                        <line>
                            <index>{2}</index>
                            <dirn>
                                <pattern>{3}</pattern>
                                <routePartitionName>{4}</routePartitionName>
                            </dirn>
                            <label>{5}</label>
                            <display>{6}</display>
                            <displayAscii>{7}</displayAscii>
                            <e164Mask>{8}</e164Mask>
                        </line>
                    </addLines>
                </ns:updatePhone>
            </soapenv:Body>
            </soapenv:Envelope>' -f $system_params.version, $function_params.uuid, $function_params.index, $function_params.dirn_pattern, $function_params.dirn_routePartitionName, $function_params.label, $function_params.display, $function_params.display, $function_params.e164Mask
            
            $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "updatePhone" -SoapBody $xmlRequest
  
            foreach($item in $response.Envelope.Body.updateLineResponse.return.row )
            {
                ($item | ConvertTo-FlatObject) | Select-Object $properties                 
            }
            $rv = $true;
            LogIO info "PhoneLinesCreate" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-PhoneLinesUpdate {
    param (
        # Operations
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {
        #
        # Get meta data
        #

        @{
            semantics = 'update'
            parameters = @(
                @{ name = 'uuid';       allowance = 'mandatory'   }    
                @{ name = 'index';       allowance = 'mandatory'   } 
                @{ name = 'dirn_pattern';       allowance = 'mandatory'   } 
                @{ name = 'dirn_routePartitionName';       allowance = 'mandatory'   } 
                @{ name = 'label';       allowance = 'optional'   }
                @{ name = 'display';       allowance = 'optional'   }
                @{ name = 'e164Mask';       allowance = 'optional'   }
                @{ name = 'userId';       allowance = 'optional'   }
                @{ name = '*'; allowance = 'prohibited' }
            )
        }
    }
    else {
        #
        # Execute function
        #
        $system_params = ConvertFrom-Json2 $SystemParams
        $function_params   = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.Clone()
        
        try { 
            LogIO info "PhoneLinesUpdate" -In -UUID $function_params.uuid -Index $function_params.index

            $optionalItems = ''

            if($function_params.label.length -gt 0) {
                $optionalItems += "<label>$($function_params.label)</label>"
            }

            if($function_params.display.length -gt 0) {
                $optionalItems += "<display>$($function_params.display)</display>"
                $optionalItems += "<displayAscii>$($function_params.display)</displayAscii>"
            }

            if($function_params.e164Mask.length -gt 0) {
                $optionalItems += "<e164Mask>$($function_params.e164Mask)</e164Mask>"
            }

            if($function_params.userId.length -gt 0) {
                $optionalItems += "<associatedEndusers>
                <enduser>
                    <userId>${$function_params.userId}</userId>
                </enduser>
            </associatedEndusers>"
            }

            $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
            <soapenv:Header/>
            <soapenv:Body>
                <ns:updatePhone sequence="?">
                    <uuid>{1}</uuid>
                    <lines>
                        <line>
                            <index>{2}</index>
                            <dirn>
                                <pattern>{3}</pattern>
                                <routePartitionName>{4}</routePartitionName>
                            </dirn>
                            {5}
                        </line>
                    </lines>
                </ns:updatePhone>
            </soapenv:Body>
            </soapenv:Envelope>' -f $system_params.version, $function_params.uuid, $function_params.index, $function_params.dirn_pattern, $function_params.dirn_routePartitionName, $optionalItems
            
            $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "updatePhone" -SoapBody $xmlRequest
  
            foreach($item in $response.Envelope.Body.updateLineResponse.return.row )
            {
                ($item | ConvertTo-FlatObject) | Select-Object $properties                 
            }
            $rv = $true;
            LogIO info "PhoneLinesUpdate" -Out $rv
            Log info ($function_params | ConvertTo-Json)
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }
        
        
    }
    Log info "Done"
}

function Idm-PhoneTemplatesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "PhoneTemplate"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLQuery>
                      <sql>select * from phonetemplate</sql>
                   </ns:executeSQLQuery>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLQuery" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.executeSQLQueryResponse.return.row )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-ProductsRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "Product"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                   <ns:executeSQLQuery>
                      <sql>SELECT * FROM typeproduct</sql>
                   </ns:executeSQLQuery>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "executeSQLQuery" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.executeSQLQueryResponse.return.row )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-SipProfilesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "SipProfile"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                    <ns:listSipProfile>
                        <searchCriteria>           
                            <name>%</name>
                        </searchCriteria>
                        <returnedTags>            
                            <name/>
                            <description/>
                            <defaultTelephonyEventPayloadType/>
                            <redirectByApplication/>
                            <ringing180/>
                            <timerInvite/>
                            <timerRegisterDelta/>
                            <timerRegister/>
                            <timerT1/>
                            <timerT2/>
                            <retryInvite/>
                            <retryNotInvite/>
                            <startMediaPort/>
                            <stopMediaPort/>
                            <callpickupListUri/>
                            <callpickupGroupUri/>
                            <meetmeServiceUrl/>
                            <userInfo/>
                            <dtmfDbLevel/>
                            <callHoldRingback/>
                            <anonymousCallBlock/>
                            <callerIdBlock/>
                            <dndControl/>
                            <telnetLevel/>
                            <timerKeepAlive/>
                            <timerSubscribe/>
                            <timerSubscribeDelta/>
                            <maxRedirects/>
                            <timerOffHookToFirstDigit/>
                            <callForwardUri/>
                            <abbreviatedDialUri/>
                            <confJointEnable/>
                            <rfc2543Hold/>
                            <semiAttendedTransfer/>
                            <enableVad/>
                            <stutterMsgWaiting/>
                            <callStats/>
                            <t38Invite/>
                            <rerouteIncomingRequest/>
                            <resourcePriorityNamespaceListName/>
                            <enableAnatForEarlyOfferCalls/>
                            <rsvpOverSip/>
                            <fallbackToLocalRsvp/>
                            <sipRe11XxEnabled/>
                            <gClear/>
                            <sendRecvSDPInMidCallInvite/>
                            <enableOutboundOptionsPing/>
                            <optionsPingIntervalWhenStatusOK/>
                            <optionsPingIntervalWhenStatusNotOK/>
                            <deliverConferenceBridgeIdentifier/>
                            <sipOptionsRetryCount/>
                            <sipOptionsRetryTimer/>
                            <sipBandwidthModifier/>
                            <enableUriOutdialSupport/>
                            <userAgentServerHeaderInfo/>
                            <allowPresentationSharingUsingBfcp/>
                            <scriptParameters/>
                            <isScriptTraceEnabled/>
                            <sipNormalizationScript/>
                            <allowiXApplicationMedia/>
                            <dialStringInterpretation/>
                            <acceptAudioCodecPreferences/>
                            <mlppUserAuthorization/>
                            <isAssuredSipServiceEnabled/>
                            <resourcePriorityNamespace/>
                            <useCallerIdCallerNameinUriOutgoingRequest/>
                            <callingLineIdentification/>
                            <rejectAnonymousIncomingCall/>
                            <callpickupUri/>
                            <rejectAnonymousOutgoingCall/>
                            <videoCallTrafficClass/>
                            <sdpTransparency/>
                            <allowMultipleCodecs/>
                            <sipSessionRefreshMethod/>
                            <earlyOfferSuppVoiceCall/>
                            <cucmVersionInSipHeader/>
                            <confidentialAccessLevelHeaders/>
                            <destRouteString/>
                            <inactiveSDPRequired/>
                        </returnedTags>
                    </ns:listSipProfile>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version
                
                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listSipProfile" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.listSipProfileResponse.return.sipProfile )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Idm-UniversalDeviceTemplatesRead {
    param (
        [switch] $GetMeta,
        [string] $SystemParams,
        [string] $FunctionParams
    )

    $Class = "UniversalDeviceTemplate"
    Log info "-GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"

    if ($GetMeta) {

        Get-ClassMetaData -SystemParams $SystemParams -Class $Class
    }
    else {
        $system_params   = ConvertFrom-Json2 $SystemParams
        $function_params = ConvertFrom-Json2 $FunctionParams

        $properties = $function_params.properties

        if ($properties.length -eq 0) {
            $properties = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name           
        }

        # Assure key is the first column
        $key = ($Global:Properties.$Class | Where-Object { $_.options.Contains('key') }).name
        $properties = @($key) + @($properties | Where-Object { $_ -ne $key })

        try { 
                $xmlRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.cisco.com/AXL/API/{0}">
                <soapenv:Header/>
                <soapenv:Body>
                    <ns:listUniversalDeviceTemplate sequence="?">
                    <searchCriteria>
                        <name>%</name>
                    </searchCriteria>
                    <returnedTags>
                    <name>?</name>
                    <deviceDescription>?</deviceDescription>
                    <devicePool>?</devicePool>
                    <deviceSecurityProfile>?</deviceSecurityProfile>
                    <sipProfile>?</sipProfile>
                    <phoneButtonTemplate>?</phoneButtonTemplate>
                    <sipDialRules>?</sipDialRules>
                    <callingSearchSpace>?</callingSearchSpace>
                    <callingPartyTransformationCSSForInboundCalls>?</callingPartyTransformationCSSForInboundCalls>
                    <callingPartyTransformationCSSForOutboundCalls>?</callingPartyTransformationCSSForOutboundCalls>
                    <reroutingCallingSearchSpace>?</reroutingCallingSearchSpace>
                    <subscribeCallingSearchSpaceName>?</subscribeCallingSearchSpaceName>
                    <useDevicePoolCallingPartyTransformationCSSforInboundCalls>?</useDevicePoolCallingPartyTransformationCSSforInboundCalls>
                    <useDevicePoolCallingPartyTransformationCSSforOutboundCalls>?</useDevicePoolCallingPartyTransformationCSSforOutboundCalls>
                    <commonPhoneProfile>?</commonPhoneProfile>
                    <commonDeviceConfiguration>?</commonDeviceConfiguration>
                    <softkeyTemplate>?</softkeyTemplate>
                    <featureControlPolicy>?</featureControlPolicy>
                    <phonePersonalization>?</phonePersonalization>
                    <mtpPreferredOriginatingCodec>?</mtpPreferredOriginatingCodec>
                    <outboundCallRollover>?</outboundCallRollover>
                    <mediaTerminationPointRequired>?</mediaTerminationPointRequired>
                    <unattendedPort>?</unattendedPort>
                    <requiredDtmfReception>?</requiredDtmfReception>
                    <rfc2833Disabled>?</rfc2833Disabled>
                    <useTrustedRelayPoint>?</useTrustedRelayPoint>
                    <protectedDevice>?</protectedDevice>
                    <authenticationMode>?</authenticationMode>
                    <authenticationString>?</authenticationString>
                    <keySize>?</keySize>
                    <servicesProvisioning>?</servicesProvisioning>
                    <packetCaptureMode>?</packetCaptureMode>
                    <packetCaptureDuration>?</packetCaptureDuration>
                    <secureShellUser>?</secureShellUser>
                    <secureShellPassword>?</secureShellPassword>
                    <userLocale>?</userLocale>
                    <networkLocale>?</networkLocale>
                    <mlppDomain>?</mlppDomain>
                    <mlppIndication>?</mlppIndication>
                    <mlppPreemption>?</mlppPreemption>
                    <doNotDisturb>?</doNotDisturb>
                    <dndOption>?</dndOption>
                    <dndIncomingCallAlert>?</dndIncomingCallAlert>
                    <aarGroup>?</aarGroup>
                    <aarCallingSearchSpace>?</aarCallingSearchSpace>
                    <blfPresenceGroup>?</blfPresenceGroup>
                    <blfAudibleAlertSettingPhoneBusy>?</blfAudibleAlertSettingPhoneBusy>
                    <blfAudibleAlertSettingPhoneIdle>?</blfAudibleAlertSettingPhoneIdle>
                    <userHoldMohAudioSource>?</userHoldMohAudioSource>
                    <networkHoldMohAudioSource>?</networkHoldMohAudioSource>
                    <location>?</location>
                    <geoLocation>?</geoLocation>
                    <deviceMobilityMode>?</deviceMobilityMode>
                    <mediaResourceGroupList>?</mediaResourceGroupList>
                    <remoteDevice>?</remoteDevice>
                    <hotlineDevice>?</hotlineDevice>
                    <retryVideoCallAsAudio>?</retryVideoCallAsAudio>
                    <requireOffPremiseLocation>?</requireOffPremiseLocation>
                    <ownerUserId>?</ownerUserId>
                    <mobilityUserId>?</mobilityUserId>
                    <joinAcrossLines>?</joinAcrossLines>
                    <alwaysUsePrimeLine>?</alwaysUsePrimeLine>
                    <alwaysUsePrimeLineForVoiceMessage>?</alwaysUsePrimeLineForVoiceMessage>
                    <singleButtonBarge>?</singleButtonBarge>
                    <builtInBridge>?</builtInBridge>
                    <allowControlOfDeviceFromCti>?</allowControlOfDeviceFromCti>
                    <ignorePresentationIndicators>?</ignorePresentationIndicators>
                    <enableExtensionMobility>?</enableExtensionMobility>
                    <recordingOptions>?</recordingOptions>
                    <privacy>?</privacy>
                    <loggedIntoHuntGroup>?</loggedIntoHuntGroup>
                    <proxyServer>?</proxyServer>
                    <servicesUrl>?</servicesUrl>
                    <idle>?</idle>
                    <idleTimer>?</idleTimer>
                    <secureDirUrl>?</secureDirUrl>
                    <messages>?</messages>
                    <secureIdleUrl>?</secureIdleUrl>
                    <authenticationServer>?</authenticationServer>
                    <directory>?</directory>
                    <secureServicesUrl>?</secureServicesUrl>
                    <information>?</information>
                    <secureMessagesUrl>?</secureMessagesUrl>
                    <secureInformationUrl>?</secureInformationUrl>
                    <secureAuthenticationUrl>?</secureAuthenticationUrl>
                    <externalPhoneNumber>?</externalPhoneNumber>
                    <audibleMsgWaitingicatorPolicy>?</audibleMsgWaitingicatorPolicy>
                    <logMissedCalls>?</logMissedCalls>
                    <visualMsgWaitingIndicatorPolicy>?</visualMsgWaitingIndicatorPolicy>
                    <lineLabel>?</lineLabel>
                    <displayCallerId>?</displayCallerId>
                    <MaxNumberOfCalls>?</MaxNumberOfCalls>
                    <ringSettingWhenPhoneIdle>?</ringSettingWhenPhoneIdle>
                    <busyTrigger>?</busyTrigger>
                    <ringSettingWhenPhoneInUse>?</ringSettingWhenPhoneInUse>
                    <directoryNumber>?</directoryNumber>
                    <recordingProfile>?</recordingProfile>
                    <callPickupGroupAudioAlertSettingPhoneActive>?</callPickupGroupAudioAlertSettingPhoneActive>
                    <callPickupGroupAudioAlertSettingPhoneIdle>?</callPickupGroupAudioAlertSettingPhoneIdle>
                    <monitoringCallingSearchSpace>?</monitoringCallingSearchSpace>
                    <confidentialAccess>
                        <confidentialAccessMode>?</confidentialAccessMode>
                        <confidentialAccessLevel>?</confidentialAccessLevel>
                    </confidentialAccess>
                    </returnedTags>
                </ns:listUniversalDeviceTemplate>
                </soapenv:Body>
             </soapenv:Envelope>' -f $system_params.version

                $response = Open-CiscoUnifiedCMConnection -SystemParams $system_params -FunctionParams $function_params -SoapAction "listUniversalDeviceTemplate" -SoapBody $xmlRequest
      
                foreach($item in $response.Envelope.Body.listUniversalDeviceTemplateResponse.return.universalDeviceTemplate )
                {
                    ($item | ConvertTo-FlatObject) | Select-Object $properties                 
                }

            }
            catch {
                Log error "Failed: $_"
                Write-Error $_
            }
    }

    Log info "Done"
}

function Open-CiscoUnifiedCMConnection {
    param (
        [hashtable] $SystemParams,
        [hashtable] $FunctionParams,
        [string] $SoapAction,
        [string] $SoapBody

    )
    $uri = "https://{0}/axl/" -f $SystemParams.hostname

    $webClient = new-object System.Net.WebClient -ErrorAction Stop

    $webClient.Headers.Add("Content-Type","text/xml")
    $webClient.Headers.Add("SOAPAction",("CUCM:DB ver={0} {1}" -f $SystemParams.version, $SoapAction))
    
    $pair = "{0}:{1}" -f $SystemParams.username, $SystemParams.password
    $auth = "Basic {0}" -f [System.Convert]::ToBase64String( ([System.Text.Encoding]::ASCII.GetBytes($pair)) )
    $webClient.Headers.Add("Authorization",$auth)
    
    # This was making two calls, one unauthorized then one authorizated. Opt'ed for building header instead.
    #$webClient.Credentials = new-object System.Net.NetworkCredential($SystemParams.username, $SystemParams.password)

    if($SystemParams.use_proxy)
    {
        Log info "Proxy enabled"
        add-type @"
using System.Net;
using System.Security.Cryptography.X509Certificates;
public class TrustAllCertsPolicy : ICertificatePolicy {
    public bool CheckValidationResult(
        ServicePoint srvPoint, X509Certificate certificate,
        WebRequest request, int certificateProblem) {
        return true;
    }
}
"@

        [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

        
        $webClient.proxy = new-object System.Net.WebProxy
        $webClient.Proxy.Address = $SystemParams.proxy_address
        
        if($SystemParams.use_proxy_credentials)
        {
            Log info "Using proxy authentication"
            $WebClient.proxy.Credentials = New-Object System.Net.NetworkCredential($SystemParams.proxy_username, (ConvertTo-SecureString $SystemParams.proxy_password -AsPlainText -Force) )
        }
    }

    #Log debug ("Cisco United CM - POST - {0}" -f $uri)
    try { 
        [xml]$webClient.UploadString($uri, $xmlRequest)
    } catch [System.Net.WebException] {
        if ($_.Exception.Response -ne $null) {
            $responseStream = $_.Exception.Response.GetResponseStream()
            if ($responseStream -ne $null) {
                $reader = New-Object System.IO.StreamReader($responseStream)
                $responseBodyFromException = $reader.ReadToEnd()
                Log error "$($responseBodyFromException)"
            }
        }
        throw "$($_.Exception.Message)"
    } catch {
        throw $_
    } finally {
        $webClient.Dispose()
    }
}

function Get-ClassMetaData {
    param (
        [string] $SystemParams,
        [string] $Class
    )
    
    @(
        @{
            name = 'properties'
            type = 'grid'
            label = 'Properties'
            description = 'Selected properties'
            table = @{
                rows = @( $Global:Properties.$Class | ForEach-Object {
                    @{
                        name = $_.name
                        usage_hint = @( @(
                            foreach ($opt in $_.options) {
                                if ($opt -notin @('default', 'idm', 'key')) { continue }

                                if ($opt -eq 'idm') {
                                    $opt.Toupper()
                                }
                                else {
                                    $opt.Substring(0,1).Toupper() + $opt.Substring(1)
                                }
                            }
                        ) | Sort-Object) -join ' | '
                    }
                })
                settings_grid = @{
                    selection = 'multiple'
                    key_column = 'name'
                    checkbox = $true
                    filter = $true
                    columns = @(
                        @{
                            name = 'name'
                            display_name = 'Name'
                        }
                        @{
                            name = 'usage_hint'
                            display_name = 'Usage hint'
                        }
                    )
                }
            }
            value = ($Global:Properties.$Class | Where-Object { $_.options.Contains('default') }).name
        }
    )
}
Function ConvertTo-FlatObject {
    <#
    # Modified from Original to remove "$Object." prefix
    .SYNOPSIS
        Flatten an object to simplify discovery of data

    .DESCRIPTION
        Flatten an object. This function will take an object, and flatten the properties using their full path into a single object with one layer of properties.

        You can use this to flatten XML, JSON, and other arbitrary objects.
        
        This can simplify initial exploration and discovery of data returned by APIs, interfaces, and other technologies.

        NOTE:
            Use tools like Get-Member, Select-Object, and Show-Object to further explore objects.
            This function does not handle certain data types well. It was original designed to expand XML and JSON.

    .PARAMETER InputObject
        Object to flatten
    
    .PARAMETER Exclude
        Exclude any nodes in this list. Accepts wildcards.

        Example:
            -Exclude price, title

    .PARAMETER ExcludeDefault
        Exclude default properties for sub objects. True by default.
        
        This simplifies views of many objects (e.g. XML) but may exclude data for others (e.g. if flattening a process, ProcessThread properties will be excluded)

    .PARAMETER Include
        Include only leaves in this list. Accepts wildcards.

        Example:
            -Include Author, Title

    .PARAMETER Value
        Include only leaves with values like these arguments. Accepts wildcards.
    
    .PARAMETER MaxDepth
        Stop recursion at this depth.

    .INPUTS
        Any object

    .OUTPUTS
        System.Management.Automation.PSCustomObject

    .EXAMPLE

        #Pull unanswered PowerShell questions from StackExchange, Flatten the data to date a feel for the schema
        Invoke-RestMethod "https://api.stackexchange.com/2.0/questions/unanswered?order=desc&sort=activity&tagged=powershell&pagesize=10&site=stackoverflow" |
            ConvertTo-FlatObject -Include Title, Link, View_Count

            $object.items[0].owner.link : http://stackoverflow.com/users/1946412/julealgon
            $object.items[0].view_count : 7
            $object.items[0].link : http://stackoverflow.com/questions/26910789/is-it-possible-to-reuse-a-param-block-across-multiple-functions
            $object.items[0].title : Is it possible to reuse a &#39;param&#39; block across multiple functions?
            $object.items[1].owner.link : http://stackoverflow.com/users/4248278/nitin-tyagi
            $object.items[1].view_count : 8
            $object.items[1].link : http://stackoverflow.com/questions/26909879/use-powershell-to-retreive-activated-features-for-sharepoint-2010
            $object.items[1].title : Use powershell to retreive Activated features for sharepoint 2010
            ...

    .EXAMPLE

        #Set up some XML to work with
        $object = [xml]'
            <catalog>
               <book id="bk101">
                  <author>Gambardella, Matthew</author>
                  <title>XML Developers Guide</title>
                  <genre>Computer</genre>
                  <price>44.95</price>
               </book>
               <book id="bk102">
                  <author>Ralls, Kim</author>
                  <title>Midnight Rain</title>
                  <genre>Fantasy</genre>
                  <price>5.95</price>
               </book>
            </catalog>'

        #Call the flatten command against this XML
            ConvertTo-FlatObject $object -Include Author, Title, Price
    
            #Result is a flattened object with the full path to the node, using $object as the root.
            #Only leaf properties we specified are included (author,title,price)

                $object.catalog.book[0].author : Gambardella, Matthew
                $object.catalog.book[0].title : XML Developers Guide
                $object.catalog.book[0].price : 44.95
                $object.catalog.book[1].author : Ralls, Kim
                $object.catalog.book[1].title : Midnight Rain
                $object.catalog.book[1].price : 5.95

        #Invoking the property names should return their data if the orginal object is in $object:
            $object.catalog.book[1].price
                5.95

            $object.catalog.book[0].title
                XML Developers Guide

    .EXAMPLE

        #Set up some XML to work with
            [xml]'<catalog>
               <book id="bk101">
                  <author>Gambardella, Matthew</author>
                  <title>XML Developers Guide</title>
                  <genre>Computer</genre>
                  <price>44.95</price>
               </book>
               <book id="bk102">
                  <author>Ralls, Kim</author>
                  <title>Midnight Rain</title>
                  <genre>Fantasy</genre>
                  <price>5.95</price>
               </book>
            </catalog>' |
                ConvertTo-FlatObject -exclude price, title, id
    
        Result is a flattened object with the full path to the node, using XML as the root. Price and title are excluded.

            $Object.catalog : catalog
            $Object.catalog.book : {book, book}
            $object.catalog.book[0].author : Gambardella, Matthew
            $object.catalog.book[0].genre : Computer
            $object.catalog.book[1].author : Ralls, Kim
            $object.catalog.book[1].genre : Fantasy

    .EXAMPLE
        #Set up some XML to work with
            [xml]'<catalog>
               <book id="bk101">
                  <author>Gambardella, Matthew</author>
                  <title>XML Developers Guide</title>
                  <genre>Computer</genre>
                  <price>44.95</price>
               </book>
               <book id="bk102">
                  <author>Ralls, Kim</author>
                  <title>Midnight Rain</title>
                  <genre>Fantasy</genre>
                  <price>5.95</price>
               </book>
            </catalog>' |
                ConvertTo-FlatObject -Value XML*, Fantasy

        Result is a flattened object filtered by leaves that matched XML* or Fantasy

            $Object.catalog.book[0].title : XML Developers Guide
            $Object.catalog.book[1].genre : Fantasy

    .EXAMPLE
        #Get a single process with all props, flatten this object. Don't exclude default properties
        Get-Process | select -first 1 -skip 10 -Property * | ConvertTo-FlatObject -ExcludeDefault $false

        #NOTE - There will likely be bugs for certain complex objects like this.
                For example, $Object.StartInfo.Verbs.SyncRoot.SyncRoot... will loop until we hit MaxDepth. (Note: SyncRoot is now addressed individually)

    .NOTES
        I have trouble with algorithms. If you have a better way to handle this, please let me know!

    .FUNCTIONALITY
        General Command
    #>
    [cmdletbinding()]
    param(
        
        [parameter( Mandatory = $True,
                    ValueFromPipeline = $True)]
        [PSObject[]]$InputObject,

        [string[]]$Exclude = "",

        [bool]$ExcludeDefault = $True,

        [string[]]$Include = $null,

        [string[]]$Value = $null,

        [int]$MaxDepth = 10
    )
    Begin
    {
        #region FUNCTIONS

            #Before adding a property, verify that it matches a Like comparison to strings in $Include...
            Function IsIn-Include {
                param($prop)
                if(-not $Include) {$True}
                else {
                    foreach($Inc in $Include)
                    {
                        if($Prop -like $Inc)
                        {
                            $True
                        }
                    }
                }
            }

            #Before adding a value, verify that it matches a Like comparison to strings in $Value...
            Function IsIn-Value {
                param($val)
                if(-not $Value) {$True}
                else {
                    foreach($string in $Value)
                    {
                        if($val -like $string)
                        {
                            $True
                        }
                    }
                }
            }

            Function Get-Exclude {
                [cmdletbinding()]
                param($obj)

                #Exclude default props if specified, and anything the user specified. Thanks to Jaykul for the hint on [type]!
                    if($ExcludeDefault)
                    {
                        Try
                        {
                            $DefaultTypeProps = @( $obj.gettype().GetProperties() | Select-Object -ExpandProperty Name -ErrorAction Stop )
                            $DefaultTypeProps = $DefaultTypeProps | Where-Object { $_ -ne "Name" }
                            
                            if($DefaultTypeProps.count -gt 0)
                            {
                                Write-Verbose -Verbose "Excluding default properties for $($obj.gettype().Fullname):`n$($DefaultTypeProps | Out-String)"
                            }
                        }
                        Catch
                        {
                            Write-Verbose -Verbose "Failed to extract properties from $($obj.gettype().Fullname): $_"
                            $DefaultTypeProps = @()
                        }
                    }
                    
                    @( $Exclude + $DefaultTypeProps ) | Select-Object -Unique
            }

            #Function to recurse the Object, add properties to object
            Function Recurse-Object {
                [cmdletbinding()]
                param(
                    $Object,
                    [string[]]$path = '',
                    [psobject]$Output,
                    $depth = 0
                )

                # Handle initial call
                    Write-Verbose -Verbose "Working in path $Path at depth $depth"
                    Write-Debug "Recurse Object called with PSBoundParameters:`n$($PSBoundParameters | Out-String)"
                    $Depth++

                #Exclude default props if specified, and anything the user specified.
                    $ExcludeProps = @( Get-Exclude $object )

                #Get the children we care about, and their names
                    $Children = $object.psobject.properties | Where-Object {$ExcludeProps -notcontains $_.Name }
                    Write-Debug "Working on properties:`n$($Children | Select-Object -ExpandProperty Name | Out-String)"

                #Loop through the children properties.
                foreach($Child in @($Children))
                {
                    $ChildName = $Child.Name
                    $ChildValue = $Child.Value

                    Write-Debug "Working on property $ChildName with value $($ChildValue | Out-String)"
                    # Handle special characters...
                        if($ChildName -match '[^a-zA-Z0-9_]')
                        {
                            $FriendlyChildName = "{$ChildName}"
                        }
                        else
                        {
                            $FriendlyChildName = $ChildName
                        }

                    #Add the property.
                        if((IsIn-Include $ChildName) -and (IsIn-Value $ChildValue) -and $Depth -le $MaxDepth)
                        {
                            Write-Debug "ChildName [$($ChildName)] - $ChildValue $($ChildValue) - Depth [$($Depth)] - Path [$($Path)] - Path Length [$($path.Length)] - FriendlyChildName [$FriendlyChildName]"

                            if([string]::IsNullOrEmpty($Path)) {
                                $ThisPath = $FriendlyChildName
                            } else {
                                $ThisPath = @( $Path + $FriendlyChildName ) -join "_"
                            }
                            $ThisPath = $ThisPath.Replace("{#text}","text")
                            if("$($ChildValue)" -ne 'System.Xml.XmlElement')
                            {
                                $Output | Add-Member -MemberType NoteProperty -Name $ThisPath -Value "$($ChildValue)"
                                Write-Verbose -Verbose "Adding member '$ThisPath'"
                            }
                        }

                    #Handle null...
                        if($null -eq $ChildValue)
                        {
                            Write-Verbose -Verbose "Skipping NULL $ChildName"
                            continue
                        }

                    #Handle evil looping. Will likely need to expand this. Any thoughts on a better approach?
                        if(
                            (
                                $ChildValue.GetType() -eq $Object.GetType() -and
                                $ChildValue -is [datetime]
                            ) -or
                            (
                                $ChildName -eq "SyncRoot" -and
                                -not $ChildValue
                            )
                        )
                        {
                            Write-Verbose -Verbose "Skipping $ChildName with type $($ChildValue.GetType().fullname)"
                            continue
                        }

                    #Check for arrays
                        $IsArray = @($ChildValue).count -gt 1
                        $count = 0
                        
                    #Set up the path to this node and the data...
                    if([string]::IsNullOrEmpty($Path)) {
                        $CurrentPath = $FriendlyChildName
                    } else {
                        $CurrentPath = @( $Path + $FriendlyChildName ) -join "_"
                    }

                    #Exclude default props if specified, and anything the user specified.
                        $ExcludeProps = @( Get-Exclude $ChildValue )

                    #Get the children's children we care about, and their names. Also look for signs of a hashtable like type
                        $ChildrensChildren = $ChildValue.psobject.properties | Where-Object {$ExcludeProps -notcontains $_.Name }
                        $HashKeys = if($ChildValue.Keys -notlike $null -and $ChildValue.Values)
                        {
                            $ChildValue.Keys
                        }
                        else
                        {
                            $null
                        }
                        Write-Debug "Found children's children $($ChildrensChildren | Select-Object -ExpandProperty Name | Out-String)"

                    #If we aren't at max depth or a leaf...
                    if(
                        (@($ChildrensChildren).count -ne 0 -or $HashKeys) -and
                        $Depth -lt $MaxDepth
                    )
                    {
                        #This handles hashtables. But it won't recurse...
                            if($HashKeys)
                            {
                                Write-Verbose -Verbose "Working on hashtable $CurrentPath"
                                foreach($key in $HashKeys)
                                {
                                    $newKey = $key.Replace("{#text}","text")
                                    Write-Verbose -Verbose "Adding value from hashtable $CurrentPath['$newKey']"
                                    $Output | Add-Member -MemberType NoteProperty -name "$CurrentPath['$newKey']" -value "$($ChildValue["$newKey"])"
                                    $Output = Recurse-Object -Object $ChildValue["$newKey"] -Path "$CurrentPath['$newKey']" -Output $Output -depth $depth 
                                }
                            }
                        #Sub children? Recurse!
                            else
                            {
                                if($IsArray)
                                {
                                    foreach($item in @($ChildValue))
                                    {  
                                        Write-Verbose -Verbose "Recursing through array node '$CurrentPath'"
                                        $Output = Recurse-Object -Object $item -Path "$CurrentPath[$count]" -Output $Output -depth $depth
                                        $Count++
                                    }
                                }
                                else
                                {
                                    Write-Verbose -Verbose "Recursing through node '$CurrentPath'"
                                    $Output = Recurse-Object -Object $ChildValue -Path $CurrentPath -Output $Output -depth $depth
                                }
                            }
                        }
                    }
                
                $Output
            }

        #endregion FUNCTIONS
    }
    Process
    {
        Foreach($Object in $InputObject)
        {
            #Flatten the XML and write it to the pipeline
                Recurse-Object -Object $Object -Output $( New-Object -TypeName PSObject )
        }
    }
}