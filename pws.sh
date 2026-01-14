#!/usr/bin/env pwsh

# =========== Created with CLI version 1.26.0 ===========

function ExecAndGetMigrationID {
    param (
        [scriptblock]$ScriptBlock
    )
    $MigrationID = & @ScriptBlock | ForEach-Object {
        Write-Host $_
        $_
    } | Select-String -Pattern "\(ID: (.+)\)" | ForEach-Object { $_.matches.groups[1] }
    return $MigrationID
}

if (-not $env:GH_PAT) {
    Write-Error "GH_PAT environment variable must be set to a valid GitHub Personal Access Token with the appropriate scopes. For more information see https://docs.github.com/en/migrations/using-github-enterprise-importer/preparing-to-migrate-with-github-enterprise-importer/managing-access-for-github-enterprise-importer#creating-a-personal-access-token-for-github-enterprise-importer"
    exit 1
} else {
    Write-Host "GH_PAT environment variable is set and will be used to authenticate to GitHub."
}

$Succeeded = 0
$Failed = 0
$RepoMigrations = [ordered]@{}

# =========== Organization: Trail-Tech ===========

# === Queuing repo migrations ===
$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vpro_bluetooth_qt_demo" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vpro_bluetooth_qt_demo" --queue-only --target-repo-visibility private }
$RepoMigrations["vpro_bluetooth_qt_demo"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ti-cc1120" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ti-cc1120" --queue-only --target-repo-visibility private }
$RepoMigrations["ti-cc1120"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt_robot_test" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt_robot_test" --queue-only --target-repo-visibility private }
$RepoMigrations["tt_robot_test"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vpro-hmi" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vpro-hmi" --queue-only --target-repo-visibility private }
$RepoMigrations["vpro-hmi"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-trailtech" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-trailtech" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-trailtech"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VoyagerPro" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VoyagerPro" --queue-only --target-repo-visibility private }
$RepoMigrations["VoyagerPro"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "buddy-tracking" --github-target-org "Polaris-InVehicleSoftware" --target-repo "buddy-tracking" --queue-only --target-repo-visibility private }
$RepoMigrations["buddy-tracking"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "navit" --github-target-org "Polaris-InVehicleSoftware" --target-repo "navit" --queue-only --target-repo-visibility private }
$RepoMigrations["navit"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-kl03z-standalone" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-kl03z-standalone" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-kl03z-standalone"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-hx8357" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-hx8357" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-hx8357"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vpro-data" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vpro-data" --queue-only --target-repo-visibility private }
$RepoMigrations["vpro-data"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vpro-styles" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vpro-styles" --queue-only --target-repo-visibility private }
$RepoMigrations["vpro-styles"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-se868v3" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-se868v3" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-se868v3"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-gpio-ctrl" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-gpio-ctrl" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-gpio-ctrl"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "pyvehicle" --github-target-org "Polaris-InVehicleSoftware" --target-repo "pyvehicle" --queue-only --target-repo-visibility private }
$RepoMigrations["pyvehicle"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vpro-arm0" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vpro-arm0" --queue-only --target-repo-visibility private }
$RepoMigrations["vpro-arm0"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "d1rtos" --github-target-org "Polaris-InVehicleSoftware" --target-repo "d1rtos" --queue-only --target-repo-visibility private }
$RepoMigrations["d1rtos"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "libvehicle" --github-target-org "Polaris-InVehicleSoftware" --target-repo "libvehicle" --queue-only --target-repo-visibility private }
$RepoMigrations["libvehicle"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "docker_build_environment" --github-target-org "Polaris-InVehicleSoftware" --target-repo "docker_build_environment" --queue-only --target-repo-visibility private }
$RepoMigrations["docker_build_environment"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "benchmark-info" --github-target-org "Polaris-InVehicleSoftware" --target-repo "benchmark-info" --queue-only --target-repo-visibility private }
$RepoMigrations["benchmark-info"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-hmi" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-hmi" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-hmi"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "gopro-wsdk" --github-target-org "Polaris-InVehicleSoftware" --target-repo "gopro-wsdk" --queue-only --target-repo-visibility private }
$RepoMigrations["gopro-wsdk"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vpro-arm0-version" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vpro-arm0-version" --queue-only --target-repo-visibility private }
$RepoMigrations["vpro-arm0-version"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "voyager-mapping" --github-target-org "Polaris-InVehicleSoftware" --target-repo "voyager-mapping" --queue-only --target-repo-visibility private }
$RepoMigrations["voyager-mapping"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "snippets" --github-target-org "Polaris-InVehicleSoftware" --target-repo "snippets" --queue-only --target-repo-visibility private }
$RepoMigrations["snippets"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-audio" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-audio" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-audio"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ST-Voyager-app" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ST-Voyager-app" --queue-only --target-repo-visibility private }
$RepoMigrations["ST-Voyager-app"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "distribution" --github-target-org "Polaris-InVehicleSoftware" --target-repo "distribution" --queue-only --target-repo-visibility private }
$RepoMigrations["distribution"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "gopro-poc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "gopro-poc" --queue-only --target-repo-visibility private }
$RepoMigrations["gopro-poc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Polaris_Production_Software_v2" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Polaris_Production_Software_v2" --queue-only --target-repo-visibility private }
$RepoMigrations["Polaris_Production_Software_v2"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "B1C4_Board_Tester" --github-target-org "Polaris-InVehicleSoftware" --target-repo "B1C4_Board_Tester" --queue-only --target-repo-visibility private }
$RepoMigrations["B1C4_Board_Tester"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "GoProConnect" --github-target-org "Polaris-InVehicleSoftware" --target-repo "GoProConnect" --queue-only --target-repo-visibility private }
$RepoMigrations["GoProConnect"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "mapbox-gl-native" --github-target-org "Polaris-InVehicleSoftware" --target-repo "mapbox-gl-native" --queue-only --target-repo-visibility public }
$RepoMigrations["mapbox-gl-native"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "test" --github-target-org "Polaris-InVehicleSoftware" --target-repo "test" --queue-only --target-repo-visibility private }
$RepoMigrations["test"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "orv-refactor" --github-target-org "Polaris-InVehicleSoftware" --target-repo "orv-refactor" --queue-only --target-repo-visibility private }
$RepoMigrations["orv-refactor"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ExecTest" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ExecTest" --queue-only --target-repo-visibility private }
$RepoMigrations["ExecTest"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "lps22hb-input" --github-target-org "Polaris-InVehicleSoftware" --target-repo "lps22hb-input" --queue-only --target-repo-visibility private }
$RepoMigrations["lps22hb-input"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "B1_ATV_Youth_Cypress_BLE_Module" --github-target-org "Polaris-InVehicleSoftware" --target-repo "B1_ATV_Youth_Cypress_BLE_Module" --queue-only --target-repo-visibility private }
$RepoMigrations["B1_ATV_Youth_Cypress_BLE_Module"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "B1_Cypress_CyBLE_Demo" --github-target-org "Polaris-InVehicleSoftware" --target-repo "B1_Cypress_CyBLE_Demo" --queue-only --target-repo-visibility private }
$RepoMigrations["B1_Cypress_CyBLE_Demo"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "venus-hmi" --github-target-org "Polaris-InVehicleSoftware" --target-repo "venus-hmi" --queue-only --target-repo-visibility private }
$RepoMigrations["venus-hmi"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-venus" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-venus" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-venus"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "EngineeringNode" --github-target-org "Polaris-InVehicleSoftware" --target-repo "EngineeringNode" --queue-only --target-repo-visibility private }
$RepoMigrations["EngineeringNode"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RideCommand" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RideCommand" --queue-only --target-repo-visibility private }
$RepoMigrations["RideCommand"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "kolpin-plow" --github-target-org "Polaris-InVehicleSoftware" --target-repo "kolpin-plow" --queue-only --target-repo-visibility private }
$RepoMigrations["kolpin-plow"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "v2v-service" --github-target-org "Polaris-InVehicleSoftware" --target-repo "v2v-service" --queue-only --target-repo-visibility private }
$RepoMigrations["v2v-service"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "EOLT_BBObjects" --github-target-org "Polaris-InVehicleSoftware" --target-repo "EOLT_BBObjects" --queue-only --target-repo-visibility private }
$RepoMigrations["EOLT_BBObjects"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Trail-Tech-Geofence-Module" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Trail-Tech-Geofence-Module" --queue-only --target-repo-visibility private }
$RepoMigrations["Trail-Tech-Geofence-Module"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "v2v-micro" --github-target-org "Polaris-InVehicleSoftware" --target-repo "v2v-micro" --queue-only --target-repo-visibility private }
$RepoMigrations["v2v-micro"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "p57-arm0" --github-target-org "Polaris-InVehicleSoftware" --target-repo "p57-arm0" --queue-only --target-repo-visibility private }
$RepoMigrations["p57-arm0"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Mini-Zeus-iOS-BLE-Application" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Mini-Zeus-iOS-BLE-Application" --queue-only --target-repo-visibility private }
$RepoMigrations["Mini-Zeus-iOS-BLE-Application"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "AppleMFID" --github-target-org "Polaris-InVehicleSoftware" --target-repo "AppleMFID" --queue-only --target-repo-visibility private }
$RepoMigrations["AppleMFID"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-gps" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-gps" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-gps"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "lpc21isp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "lpc21isp" --queue-only --target-repo-visibility public }
$RepoMigrations["lpc21isp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vpro-vnc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vpro-vnc" --queue-only --target-repo-visibility private }
$RepoMigrations["vpro-vnc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "node-pty" --github-target-org "Polaris-InVehicleSoftware" --target-repo "node-pty" --queue-only --target-repo-visibility private }
$RepoMigrations["node-pty"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "EOLT_TestServer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "EOLT_TestServer" --queue-only --target-repo-visibility private }
$RepoMigrations["EOLT_TestServer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "eolt-tests" --github-target-org "Polaris-InVehicleSoftware" --target-repo "eolt-tests" --queue-only --target-repo-visibility private }
$RepoMigrations["eolt-tests"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PSoC6-BLE" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PSoC6-BLE" --queue-only --target-repo-visibility private }
$RepoMigrations["PSoC6-BLE"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "kv11z" --github-target-org "Polaris-InVehicleSoftware" --target-repo "kv11z" --queue-only --target-repo-visibility private }
$RepoMigrations["kv11z"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-nav" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-nav" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-nav"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "1190can" --github-target-org "Polaris-InVehicleSoftware" --target-repo "1190can" --queue-only --target-repo-visibility private }
$RepoMigrations["1190can"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Jenkins-build-scripts" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Jenkins-build-scripts" --queue-only --target-repo-visibility private }
$RepoMigrations["Jenkins-build-scripts"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "MFI-iAP2-EAP-tester" --github-target-org "Polaris-InVehicleSoftware" --target-repo "MFI-iAP2-EAP-tester" --queue-only --target-repo-visibility private }
$RepoMigrations["MFI-iAP2-EAP-tester"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "pelias_docker_import_environment" --github-target-org "Polaris-InVehicleSoftware" --target-repo "pelias_docker_import_environment" --queue-only --target-repo-visibility private }
$RepoMigrations["pelias_docker_import_environment"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "kodiak" --github-target-org "Polaris-InVehicleSoftware" --target-repo "kodiak" --queue-only --target-repo-visibility private }
$RepoMigrations["kodiak"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "keaz128" --github-target-org "Polaris-InVehicleSoftware" --target-repo "keaz128" --queue-only --target-repo-visibility private }
$RepoMigrations["keaz128"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "timezone-service" --github-target-org "Polaris-InVehicleSoftware" --target-repo "timezone-service" --queue-only --target-repo-visibility private }
$RepoMigrations["timezone-service"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RL78_Bootloader" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RL78_Bootloader" --queue-only --target-repo-visibility private }
$RepoMigrations["RL78_Bootloader"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "libpostal-data" --github-target-org "Polaris-InVehicleSoftware" --target-repo "libpostal-data" --queue-only --target-repo-visibility private }
$RepoMigrations["libpostal-data"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "geocoder-nlp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "geocoder-nlp" --queue-only --target-repo-visibility private }
$RepoMigrations["geocoder-nlp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-imu" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-imu" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-imu"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "rom-crc-tool" --github-target-org "Polaris-InVehicleSoftware" --target-repo "rom-crc-tool" --queue-only --target-repo-visibility private }
$RepoMigrations["rom-crc-tool"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "platform-demo-app" --github-target-org "Polaris-InVehicleSoftware" --target-repo "platform-demo-app" --queue-only --target-repo-visibility private }
$RepoMigrations["platform-demo-app"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "venus-styles" --github-target-org "Polaris-InVehicleSoftware" --target-repo "venus-styles" --queue-only --target-repo-visibility private }
$RepoMigrations["venus-styles"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "pelias-geocoder-nlp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "pelias-geocoder-nlp" --queue-only --target-repo-visibility private }
$RepoMigrations["pelias-geocoder-nlp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Engineering_Tool" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Engineering_Tool" --queue-only --target-repo-visibility private }
$RepoMigrations["Engineering_Tool"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bbb-tbat" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bbb-tbat" --queue-only --target-repo-visibility private }
$RepoMigrations["bbb-tbat"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-bluetooth" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-bluetooth" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-bluetooth"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "cvcproxy" --github-target-org "Polaris-InVehicleSoftware" --target-repo "cvcproxy" --queue-only --target-repo-visibility private }
$RepoMigrations["cvcproxy"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-user" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-user" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-user"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "boot-animations" --github-target-org "Polaris-InVehicleSoftware" --target-repo "boot-animations" --queue-only --target-repo-visibility private }
$RepoMigrations["boot-animations"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vpro-cmtest" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vpro-cmtest" --queue-only --target-repo-visibility private }
$RepoMigrations["vpro-cmtest"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-init" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-init" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-init"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-disks" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-disks" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-disks"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtquickcompiler" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtquickcompiler" --queue-only --target-repo-visibility private }
$RepoMigrations["qtquickcompiler"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "apollo-arm0" --github-target-org "Polaris-InVehicleSoftware" --target-repo "apollo-arm0" --queue-only --target-repo-visibility private }
$RepoMigrations["apollo-arm0"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-telemetry" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-telemetry" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-telemetry"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "winchctrld" --github-target-org "Polaris-InVehicleSoftware" --target-repo "winchctrld" --queue-only --target-repo-visibility private }
$RepoMigrations["winchctrld"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-video" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-video" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-video"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "GPXValidator" --github-target-org "Polaris-InVehicleSoftware" --target-repo "GPXValidator" --queue-only --target-repo-visibility private }
$RepoMigrations["GPXValidator"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-freescale" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-freescale" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-freescale"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-tiles" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-tiles" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-tiles"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "BBPOT" --github-target-org "Polaris-InVehicleSoftware" --target-repo "BBPOT" --queue-only --target-repo-visibility private }
$RepoMigrations["BBPOT"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-ccu-rtps-test" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-ccu-rtps-test" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-ccu-rtps-test"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "kodiak-tools" --github-target-org "Polaris-InVehicleSoftware" --target-repo "kodiak-tools" --queue-only --target-repo-visibility private }
$RepoMigrations["kodiak-tools"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "boot-animation" --github-target-org "Polaris-InVehicleSoftware" --target-repo "boot-animation" --queue-only --target-repo-visibility private }
$RepoMigrations["boot-animation"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "manufacturing-hmi" --github-target-org "Polaris-InVehicleSoftware" --target-repo "manufacturing-hmi" --queue-only --target-repo-visibility private }
$RepoMigrations["manufacturing-hmi"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "python-reflash-j1939" --github-target-org "Polaris-InVehicleSoftware" --target-repo "python-reflash-j1939" --queue-only --target-repo-visibility private }
$RepoMigrations["python-reflash-j1939"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-tts" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-tts" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-tts"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "LocationStudio" --github-target-org "Polaris-InVehicleSoftware" --target-repo "LocationStudio" --queue-only --target-repo-visibility private }
$RepoMigrations["LocationStudio"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-mcas" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-mcas" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-mcas"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "backlightd" --github-target-org "Polaris-InVehicleSoftware" --target-repo "backlightd" --queue-only --target-repo-visibility private }
$RepoMigrations["backlightd"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "powermanagerd" --github-target-org "Polaris-InVehicleSoftware" --target-repo "powermanagerd" --queue-only --target-repo-visibility private }
$RepoMigrations["powermanagerd"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-utils" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-utils" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-utils"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "debuglogger" --github-target-org "Polaris-InVehicleSoftware" --target-repo "debuglogger" --queue-only --target-repo-visibility private }
$RepoMigrations["debuglogger"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "HTTPApp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "HTTPApp" --queue-only --target-repo-visibility private }
$RepoMigrations["HTTPApp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-logger" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-logger" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-logger"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-usb" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-usb" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-usb"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-modemd" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-modemd" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-modemd"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-carplay-old" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-carplay-old" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-carplay-old"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-3180-LED" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-3180-LED" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-3180-LED"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-3210-ballast5" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-3210-ballast5" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-3210-ballast5"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-3215-ballast6" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-3215-ballast6" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-3215-ballast6"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-7020-TTO-programmer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-7020-TTO-programmer" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-7020-TTO-programmer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-7020-TTO" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-7020-TTO" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-7020-TTO"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-7050-TTV" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-7050-TTV" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-7050-TTV"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-7050-TTV-programmer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-7050-TTV-programmer" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-7050-TTV-programmer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-RL78-low-power" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-RL78-low-power" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-RL78-low-power"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-E100" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-E100" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-E100"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-8100" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-8100" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-8100"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-8100-programmer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-8100-programmer" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-8100-programmer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-8105" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-8105" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-8105"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-7000-gauges" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-7000-gauges" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-7000-gauges"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-Brammo-DashSimulator" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-Brammo-DashSimulator" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-Brammo-DashSimulator"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-Brammo" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-Brammo" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-Brammo"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-Brammo-programmer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-Brammo-programmer" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-Brammo-programmer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-coil-driver" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-coil-driver" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-coil-driver"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-OHVTrails" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-OHVTrails" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-OHVTrails"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-PICkit2-programmer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-PICkit2-programmer" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-PICkit2-programmer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-switch-controller" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-switch-controller" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-switch-controller"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-RideLeader" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-RideLeader" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-RideLeader"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-RideLeader-web" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-RideLeader-web" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-RideLeader-web"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-voyager" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-voyager" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-voyager"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-voyager-programmer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-voyager-programmer" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-voyager-programmer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-ST-VPro-app_OLD" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-ST-VPro-app_OLD" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-ST-VPro-app_OLD"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-ST-VPro-app" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-ST-VPro-app" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-ST-VPro-app"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-ST-VPro-bootloader" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-ST-VPro-bootloader" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-ST-VPro-bootloader"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-ST-VPro-buildroot" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-ST-VPro-buildroot" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-ST-VPro-buildroot"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-ST-VPro-gpsdriver" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-ST-VPro-gpsdriver" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-ST-VPro-gpsdriver"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-ST-VPro-kernel" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-ST-VPro-kernel" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-ST-VPro-kernel"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tt-pga-ST-VPro-bsp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tt-pga-ST-VPro-bsp" --queue-only --target-repo-visibility private }
$RepoMigrations["tt-pga-ST-VPro-bsp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "B1-Cypress-BLE-Module" --github-target-org "Polaris-InVehicleSoftware" --target-repo "B1-Cypress-BLE-Module" --queue-only --target-repo-visibility private }
$RepoMigrations["B1-Cypress-BLE-Module"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "B1-Bluegiga-WT12-Module" --github-target-org "Polaris-InVehicleSoftware" --target-repo "B1-Bluegiga-WT12-Module" --queue-only --target-repo-visibility private }
$RepoMigrations["B1-Bluegiga-WT12-Module"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Polaris_Engineering_Tool" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Polaris_Engineering_Tool" --queue-only --target-repo-visibility private }
$RepoMigrations["Polaris_Engineering_Tool"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Polaris_Flash_Tool" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Polaris_Flash_Tool" --queue-only --target-repo-visibility private }
$RepoMigrations["Polaris_Flash_Tool"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Polaris_Production_Software_v1" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Polaris_Production_Software_v1" --queue-only --target-repo-visibility private }
$RepoMigrations["Polaris_Production_Software_v1"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "lib-apple-carplay" --github-target-org "Polaris-InVehicleSoftware" --target-repo "lib-apple-carplay" --queue-only --target-repo-visibility private }
$RepoMigrations["lib-apple-carplay"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "linux-manufacturing" --github-target-org "Polaris-InVehicleSoftware" --target-repo "linux-manufacturing" --queue-only --target-repo-visibility private }
$RepoMigrations["linux-manufacturing"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "arnold" --github-target-org "Polaris-InVehicleSoftware" --target-repo "arnold" --queue-only --target-repo-visibility private }
$RepoMigrations["arnold"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "nuance-tts-binaries" --github-target-org "Polaris-InVehicleSoftware" --target-repo "nuance-tts-binaries" --queue-only --target-repo-visibility private }
$RepoMigrations["nuance-tts-binaries"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "nuance-tts-data" --github-target-org "Polaris-InVehicleSoftware" --target-repo "nuance-tts-data" --queue-only --target-repo-visibility private }
$RepoMigrations["nuance-tts-data"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "linux-manufacturing-deployment" --github-target-org "Polaris-InVehicleSoftware" --target-repo "linux-manufacturing-deployment" --queue-only --target-repo-visibility private }
$RepoMigrations["linux-manufacturing-deployment"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ApolloEHT_pic" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ApolloEHT_pic" --queue-only --target-repo-visibility private }
$RepoMigrations["ApolloEHT_pic"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "manufacturing-hmi-2" --github-target-org "Polaris-InVehicleSoftware" --target-repo "manufacturing-hmi-2" --queue-only --target-repo-visibility private }
$RepoMigrations["manufacturing-hmi-2"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-telematics" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-telematics" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-telematics"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "linux-uds-server" --github-target-org "Polaris-InVehicleSoftware" --target-repo "linux-uds-server" --queue-only --target-repo-visibility private }
$RepoMigrations["linux-uds-server"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "EOLT_Laser" --github-target-org "Polaris-InVehicleSoftware" --target-repo "EOLT_Laser" --queue-only --target-repo-visibility private }
$RepoMigrations["EOLT_Laser"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "sdbus-cpp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "sdbus-cpp" --queue-only --target-repo-visibility public }
$RepoMigrations["sdbus-cpp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bootpd" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bootpd" --queue-only --target-repo-visibility public }
$RepoMigrations["bootpd"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bbb-can" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bbb-can" --queue-only --target-repo-visibility private }
$RepoMigrations["bbb-can"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-kmrc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-kmrc" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-kmrc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "pocketCanBeagle" --github-target-org "Polaris-InVehicleSoftware" --target-repo "pocketCanBeagle" --queue-only --target-repo-visibility private }
$RepoMigrations["pocketCanBeagle"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-shm-test" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-shm-test" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-shm-test"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tiva_needle_press" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tiva_needle_press" --queue-only --target-repo-visibility private }
$RepoMigrations["tiva_needle_press"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "GroupRide" --github-target-org "Polaris-InVehicleSoftware" --target-repo "GroupRide" --queue-only --target-repo-visibility private }
$RepoMigrations["GroupRide"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-imu" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-imu" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-imu"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Shiba_DoIP_Tool" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Shiba_DoIP_Tool" --queue-only --target-repo-visibility public }
$RepoMigrations["Shiba_DoIP_Tool"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "LongRangeRadioDev" --github-target-org "Polaris-InVehicleSoftware" --target-repo "LongRangeRadioDev" --queue-only --target-repo-visibility private }
$RepoMigrations["LongRangeRadioDev"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "needlePressCanBeagle" --github-target-org "Polaris-InVehicleSoftware" --target-repo "needlePressCanBeagle" --queue-only --target-repo-visibility private }
$RepoMigrations["needlePressCanBeagle"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "CCURadioTester" --github-target-org "Polaris-InVehicleSoftware" --target-repo "CCURadioTester" --queue-only --target-repo-visibility private }
$RepoMigrations["CCURadioTester"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ccuRobot" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ccuRobot" --queue-only --target-repo-visibility private }
$RepoMigrations["ccuRobot"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm_manufacturing_app" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm_manufacturing_app" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm_manufacturing_app"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "oreo-arm0" --github-target-org "Polaris-InVehicleSoftware" --target-repo "oreo-arm0" --queue-only --target-repo-visibility private }
$RepoMigrations["oreo-arm0"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "rockblockd" --github-target-org "Polaris-InVehicleSoftware" --target-repo "rockblockd" --queue-only --target-repo-visibility private }
$RepoMigrations["rockblockd"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-cvc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-cvc" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-cvc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-ccu-hmi" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-ccu-hmi" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-ccu-hmi"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "CANalyzer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "CANalyzer" --queue-only --target-repo-visibility private }
$RepoMigrations["CANalyzer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "rideleader" --github-target-org "Polaris-InVehicleSoftware" --target-repo "rideleader" --queue-only --target-repo-visibility private }
$RepoMigrations["rideleader"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-bluetooth" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-bluetooth" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-bluetooth"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ci-test" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ci-test" --queue-only --target-repo-visibility private }
$RepoMigrations["ci-test"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ttci" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ttci" --queue-only --target-repo-visibility private }
$RepoMigrations["ttci"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm_bbb_slot" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm_bbb_slot" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm_bbb_slot"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "J1939_Parser" --github-target-org "Polaris-InVehicleSoftware" --target-repo "J1939_Parser" --queue-only --target-repo-visibility private }
$RepoMigrations["J1939_Parser"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-mfi" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-mfi" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-mfi"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm_eolt_exec" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm_eolt_exec" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm_eolt_exec"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "cvdata" --github-target-org "Polaris-InVehicleSoftware" --target-repo "cvdata" --queue-only --target-repo-visibility private }
$RepoMigrations["cvdata"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ignite" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ignite" --queue-only --target-repo-visibility private }
$RepoMigrations["ignite"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ota-src" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ota-src" --queue-only --target-repo-visibility private }
$RepoMigrations["ota-src"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "harman_vdm" --github-target-org "Polaris-InVehicleSoftware" --target-repo "harman_vdm" --queue-only --target-repo-visibility private }
$RepoMigrations["harman_vdm"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "harman_rbua" --github-target-org "Polaris-InVehicleSoftware" --target-repo "harman_rbua" --queue-only --target-repo-visibility private }
$RepoMigrations["harman_rbua"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "libj1939" --github-target-org "Polaris-InVehicleSoftware" --target-repo "libj1939" --queue-only --target-repo-visibility private }
$RepoMigrations["libj1939"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "can_app_pieces" --github-target-org "Polaris-InVehicleSoftware" --target-repo "can_app_pieces" --queue-only --target-repo-visibility private }
$RepoMigrations["can_app_pieces"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "journald-plugin" --github-target-org "Polaris-InVehicleSoftware" --target-repo "journald-plugin" --queue-only --target-repo-visibility private }
$RepoMigrations["journald-plugin"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ignite-event-provider" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ignite-event-provider" --queue-only --target-repo-visibility private }
$RepoMigrations["ignite-event-provider"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-hfpproxy" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-hfpproxy" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-hfpproxy"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-vdm-client" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-vdm-client" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-vdm-client"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ota-update-agent" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ota-update-agent" --queue-only --target-repo-visibility private }
$RepoMigrations["ota-update-agent"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "HandlersGenerator" --github-target-org "Polaris-InVehicleSoftware" --target-repo "HandlersGenerator" --queue-only --target-repo-visibility private }
$RepoMigrations["HandlersGenerator"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "mapbox-gl-native-private" --github-target-org "Polaris-InVehicleSoftware" --target-repo "mapbox-gl-native-private" --queue-only --target-repo-visibility private }
$RepoMigrations["mapbox-gl-native-private"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "CESProjectManager" --github-target-org "Polaris-InVehicleSoftware" --target-repo "CESProjectManager" --queue-only --target-repo-visibility private }
$RepoMigrations["CESProjectManager"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ccu-flash" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ccu-flash" --queue-only --target-repo-visibility private }
$RepoMigrations["ccu-flash"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Polaris-Common" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Polaris-Common" --queue-only --target-repo-visibility private }
$RepoMigrations["Polaris-Common"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "python-j1939" --github-target-org "Polaris-InVehicleSoftware" --target-repo "python-j1939" --queue-only --target-repo-visibility public }
$RepoMigrations["python-j1939"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Polaris_Helmet_Audio_Accelerometer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Polaris_Helmet_Audio_Accelerometer" --queue-only --target-repo-visibility private }
$RepoMigrations["Polaris_Helmet_Audio_Accelerometer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Polaris_Helmet_Audio_Accelerometer_HW_Design" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Polaris_Helmet_Audio_Accelerometer_HW_Design" --queue-only --target-repo-visibility private }
$RepoMigrations["Polaris_Helmet_Audio_Accelerometer_HW_Design"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-hostname" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-hostname" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-hostname"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-ssl" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-ssl" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-ssl"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Polaris_Helmet_UI_Demo_BLE_FW" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Polaris_Helmet_UI_Demo_BLE_FW" --queue-only --target-repo-visibility private }
$RepoMigrations["Polaris_Helmet_UI_Demo_BLE_FW"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Polaris_Helmet_UI_Demo_Xcode_iPad_Application" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Polaris_Helmet_UI_Demo_Xcode_iPad_Application" --queue-only --target-repo-visibility private }
$RepoMigrations["Polaris_Helmet_UI_Demo_Xcode_iPad_Application"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-keystore" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-keystore" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-keystore"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "kodiak-tools-cluster" --github-target-org "Polaris-InVehicleSoftware" --target-repo "kodiak-tools-cluster" --queue-only --target-repo-visibility private }
$RepoMigrations["kodiak-tools-cluster"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "libdbuswrapper" --github-target-org "Polaris-InVehicleSoftware" --target-repo "libdbuswrapper" --queue-only --target-repo-visibility private }
$RepoMigrations["libdbuswrapper"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vehicle-info" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vehicle-info" --queue-only --target-repo-visibility private }
$RepoMigrations["vehicle-info"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Ultimate_Helmet_Project" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Ultimate_Helmet_Project" --queue-only --target-repo-visibility private }
$RepoMigrations["Ultimate_Helmet_Project"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "CCU-CM-Tester" --github-target-org "Polaris-InVehicleSoftware" --target-repo "CCU-CM-Tester" --queue-only --target-repo-visibility private }
$RepoMigrations["CCU-CM-Tester"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Rendezvous_UI_Connectivity_Prototype_Project" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Rendezvous_UI_Connectivity_Prototype_Project" --queue-only --target-repo-visibility private }
$RepoMigrations["Rendezvous_UI_Connectivity_Prototype_Project"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "eolt-v2-data" --github-target-org "Polaris-InVehicleSoftware" --target-repo "eolt-v2-data" --queue-only --target-repo-visibility private }
$RepoMigrations["eolt-v2-data"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "IVI-Automation" --github-target-org "Polaris-InVehicleSoftware" --target-repo "IVI-Automation" --queue-only --target-repo-visibility private }
$RepoMigrations["IVI-Automation"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-libsnf" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-libsnf" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-libsnf"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ivi-remote-access" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ivi-remote-access" --queue-only --target-repo-visibility private }
$RepoMigrations["ivi-remote-access"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-ownersmanual" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-ownersmanual" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-ownersmanual"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Follow_Me_Project" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Follow_Me_Project" --queue-only --target-repo-visibility private }
$RepoMigrations["Follow_Me_Project"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "BD_SOUND" --github-target-org "Polaris-InVehicleSoftware" --target-repo "BD_SOUND" --queue-only --target-repo-visibility private }
$RepoMigrations["BD_SOUND"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "DSP_Concepts" --github-target-org "Polaris-InVehicleSoftware" --target-repo "DSP_Concepts" --queue-only --target-repo-visibility private }
$RepoMigrations["DSP_Concepts"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "mcuxpresso-toolchain" --github-target-org "Polaris-InVehicleSoftware" --target-repo "mcuxpresso-toolchain" --queue-only --target-repo-visibility private }
$RepoMigrations["mcuxpresso-toolchain"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-mobileoffice" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-mobileoffice" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-mobileoffice"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-commons" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-commons" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-commons"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ci_backup_scripts" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ci_backup_scripts" --queue-only --target-repo-visibility private }
$RepoMigrations["ci_backup_scripts"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-ev" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-ev" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-ev"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "imx_cst_tool" --github-target-org "Polaris-InVehicleSoftware" --target-repo "imx_cst_tool" --queue-only --target-repo-visibility private }
$RepoMigrations["imx_cst_tool"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-core" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-core" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-core"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "legendary-templates" --github-target-org "Polaris-InVehicleSoftware" --target-repo "legendary-templates" --queue-only --target-repo-visibility private }
$RepoMigrations["legendary-templates"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bbb-poke" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bbb-poke" --queue-only --target-repo-visibility private }
$RepoMigrations["bbb-poke"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "sentinel-demo" --github-target-org "Polaris-InVehicleSoftware" --target-repo "sentinel-demo" --queue-only --target-repo-visibility private }
$RepoMigrations["sentinel-demo"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtbase" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtbase" --queue-only --target-repo-visibility private }
$RepoMigrations["qtbase"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtdeclarative" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtdeclarative" --queue-only --target-repo-visibility private }
$RepoMigrations["qtdeclarative"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtgraphicaleffects" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtgraphicaleffects" --queue-only --target-repo-visibility private }
$RepoMigrations["qtgraphicaleffects"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtlocation" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtlocation" --queue-only --target-repo-visibility private }
$RepoMigrations["qtlocation"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtmultimedia" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtmultimedia" --queue-only --target-repo-visibility private }
$RepoMigrations["qtmultimedia"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtquickcontrols2" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtquickcontrols2" --queue-only --target-repo-visibility private }
$RepoMigrations["qtquickcontrols2"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtquickcontrols" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtquickcontrols" --queue-only --target-repo-visibility private }
$RepoMigrations["qtquickcontrols"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtserialport" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtserialport" --queue-only --target-repo-visibility private }
$RepoMigrations["qtserialport"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtsvg" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtsvg" --queue-only --target-repo-visibility private }
$RepoMigrations["qtsvg"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qttools" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qttools" --queue-only --target-repo-visibility private }
$RepoMigrations["qttools"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtvirtualkeyboard" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtvirtualkeyboard" --queue-only --target-repo-visibility private }
$RepoMigrations["qtvirtualkeyboard"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtwayland" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtwayland" --queue-only --target-repo-visibility private }
$RepoMigrations["qtwayland"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtxmlpatterns" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtxmlpatterns" --queue-only --target-repo-visibility private }
$RepoMigrations["qtxmlpatterns"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtconnectivity" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtconnectivity" --queue-only --target-repo-visibility private }
$RepoMigrations["qtconnectivity"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtlocation-mapboxgl" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtlocation-mapboxgl" --queue-only --target-repo-visibility private }
$RepoMigrations["qtlocation-mapboxgl"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qt3d" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qt3d" --queue-only --target-repo-visibility private }
$RepoMigrations["qt3d"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "EOLT-Documents" --github-target-org "Polaris-InVehicleSoftware" --target-repo "EOLT-Documents" --queue-only --target-repo-visibility private }
$RepoMigrations["EOLT-Documents"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-can-simulator" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-can-simulator" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-can-simulator"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtquick3d" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtquick3d" --queue-only --target-repo-visibility private }
$RepoMigrations["qtquick3d"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "sdbuswrapper-codegen" --github-target-org "Polaris-InVehicleSoftware" --target-repo "sdbuswrapper-codegen" --queue-only --target-repo-visibility private }
$RepoMigrations["sdbuswrapper-codegen"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-polaris" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-polaris" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-polaris"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bbb-hand-control" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bbb-hand-control" --queue-only --target-repo-visibility private }
$RepoMigrations["bbb-hand-control"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ttqaAutomation" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ttqaAutomation" --queue-only --target-repo-visibility private }
$RepoMigrations["ttqaAutomation"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-video-recorder" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-video-recorder" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-video-recorder"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "venus-docs" --github-target-org "Polaris-InVehicleSoftware" --target-repo "venus-docs" --queue-only --target-repo-visibility private }
$RepoMigrations["venus-docs"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_COMMON_SCM_Dynamix" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_COMMON_SCM_Dynamix" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_COMMON_SCM_Dynamix"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "test-profile-reconnector" --github-target-org "Polaris-InVehicleSoftware" --target-repo "test-profile-reconnector" --queue-only --target-repo-visibility private }
$RepoMigrations["test-profile-reconnector"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "manufacturing_software_utils" --github-target-org "Polaris-InVehicleSoftware" --target-repo "manufacturing_software_utils" --queue-only --target-repo-visibility private }
$RepoMigrations["manufacturing_software_utils"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "manufacturing_deployment_app" --github-target-org "Polaris-InVehicleSoftware" --target-repo "manufacturing_deployment_app" --queue-only --target-repo-visibility private }
$RepoMigrations["manufacturing_deployment_app"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "reset-manager" --github-target-org "Polaris-InVehicleSoftware" --target-repo "reset-manager" --queue-only --target-repo-visibility private }
$RepoMigrations["reset-manager"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_ASW_Tools" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_ASW_Tools" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_ASW_Tools"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "translation-checker" --github-target-org "Polaris-InVehicleSoftware" --target-repo "translation-checker" --queue-only --target-repo-visibility private }
$RepoMigrations["translation-checker"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "GithubAction_Test_Repo" --github-target-org "Polaris-InVehicleSoftware" --target-repo "GithubAction_Test_Repo" --queue-only --target-repo-visibility private }
$RepoMigrations["GithubAction_Test_Repo"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung-yocto-builder" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung-yocto-builder" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung-yocto-builder"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "IVI-Performance-Profiler" --github-target-org "Polaris-InVehicleSoftware" --target-repo "IVI-Performance-Profiler" --queue-only --target-repo-visibility private }
$RepoMigrations["IVI-Performance-Profiler"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung-src" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung-src" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung-src"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-samsung-old" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-samsung-old" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-samsung-old"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qtapplicationmanager" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qtapplicationmanager" --queue-only --target-repo-visibility private }
$RepoMigrations["qtapplicationmanager"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "qemu-erpc-firmware" --github-target-org "Polaris-InVehicleSoftware" --target-repo "qemu-erpc-firmware" --queue-only --target-repo-visibility private }
$RepoMigrations["qemu-erpc-firmware"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "DeploymentMonitor" --github-target-org "Polaris-InVehicleSoftware" --target-repo "DeploymentMonitor" --queue-only --target-repo-visibility private }
$RepoMigrations["DeploymentMonitor"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tata-project" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tata-project" --queue-only --target-repo-visibility private }
$RepoMigrations["tata-project"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_bin_security_exynostee" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_bin_security_exynostee" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_bin_security_exynostee"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_bl2-boot" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_bl2-boot" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_bl2-boot"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_boot-binary" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_boot-binary" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_boot-binary"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_fw_audio" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_fw_audio" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_fw_audio"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_fw_camera" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_fw_camera" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_fw_camera"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_fw_npu" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_fw_npu" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_fw_npu"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_fw_video" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_fw_video" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_fw_video"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_kernel" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_kernel" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_kernel"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_lib_camera_libcam" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_lib_camera_libcam" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_lib_camera_libcam"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_lib_gpu_libmali-linux" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_lib_gpu_libmali-linux" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_lib_gpu_libmali-linux"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_lib_gstreamer-plugins-exynos" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_lib_gstreamer-plugins-exynos" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_lib_gstreamer-plugins-exynos"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_lib_rendering" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_lib_rendering" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_lib_rendering"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_lib_video_openmax-linux" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_lib_video_openmax-linux" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_lib_video_openmax-linux"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_linux_bare_dts-orv" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_linux_bare_dts-orv" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_linux_bare_dts-orv"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_lk-boot" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_lk-boot" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_lk-boot"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-exynostee" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-exynostee" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-exynostee"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-samsung-bsp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-samsung-bsp" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-samsung-bsp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-samsung-externalsrc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-samsung-externalsrc" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-samsung-externalsrc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-samsung-orv" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-samsung-orv" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-samsung-orv"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-samsung-sec-auto" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-samsung-sec-auto" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-samsung-sec-auto"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_sfi_bin" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_sfi_bin" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_sfi_bin"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_sfi_bootloader" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_sfi_bootloader" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_sfi_bootloader"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_sfi_bootloader_script" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_sfi_bootloader_script" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_sfi_bootloader_script"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_sfi_cdd_testbench_script" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_sfi_cdd_testbench_script" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_sfi_cdd_testbench_script"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_sfi_freertos" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_sfi_freertos" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_sfi_freertos"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_test_audio_aboxTestApp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_test_audio_aboxTestApp" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_test_audio_aboxTestApp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_test_camera" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_test_camera" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_test_camera"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_test_rendering-tests" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_test_rendering-tests" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_test_rendering-tests"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_test_security-tests" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_test_security-tests" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_test_security-tests"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_test_video_omxutc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_test_video_omxutc" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_test_video_omxutc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_test_video_mfcutc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_test_video_mfcutc" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_test_video_mfcutc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_boottime-viewer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_boottime-viewer" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_boottime-viewer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_camera_NearSight" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_camera_NearSight" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_camera_NearSight"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_gangutils" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_gangutils" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_gangutils"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_partitiondump" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_partitiondump" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_partitiondump"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_pit-maker" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_pit-maker" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_pit-maker"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_ramdump" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_ramdump" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_ramdump"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_script" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_script" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_script"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-samsung" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-samsung" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-samsung"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_MRZR_VCU_Cyborg" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_MRZR_VCU_Cyborg" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_MRZR_VCU_Cyborg"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vehicle-proxy" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vehicle-proxy" --queue-only --target-repo-visibility private }
$RepoMigrations["vehicle-proxy"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "spotx-daemon" --github-target-org "Polaris-InVehicleSoftware" --target-repo "spotx-daemon" --queue-only --target-repo-visibility private }
$RepoMigrations["spotx-daemon"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_linux_bare_dts" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_linux_bare_dts" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_linux_bare_dts"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-concurrency" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-concurrency" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-concurrency"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "libPlatform" --github-target-org "Polaris-InVehicleSoftware" --target-repo "libPlatform" --queue-only --target-repo-visibility private }
$RepoMigrations["libPlatform"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RANGER_VCM_Posn1_PlowMode2-0" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RANGER_VCM_Posn1_PlowMode2-0" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RANGER_VCM_Posn1_PlowMode2-0"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RANGER_VCM_Posn1_CabPrecondition" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RANGER_VCM_Posn1_CabPrecondition" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RANGER_VCM_Posn1_CabPrecondition"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RANGER_VCM_Posn1_LightBarPWM" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RANGER_VCM_Posn1_LightBarPWM" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RANGER_VCM_Posn1_LightBarPWM"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Boilerplate_PCI_VCM_Gen3" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Boilerplate_PCI_VCM_Gen3" --queue-only --target-repo-visibility private }
$RepoMigrations["Boilerplate_PCI_VCM_Gen3"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_SPORTSMAN_DMC_Nebula" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_SPORTSMAN_DMC_Nebula" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_SPORTSMAN_DMC_Nebula"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ra6m5-vip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ra6m5-vip" --queue-only --target-repo-visibility private }
$RepoMigrations["ra6m5-vip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_MRZR_SGC_AlphaAutonomy" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_MRZR_SGC_AlphaAutonomy" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_MRZR_SGC_AlphaAutonomy"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "stm-cmost" --github-target-org "Polaris-InVehicleSoftware" --target-repo "stm-cmost" --queue-only --target-repo-visibility private }
$RepoMigrations["stm-cmost"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "audioweaver" --github-target-org "Polaris-InVehicleSoftware" --target-repo "audioweaver" --queue-only --target-repo-visibility private }
$RepoMigrations["audioweaver"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "linux-fslc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "linux-fslc" --queue-only --target-repo-visibility private }
$RepoMigrations["linux-fslc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "audiomanager-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "audiomanager-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["audiomanager-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "media-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "media-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["media-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-fmradio-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-fmradio-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-fmradio-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bluetooth-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bluetooth-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["bluetooth-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-carplay-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-carplay-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-carplay-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vehicle-services-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vehicle-services-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["vehicle-services-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "spdlog-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "spdlog-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["spdlog-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "health-monitor-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "health-monitor-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["health-monitor-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "devicemanager-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "devicemanager-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["devicemanager-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "common-projection-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "common-projection-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["common-projection-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "abrt-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "abrt-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["abrt-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "data-lib-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "data-lib-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["data-lib-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "data-gen-lib-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "data-gen-lib-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["data-gen-lib-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "vip-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "vip-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["vip-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bt-connection-service" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bt-connection-service" --queue-only --target-repo-visibility private }
$RepoMigrations["bt-connection-service"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "sentinel" --github-target-org "Polaris-InVehicleSoftware" --target-repo "sentinel" --queue-only --target-repo-visibility private }
$RepoMigrations["sentinel"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "satyr-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "satyr-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["satyr-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "libreport-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "libreport-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["libreport-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-common-infra-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-common-infra-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-common-infra-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_test_npu-tests" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_test_npu-tests" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_test_npu-tests"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_bin_security_el3_mon_exynostee" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_bin_security_el3_mon_exynostee" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_bin_security_el3_mon_exynostee"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_bin_security_ldfw" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_bin_security_ldfw" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_bin_security_ldfw"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_bin_security_keystorage" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_bin_security_keystorage" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_bin_security_keystorage"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_bin_security_tee_exynostee" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_bin_security_tee_exynostee" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_bin_security_tee_exynostee"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_fw_gpu" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_fw_gpu" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_fw_gpu"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_lib_libdrm" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_lib_libdrm" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_lib_libdrm"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_lib_gpu_sgpu-userspace" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_lib_gpu_sgpu-userspace" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_lib_gpu_sgpu-userspace"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_pit-binary-maker" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_pit-binary-maker" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_pit-binary-maker"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_security_app-maker" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_security_app-maker" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_security_app-maker"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_eub" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_eub" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_eub"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_flash" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_flash" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_flash"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_multidownloader" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_multidownloader" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_multidownloader"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_security_ree_exynostee" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_security_ree_exynostee" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_security_ree_exynostee"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_variant_orv" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_variant_orv" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_variant_orv"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_lib_npu" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_lib_npu" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_lib_npu"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-ccu2-dbus-api" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-ccu2-dbus-api" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-ccu2-dbus-api"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-helpcall" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-helpcall" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-helpcall"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ktm-telemetry" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ktm-telemetry" --queue-only --target-repo-visibility private }
$RepoMigrations["ktm-telemetry"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "prpc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "prpc" --queue-only --target-repo-visibility private }
$RepoMigrations["prpc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-pulseaudio-modules" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-pulseaudio-modules" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-pulseaudio-modules"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "robot-test-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "robot-test-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["robot-test-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_RANGER_VCM_Cronus" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_RANGER_VCM_Cronus" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_RANGER_VCM_Cronus"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "map_loader_webservice" --github-target-org "Polaris-InVehicleSoftware" --target-repo "map_loader_webservice" --queue-only --target-repo-visibility private }
$RepoMigrations["map_loader_webservice"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_INDIAN_VCM_Posn1_Raptor" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_INDIAN_VCM_Posn1_Raptor" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_INDIAN_VCM_Posn1_Raptor"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_INDIAN_VCM_Posn1_Carbide" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_INDIAN_VCM_Posn1_Carbide" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_INDIAN_VCM_Posn1_Carbide"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_INDIAN_VCM_Posn2_Raptor" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_INDIAN_VCM_Posn2_Raptor" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_INDIAN_VCM_Posn2_Raptor"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "variant-config-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "variant-config-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["variant-config-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "gh-pages" --github-target-org "Polaris-InVehicleSoftware" --target-repo "gh-pages" --queue-only --target-repo-visibility private }
$RepoMigrations["gh-pages"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "sfi_rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "sfi_rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["sfi_rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tcu-contract-tests" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tcu-contract-tests" --queue-only --target-repo-visibility private }
$RepoMigrations["tcu-contract-tests"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "mfi-auth-server" --github-target-org "Polaris-InVehicleSoftware" --target-repo "mfi-auth-server" --queue-only --target-repo-visibility private }
$RepoMigrations["mfi-auth-server"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "geodata" --github-target-org "Polaris-InVehicleSoftware" --target-repo "geodata" --queue-only --target-repo-visibility private }
$RepoMigrations["geodata"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "audio-hal" --github-target-org "Polaris-InVehicleSoftware" --target-repo "audio-hal" --queue-only --target-repo-visibility private }
$RepoMigrations["audio-hal"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_SLINGSHOT_VCM_Posn1_Trebuchet" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_SLINGSHOT_VCM_Posn1_Trebuchet" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_SLINGSHOT_VCM_Posn1_Trebuchet"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_RANGER_VCM_Posn1_Loki" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_RANGER_VCM_Posn1_Loki" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_RANGER_VCM_Posn1_Loki"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_RANGER_VCM_Posn2_Loki" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_RANGER_VCM_Posn2_Loki" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_RANGER_VCM_Posn2_Loki"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_RANGER_VCM_Phantom" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_RANGER_VCM_Phantom" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_RANGER_VCM_Phantom"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "apple-mfid-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "apple-mfid-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["apple-mfid-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "lib-apple-commplugin" --github-target-org "Polaris-InVehicleSoftware" --target-repo "lib-apple-commplugin" --queue-only --target-repo-visibility private }
$RepoMigrations["lib-apple-commplugin"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "sfI-linux-chardev-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "sfI-linux-chardev-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["sfI-linux-chardev-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "WindowsGUIAppSetHardwareID" --github-target-org "Polaris-InVehicleSoftware" --target-repo "WindowsGUIAppSetHardwareID" --queue-only --target-repo-visibility private }
$RepoMigrations["WindowsGUIAppSetHardwareID"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "WindowsCommandLineSetHardwareID" --github-target-org "Polaris-InVehicleSoftware" --target-repo "WindowsCommandLineSetHardwareID" --queue-only --target-repo-visibility private }
$RepoMigrations["WindowsCommandLineSetHardwareID"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VIP-Interface" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VIP-Interface" --queue-only --target-repo-visibility private }
$RepoMigrations["VIP-Interface"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VIP-ERPC" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VIP-ERPC" --queue-only --target-repo-visibility private }
$RepoMigrations["VIP-ERPC"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bluetooth-connection-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bluetooth-connection-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["bluetooth-connection-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bluetooth-telephony-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bluetooth-telephony-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["bluetooth-telephony-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bluetooth-phonebook-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bluetooth-phonebook-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["bluetooth-phonebook-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bluetooth-message-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bluetooth-message-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["bluetooth-message-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VS-SFI-VIP-Linux_Code" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VS-SFI-VIP-Linux_Code" --queue-only --target-repo-visibility private }
$RepoMigrations["VS-SFI-VIP-Linux_Code"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_COMMON_VCM_Thor" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_COMMON_VCM_Thor" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_COMMON_VCM_Thor"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_INDIAN_VCM_Posn3_RaptorMY24" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_INDIAN_VCM_Posn3_RaptorMY24" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_INDIAN_VCM_Posn3_RaptorMY24"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "erpc-interfaces" --github-target-org "Polaris-InVehicleSoftware" --target-repo "erpc-interfaces" --queue-only --target-repo-visibility private }
$RepoMigrations["erpc-interfaces"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_PII_Example" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_PII_Example" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_PII_Example"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_COMMON_HCSM_HeatedCooledSeat" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_COMMON_HCSM_HeatedCooledSeat" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_COMMON_HCSM_HeatedCooledSeat"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-localization" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-localization" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-localization"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-mapbox-sdk" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-mapbox-sdk" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-mapbox-sdk"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "samsung_tool_camera_TuneSight" --github-target-org "Polaris-InVehicleSoftware" --target-repo "samsung_tool_camera_TuneSight" --queue-only --target-repo-visibility private }
$RepoMigrations["samsung_tool_camera_TuneSight"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "actions-playground" --github-target-org "Polaris-InVehicleSoftware" --target-repo "actions-playground" --queue-only --target-repo-visibility private }
$RepoMigrations["actions-playground"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-persistence" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-persistence" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-persistence"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "serial-block-transfer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "serial-block-transfer" --queue-only --target-repo-visibility private }
$RepoMigrations["serial-block-transfer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RANGER_GCM_ZeroePTChargerGateway" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RANGER_GCM_ZeroePTChargerGateway" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RANGER_GCM_ZeroePTChargerGateway"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "harman-swm-client-agent" --github-target-org "Polaris-InVehicleSoftware" --target-repo "harman-swm-client-agent" --queue-only --target-repo-visibility private }
$RepoMigrations["harman-swm-client-agent"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "TTM" --github-target-org "Polaris-InVehicleSoftware" --target-repo "TTM" --queue-only --target-repo-visibility private }
$RepoMigrations["TTM"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_SLINGSHOT_VCM_Posn1_TrebuchetClearNVM" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_SLINGSHOT_VCM_Posn1_TrebuchetClearNVM" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_SLINGSHOT_VCM_Posn1_TrebuchetClearNVM"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RANGER_ePCM_StarterGenerator" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RANGER_ePCM_StarterGenerator" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RANGER_ePCM_StarterGenerator"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_INDIAN_VCM_Posn3_RaptorMY25" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_INDIAN_VCM_Posn3_RaptorMY25" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_INDIAN_VCM_Posn3_RaptorMY25"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_INDIAN_VCM_Mustang" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_INDIAN_VCM_Mustang" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_INDIAN_VCM_Mustang"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Boilerplate_PCI_VCM_Gen2-1" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Boilerplate_PCI_VCM_Gen2-1" --queue-only --target-repo-visibility private }
$RepoMigrations["Boilerplate_PCI_VCM_Gen2-1"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_VCM_GhostRider" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_VCM_GhostRider" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_VCM_GhostRider"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "redsea" --github-target-org "Polaris-InVehicleSoftware" --target-repo "redsea" --queue-only --target-repo-visibility private }
$RepoMigrations["redsea"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ubxfwupdate" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ubxfwupdate" --queue-only --target-repo-visibility private }
$RepoMigrations["ubxfwupdate"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "BSW_PCI_VCM_Gen2-1" --github-target-org "Polaris-InVehicleSoftware" --target-repo "BSW_PCI_VCM_Gen2-1" --queue-only --target-repo-visibility private }
$RepoMigrations["BSW_PCI_VCM_Gen2-1"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Tools_PCI" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Tools_PCI" --queue-only --target-repo-visibility private }
$RepoMigrations["Tools_PCI"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Boilerplate_PKT_SCM" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Boilerplate_PKT_SCM" --queue-only --target-repo-visibility private }
$RepoMigrations["Boilerplate_PKT_SCM"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-tcudetection" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-tcudetection" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-tcudetection"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "BSW_PCI_VCM_Gen3" --github-target-org "Polaris-InVehicleSoftware" --target-repo "BSW_PCI_VCM_Gen3" --queue-only --target-repo-visibility private }
$RepoMigrations["BSW_PCI_VCM_Gen3"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "c2b-fw" --github-target-org "Polaris-InVehicleSoftware" --target-repo "c2b-fw" --queue-only --target-repo-visibility private }
$RepoMigrations["c2b-fw"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-tuner-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-tuner-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-tuner-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_INDIAN_VCM_Posn4_Raptor" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_INDIAN_VCM_Posn4_Raptor" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_INDIAN_VCM_Posn4_Raptor"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ccu2_build" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ccu2_build" --queue-only --target-repo-visibility private }
$RepoMigrations["ccu2_build"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-tt-ccu" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-tt-ccu" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-tt-ccu"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "meta-tt-atmel" --github-target-org "Polaris-InVehicleSoftware" --target-repo "meta-tt-atmel" --queue-only --target-repo-visibility private }
$RepoMigrations["meta-tt-atmel"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Line-F-Code" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Line-F-Code" --queue-only --target-repo-visibility private }
$RepoMigrations["Line-F-Code"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "BeagleBoardEOLTCode" --github-target-org "Polaris-InVehicleSoftware" --target-repo "BeagleBoardEOLTCode" --queue-only --target-repo-visibility private }
$RepoMigrations["BeagleBoardEOLTCode"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_ePCM_Frontier" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_ePCM_Frontier" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_ePCM_Frontier"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "speaker-hal" --github-target-org "Polaris-InVehicleSoftware" --target-repo "speaker-hal" --queue-only --target-repo-visibility private }
$RepoMigrations["speaker-hal"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Tools_PKT" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Tools_PKT" --queue-only --target-repo-visibility private }
$RepoMigrations["Tools_PKT"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "BSW_PKT_SCM" --github-target-org "Polaris-InVehicleSoftware" --target-repo "BSW_PKT_SCM" --queue-only --target-repo-visibility private }
$RepoMigrations["BSW_PKT_SCM"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "pulseaudio" --github-target-org "Polaris-InVehicleSoftware" --target-repo "pulseaudio" --queue-only --target-repo-visibility private }
$RepoMigrations["pulseaudio"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "FreeRTOS-Kernel" --github-target-org "Polaris-InVehicleSoftware" --target-repo "FreeRTOS-Kernel" --queue-only --target-repo-visibility public }
$RepoMigrations["FreeRTOS-Kernel"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-vcard-parser" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-vcard-parser" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-vcard-parser"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_GENERAL_TCM_AdmiralpCVT" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_GENERAL_TCM_AdmiralpCVT" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_GENERAL_TCM_AdmiralpCVT"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-universal-buttons" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-universal-buttons" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-universal-buttons"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-bt-audio" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-bt-audio" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-bt-audio"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_MRZR_GCM_AlphaHybridGenerator" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_MRZR_GCM_AlphaHybridGenerator" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_MRZR_GCM_AlphaHybridGenerator"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "radio-complianced" --github-target-org "Polaris-InVehicleSoftware" --target-repo "radio-complianced" --queue-only --target-repo-visibility private }
$RepoMigrations["radio-complianced"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_VES2024_Minigolf" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_VES2024_Minigolf" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_VES2024_Minigolf"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Boilerplate_OEH" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Boilerplate_OEH" --queue-only --target-repo-visibility private }
$RepoMigrations["Boilerplate_OEH"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ves-ops-tf-grunt" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ves-ops-tf-grunt" --queue-only --target-repo-visibility private }
$RepoMigrations["ves-ops-tf-grunt"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ves-ops-tf-poc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ves-ops-tf-poc" --queue-only --target-repo-visibility private }
$RepoMigrations["ves-ops-tf-poc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_MomentaryWiper" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_MomentaryWiper" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_MomentaryWiper"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_LeanAngleLearn" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_LeanAngleLearn" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_LeanAngleLearn"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_INDIAN_VCM_Posn1_RaptorMY24" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_INDIAN_VCM_Posn1_RaptorMY24" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_INDIAN_VCM_Posn1_RaptorMY24"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ves-ops-tf-modules" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ves-ops-tf-modules" --queue-only --target-repo-visibility private }
$RepoMigrations["ves-ops-tf-modules"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "CommonApp-KitchenSink" --github-target-org "Polaris-InVehicleSoftware" --target-repo "CommonApp-KitchenSink" --queue-only --target-repo-visibility private }
$RepoMigrations["CommonApp-KitchenSink"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "CronusHydraulicEcosystem" --github-target-org "Polaris-InVehicleSoftware" --target-repo "CronusHydraulicEcosystem" --queue-only --target-repo-visibility private }
$RepoMigrations["CronusHydraulicEcosystem"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "SANDBOX" --github-target-org "Polaris-InVehicleSoftware" --target-repo "SANDBOX" --queue-only --target-repo-visibility private }
$RepoMigrations["SANDBOX"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_COMMON_MBB_BMU_Thor_Loki" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_COMMON_MBB_BMU_Thor_Loki" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_COMMON_MBB_BMU_Thor_Loki"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-localization-sub" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-localization-sub" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-localization-sub"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ves-ops-template" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ves-ops-template" --queue-only --target-repo-visibility private }
$RepoMigrations["ves-ops-template"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_COMMON_HECU_CutterBrake" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_COMMON_HECU_CutterBrake" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_COMMON_HECU_CutterBrake"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Tools_CNT" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Tools_CNT" --queue-only --target-repo-visibility private }
$RepoMigrations["Tools_CNT"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_INDIAN_VCM_AdpvRideHei" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_INDIAN_VCM_AdpvRideHei" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_INDIAN_VCM_AdpvRideHei"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_SCM_HydraulicEcosystem" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_SCM_HydraulicEcosystem" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_SCM_HydraulicEcosystem"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Boilerplate_PKT_P300Q" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Boilerplate_PKT_P300Q" --queue-only --target-repo-visibility private }
$RepoMigrations["Boilerplate_PKT_P300Q"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "BSW_PKT_P300Q" --github-target-org "Polaris-InVehicleSoftware" --target-repo "BSW_PKT_P300Q" --queue-only --target-repo-visibility private }
$RepoMigrations["BSW_PKT_P300Q"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "DeployerApp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "DeployerApp" --queue-only --target-repo-visibility private }
$RepoMigrations["DeployerApp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "recover_units" --github-target-org "Polaris-InVehicleSoftware" --target-repo "recover_units" --queue-only --target-repo-visibility private }
$RepoMigrations["recover_units"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ves-ops-action-runner" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ves-ops-action-runner" --queue-only --target-repo-visibility private }
$RepoMigrations["ves-ops-action-runner"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "bluez" --github-target-org "Polaris-InVehicleSoftware" --target-repo "bluez" --queue-only --target-repo-visibility private }
$RepoMigrations["bluez"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "secureboot" --github-target-org "Polaris-InVehicleSoftware" --target-repo "secureboot" --queue-only --target-repo-visibility private }
$RepoMigrations["secureboot"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_SCM_GenericCurrentController" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_SCM_GenericCurrentController" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_SCM_GenericCurrentController"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RZR_SmartBlend" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RZR_SmartBlend" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RZR_SmartBlend"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ivi-architecture" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ivi-architecture" --queue-only --target-repo-visibility private }
$RepoMigrations["ivi-architecture"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "koala" --github-target-org "Polaris-InVehicleSoftware" --target-repo "koala" --queue-only --target-repo-visibility private }
$RepoMigrations["koala"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_RANGER_VCM_Posn1_Thor_MY23_MY24" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_RANGER_VCM_Posn1_Thor_MY23_MY24" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_RANGER_VCM_Posn1_Thor_MY23_MY24"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-universal-buttons-tester" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-universal-buttons-tester" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-universal-buttons-tester"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "mwr-devops-playground" --github-target-org "Polaris-InVehicleSoftware" --target-repo "mwr-devops-playground" --queue-only --target-repo-visibility private }
$RepoMigrations["mwr-devops-playground"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-ublx" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-ublx" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-ublx"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RANGER_AMP" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RANGER_AMP" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RANGER_AMP"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_VSMPriority" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_VSMPriority" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_VSMPriority"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "janus" --github-target-org "Polaris-InVehicleSoftware" --target-repo "janus" --queue-only --target-repo-visibility private }
$RepoMigrations["janus"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "devops-test" --github-target-org "Polaris-InVehicleSoftware" --target-repo "devops-test" --queue-only --target-repo-visibility private }
$RepoMigrations["devops-test"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "DesktopSupport" --github-target-org "Polaris-InVehicleSoftware" --target-repo "DesktopSupport" --queue-only --target-repo-visibility private }
$RepoMigrations["DesktopSupport"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-universal-buttons-tester-depricated" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-universal-buttons-tester-depricated" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-universal-buttons-tester-depricated"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_Horn" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_Horn" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_Horn"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Tools_BCH" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Tools_BCH" --queue-only --target-repo-visibility private }
$RepoMigrations["Tools_BCH"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RANGER_AMPbatt" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RANGER_AMPbatt" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RANGER_AMPbatt"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_BoschSharingPoc" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_BoschSharingPoc" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_BoschSharingPoc"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_VCM_Gen3_CronusEnablement" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_VCM_Gen3_CronusEnablement" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_VCM_Gen3_CronusEnablement"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Tools_OEH" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Tools_OEH" --queue-only --target-repo-visibility private }
$RepoMigrations["Tools_OEH"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_Headlight" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_Headlight" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_Headlight"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_B1C4_APP" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_B1C4_APP" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_B1C4_APP"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_MotorCycle_ePCM_eReverse" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_MotorCycle_ePCM_eReverse" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_MotorCycle_ePCM_eReverse"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "versioning" --github-target-org "Polaris-InVehicleSoftware" --target-repo "versioning" --queue-only --target-repo-visibility private }
$RepoMigrations["versioning"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_GATEWAY_M110" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_GATEWAY_M110" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_GATEWAY_M110"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-BLE-server" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-BLE-server" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-BLE-server"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-qt-builder" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-qt-builder" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-qt-builder"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "docker-base" --github-target-org "Polaris-InVehicleSoftware" --target-repo "docker-base" --queue-only --target-repo-visibility internal }
$RepoMigrations["docker-base"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "action-release-action" --github-target-org "Polaris-InVehicleSoftware" --target-repo "action-release-action" --queue-only --target-repo-visibility private }
$RepoMigrations["action-release-action"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "action-composite-action-template" --github-target-org "Polaris-InVehicleSoftware" --target-repo "action-composite-action-template" --queue-only --target-repo-visibility private }
$RepoMigrations["action-composite-action-template"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "action-manual-version-bump" --github-target-org "Polaris-InVehicleSoftware" --target-repo "action-manual-version-bump" --queue-only --target-repo-visibility private }
$RepoMigrations["action-manual-version-bump"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCIPLogAnalysis" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCIPLogAnalysis" --queue-only --target-repo-visibility private }
$RepoMigrations["RCIPLogAnalysis"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "action-github-tag-action" --github-target-org "Polaris-InVehicleSoftware" --target-repo "action-github-tag-action" --queue-only --target-repo-visibility private }
$RepoMigrations["action-github-tag-action"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RZR_GCM_AST" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RZR_GCM_AST" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RZR_GCM_AST"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-thermald" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-thermald" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-thermald"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "gopro" --github-target-org "Polaris-InVehicleSoftware" --target-repo "gopro" --queue-only --target-repo-visibility private }
$RepoMigrations["gopro"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_LoadShed" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_LoadShed" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_LoadShed"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "comtech-nav-ltk" --github-target-org "Polaris-InVehicleSoftware" --target-repo "comtech-nav-ltk" --queue-only --target-repo-visibility private }
$RepoMigrations["comtech-nav-ltk"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_DarkMode" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_DarkMode" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_DarkMode"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "comtech-ltk-adaptor" --github-target-org "Polaris-InVehicleSoftware" --target-repo "comtech-ltk-adaptor" --queue-only --target-repo-visibility private }
$RepoMigrations["comtech-ltk-adaptor"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_Immobilizer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_Immobilizer" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_Immobilizer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "devops_playground" --github-target-org "Polaris-InVehicleSoftware" --target-repo "devops_playground" --queue-only --target-repo-visibility private }
$RepoMigrations["devops_playground"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_EngineStartControl" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_EngineStartControl" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_EngineStartControl"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "settime_webservice" --github-target-org "Polaris-InVehicleSoftware" --target-repo "settime_webservice" --queue-only --target-repo-visibility private }
$RepoMigrations["settime_webservice"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "SetHardwareID" --github-target-org "Polaris-InVehicleSoftware" --target-repo "SetHardwareID" --queue-only --target-repo-visibility private }
$RepoMigrations["SetHardwareID"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "hardware_id_publisher" --github-target-org "Polaris-InVehicleSoftware" --target-repo "hardware_id_publisher" --queue-only --target-repo-visibility private }
$RepoMigrations["hardware_id_publisher"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "camera-service-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "camera-service-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["camera-service-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ci-templates" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ci-templates" --queue-only --target-repo-visibility internal }
$RepoMigrations["ci-templates"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "finalizer" --github-target-org "Polaris-InVehicleSoftware" --target-repo "finalizer" --queue-only --target-repo-visibility private }
$RepoMigrations["finalizer"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_SKIM" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_SKIM" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_SKIM"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "recover_units_v2" --github-target-org "Polaris-InVehicleSoftware" --target-repo "recover_units_v2" --queue-only --target-repo-visibility private }
$RepoMigrations["recover_units_v2"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "comtech-polarispoitool" --github-target-org "Polaris-InVehicleSoftware" --target-repo "comtech-polarispoitool" --queue-only --target-repo-visibility private }
$RepoMigrations["comtech-polarispoitool"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "comtech-polarispoiscript" --github-target-org "Polaris-InVehicleSoftware" --target-repo "comtech-polarispoiscript" --queue-only --target-repo-visibility private }
$RepoMigrations["comtech-polarispoiscript"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_WakeLineControl" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_WakeLineControl" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_WakeLineControl"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_InternalStateControl" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_InternalStateControl" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_InternalStateControl"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_IlluminationBrightnessSetting" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_IlluminationBrightnessSetting" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_IlluminationBrightnessSetting"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "koala-builder" --github-target-org "Polaris-InVehicleSoftware" --target-repo "koala-builder" --queue-only --target-repo-visibility private }
$RepoMigrations["koala-builder"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_BlindSpotDetection" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_BlindSpotDetection" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_BlindSpotDetection"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "yocto-builder" --github-target-org "Polaris-InVehicleSoftware" --target-repo "yocto-builder" --queue-only --target-repo-visibility private }
$RepoMigrations["yocto-builder"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "yocto-package-version-finder" --github-target-org "Polaris-InVehicleSoftware" --target-repo "yocto-package-version-finder" --queue-only --target-repo-visibility private }
$RepoMigrations["yocto-package-version-finder"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_COMMON_GVCM_CRONUS" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_COMMON_GVCM_CRONUS" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_COMMON_GVCM_CRONUS"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_BatterySaver" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_BatterySaver" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_BatterySaver"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "python-utils" --github-target-org "Polaris-InVehicleSoftware" --target-repo "python-utils" --queue-only --target-repo-visibility internal }
$RepoMigrations["python-utils"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Boilerplate_PCI_VCM_Gen2-1_Git_Runner" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Boilerplate_PCI_VCM_Gen2-1_Git_Runner" --queue-only --target-repo-visibility private }
$RepoMigrations["Boilerplate_PCI_VCM_Gen2-1_Git_Runner"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Appareo-TCU" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Appareo-TCU" --queue-only --target-repo-visibility private }
$RepoMigrations["Appareo-TCU"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_NSftyWarn" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_NSftyWarn" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_NSftyWarn"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_RANGER_AMP_M130" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_RANGER_AMP_M130" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_RANGER_AMP_M130"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "MBD_YML" --github-target-org "Polaris-InVehicleSoftware" --target-repo "MBD_YML" --queue-only --target-repo-visibility private }
$RepoMigrations["MBD_YML"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_VCM_Posn1_Driveline_Modes" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_VCM_Posn1_Driveline_Modes" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_VCM_Posn1_Driveline_Modes"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "variant_manager" --github-target-org "Polaris-InVehicleSoftware" --target-repo "variant_manager" --queue-only --target-repo-visibility private }
$RepoMigrations["variant_manager"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "dev-input-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "dev-input-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["dev-input-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCP_COMMON_BCM_Mauler" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCP_COMMON_BCM_Mauler" --queue-only --target-repo-visibility private }
$RepoMigrations["RCP_COMMON_BCM_Mauler"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "android-auto" --github-target-org "Polaris-InVehicleSoftware" --target-repo "android-auto" --queue-only --target-repo-visibility private }
$RepoMigrations["android-auto"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "weblink" --github-target-org "Polaris-InVehicleSoftware" --target-repo "weblink" --queue-only --target-repo-visibility private }
$RepoMigrations["weblink"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "rcip-flash-util" --github-target-org "Polaris-InVehicleSoftware" --target-repo "rcip-flash-util" --queue-only --target-repo-visibility private }
$RepoMigrations["rcip-flash-util"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_DrvLnMode" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_DrvLnMode" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_DrvLnMode"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "IaC_NewLargeRunner" --github-target-org "Polaris-InVehicleSoftware" --target-repo "IaC_NewLargeRunner" --queue-only --target-repo-visibility private }
$RepoMigrations["IaC_NewLargeRunner"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Flash_utility" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Flash_utility" --queue-only --target-repo-visibility private }
$RepoMigrations["Flash_utility"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Boilerplate_PKT_VCM_v2_2" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Boilerplate_PKT_VCM_v2_2" --queue-only --target-repo-visibility private }
$RepoMigrations["Boilerplate_PKT_VCM_v2_2"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "BSW_PKT_VCM_v2_2" --github-target-org "Polaris-InVehicleSoftware" --target-repo "BSW_PKT_VCM_v2_2" --queue-only --target-repo-visibility private }
$RepoMigrations["BSW_PKT_VCM_v2_2"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "Automation-script-next-gen" --github-target-org "Polaris-InVehicleSoftware" --target-repo "Automation-script-next-gen" --queue-only --target-repo-visibility private }
$RepoMigrations["Automation-script-next-gen"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_COMMOM_PKTCM_NoRunApp" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_COMMOM_PKTCM_NoRunApp" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_COMMOM_PKTCM_NoRunApp"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-exynos-keystore" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-exynos-keystore" --queue-only --target-repo-visibility internal }
$RepoMigrations["polaris-exynos-keystore"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "yocto-build-utilities" --github-target-org "Polaris-InVehicleSoftware" --target-repo "yocto-build-utilities" --queue-only --target-repo-visibility private }
$RepoMigrations["yocto-build-utilities"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "tel_cybersecurity" --github-target-org "Polaris-InVehicleSoftware" --target-repo "tel_cybersecurity" --queue-only --target-repo-visibility private }
$RepoMigrations["tel_cybersecurity"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "pub-fct" --github-target-org "Polaris-InVehicleSoftware" --target-repo "pub-fct" --queue-only --target-repo-visibility private }
$RepoMigrations["pub-fct"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "RCIP_EOLT" --github-target-org "Polaris-InVehicleSoftware" --target-repo "RCIP_EOLT" --queue-only --target-repo-visibility private }
$RepoMigrations["RCIP_EOLT"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "PROD_INDIAN_Pektron_Posn1_Carbide" --github-target-org "Polaris-InVehicleSoftware" --target-repo "PROD_INDIAN_Pektron_Posn1_Carbide" --queue-only --target-repo-visibility private }
$RepoMigrations["PROD_INDIAN_Pektron_Posn1_Carbide"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "TPMS" --github-target-org "Polaris-InVehicleSoftware" --target-repo "TPMS" --queue-only --target-repo-visibility private }
$RepoMigrations["TPMS"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "polaris-privacy-logger-rcip" --github-target-org "Polaris-InVehicleSoftware" --target-repo "polaris-privacy-logger-rcip" --queue-only --target-repo-visibility private }
$RepoMigrations["polaris-privacy-logger-rcip"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "settime" --github-target-org "Polaris-InVehicleSoftware" --target-repo "settime" --queue-only --target-repo-visibility private }
$RepoMigrations["settime"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "VC_HCSM" --github-target-org "Polaris-InVehicleSoftware" --target-repo "VC_HCSM" --queue-only --target-repo-visibility private }
$RepoMigrations["VC_HCSM"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "ScannerWatchdog" --github-target-org "Polaris-InVehicleSoftware" --target-repo "ScannerWatchdog" --queue-only --target-repo-visibility private }
$RepoMigrations["ScannerWatchdog"] = $MigrationID

$MigrationID = ExecAndGetMigrationID { gh gei migrate-repo --github-source-org "Trail-Tech" --source-repo "BluetoothWatcher" --github-target-org "Polaris-InVehicleSoftware" --target-repo "BluetoothWatcher" --queue-only --target-repo-visibility private }
$RepoMigrations["BluetoothWatcher"] = $MigrationID


# =========== Waiting for all migrations to finish for Organization: Trail-Tech ===========

if ($RepoMigrations["vpro_bluetooth_qt_demo"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vpro_bluetooth_qt_demo"] }
if ($RepoMigrations["vpro_bluetooth_qt_demo"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ti-cc1120"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ti-cc1120"] }
if ($RepoMigrations["ti-cc1120"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt_robot_test"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt_robot_test"] }
if ($RepoMigrations["tt_robot_test"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vpro-hmi"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vpro-hmi"] }
if ($RepoMigrations["vpro-hmi"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-trailtech"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-trailtech"] }
if ($RepoMigrations["meta-trailtech"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VoyagerPro"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VoyagerPro"] }
if ($RepoMigrations["VoyagerPro"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["buddy-tracking"]) { gh gei wait-for-migration --migration-id $RepoMigrations["buddy-tracking"] }
if ($RepoMigrations["buddy-tracking"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["navit"]) { gh gei wait-for-migration --migration-id $RepoMigrations["navit"] }
if ($RepoMigrations["navit"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-kl03z-standalone"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-kl03z-standalone"] }
if ($RepoMigrations["tt-kl03z-standalone"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-hx8357"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-hx8357"] }
if ($RepoMigrations["tt-hx8357"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vpro-data"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vpro-data"] }
if ($RepoMigrations["vpro-data"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vpro-styles"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vpro-styles"] }
if ($RepoMigrations["vpro-styles"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-se868v3"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-se868v3"] }
if ($RepoMigrations["tt-se868v3"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-gpio-ctrl"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-gpio-ctrl"] }
if ($RepoMigrations["tt-gpio-ctrl"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["pyvehicle"]) { gh gei wait-for-migration --migration-id $RepoMigrations["pyvehicle"] }
if ($RepoMigrations["pyvehicle"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vpro-arm0"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vpro-arm0"] }
if ($RepoMigrations["vpro-arm0"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["d1rtos"]) { gh gei wait-for-migration --migration-id $RepoMigrations["d1rtos"] }
if ($RepoMigrations["d1rtos"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["libvehicle"]) { gh gei wait-for-migration --migration-id $RepoMigrations["libvehicle"] }
if ($RepoMigrations["libvehicle"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["docker_build_environment"]) { gh gei wait-for-migration --migration-id $RepoMigrations["docker_build_environment"] }
if ($RepoMigrations["docker_build_environment"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["benchmark-info"]) { gh gei wait-for-migration --migration-id $RepoMigrations["benchmark-info"] }
if ($RepoMigrations["benchmark-info"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-hmi"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-hmi"] }
if ($RepoMigrations["polaris-hmi"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["gopro-wsdk"]) { gh gei wait-for-migration --migration-id $RepoMigrations["gopro-wsdk"] }
if ($RepoMigrations["gopro-wsdk"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vpro-arm0-version"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vpro-arm0-version"] }
if ($RepoMigrations["vpro-arm0-version"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["voyager-mapping"]) { gh gei wait-for-migration --migration-id $RepoMigrations["voyager-mapping"] }
if ($RepoMigrations["voyager-mapping"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["snippets"]) { gh gei wait-for-migration --migration-id $RepoMigrations["snippets"] }
if ($RepoMigrations["snippets"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-audio"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-audio"] }
if ($RepoMigrations["polaris-audio"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ST-Voyager-app"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ST-Voyager-app"] }
if ($RepoMigrations["ST-Voyager-app"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["distribution"]) { gh gei wait-for-migration --migration-id $RepoMigrations["distribution"] }
if ($RepoMigrations["distribution"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["gopro-poc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["gopro-poc"] }
if ($RepoMigrations["gopro-poc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Polaris_Production_Software_v2"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Polaris_Production_Software_v2"] }
if ($RepoMigrations["Polaris_Production_Software_v2"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["B1C4_Board_Tester"]) { gh gei wait-for-migration --migration-id $RepoMigrations["B1C4_Board_Tester"] }
if ($RepoMigrations["B1C4_Board_Tester"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["GoProConnect"]) { gh gei wait-for-migration --migration-id $RepoMigrations["GoProConnect"] }
if ($RepoMigrations["GoProConnect"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["mapbox-gl-native"]) { gh gei wait-for-migration --migration-id $RepoMigrations["mapbox-gl-native"] }
if ($RepoMigrations["mapbox-gl-native"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["test"]) { gh gei wait-for-migration --migration-id $RepoMigrations["test"] }
if ($RepoMigrations["test"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["orv-refactor"]) { gh gei wait-for-migration --migration-id $RepoMigrations["orv-refactor"] }
if ($RepoMigrations["orv-refactor"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ExecTest"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ExecTest"] }
if ($RepoMigrations["ExecTest"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["lps22hb-input"]) { gh gei wait-for-migration --migration-id $RepoMigrations["lps22hb-input"] }
if ($RepoMigrations["lps22hb-input"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["B1_ATV_Youth_Cypress_BLE_Module"]) { gh gei wait-for-migration --migration-id $RepoMigrations["B1_ATV_Youth_Cypress_BLE_Module"] }
if ($RepoMigrations["B1_ATV_Youth_Cypress_BLE_Module"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["B1_Cypress_CyBLE_Demo"]) { gh gei wait-for-migration --migration-id $RepoMigrations["B1_Cypress_CyBLE_Demo"] }
if ($RepoMigrations["B1_Cypress_CyBLE_Demo"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["venus-hmi"]) { gh gei wait-for-migration --migration-id $RepoMigrations["venus-hmi"] }
if ($RepoMigrations["venus-hmi"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-venus"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-venus"] }
if ($RepoMigrations["meta-venus"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["EngineeringNode"]) { gh gei wait-for-migration --migration-id $RepoMigrations["EngineeringNode"] }
if ($RepoMigrations["EngineeringNode"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RideCommand"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RideCommand"] }
if ($RepoMigrations["RideCommand"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["kolpin-plow"]) { gh gei wait-for-migration --migration-id $RepoMigrations["kolpin-plow"] }
if ($RepoMigrations["kolpin-plow"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["v2v-service"]) { gh gei wait-for-migration --migration-id $RepoMigrations["v2v-service"] }
if ($RepoMigrations["v2v-service"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["EOLT_BBObjects"]) { gh gei wait-for-migration --migration-id $RepoMigrations["EOLT_BBObjects"] }
if ($RepoMigrations["EOLT_BBObjects"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Trail-Tech-Geofence-Module"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Trail-Tech-Geofence-Module"] }
if ($RepoMigrations["Trail-Tech-Geofence-Module"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["v2v-micro"]) { gh gei wait-for-migration --migration-id $RepoMigrations["v2v-micro"] }
if ($RepoMigrations["v2v-micro"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["p57-arm0"]) { gh gei wait-for-migration --migration-id $RepoMigrations["p57-arm0"] }
if ($RepoMigrations["p57-arm0"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Mini-Zeus-iOS-BLE-Application"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Mini-Zeus-iOS-BLE-Application"] }
if ($RepoMigrations["Mini-Zeus-iOS-BLE-Application"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["AppleMFID"]) { gh gei wait-for-migration --migration-id $RepoMigrations["AppleMFID"] }
if ($RepoMigrations["AppleMFID"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-gps"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-gps"] }
if ($RepoMigrations["polaris-gps"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["lpc21isp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["lpc21isp"] }
if ($RepoMigrations["lpc21isp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vpro-vnc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vpro-vnc"] }
if ($RepoMigrations["vpro-vnc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["node-pty"]) { gh gei wait-for-migration --migration-id $RepoMigrations["node-pty"] }
if ($RepoMigrations["node-pty"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["EOLT_TestServer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["EOLT_TestServer"] }
if ($RepoMigrations["EOLT_TestServer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["eolt-tests"]) { gh gei wait-for-migration --migration-id $RepoMigrations["eolt-tests"] }
if ($RepoMigrations["eolt-tests"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PSoC6-BLE"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PSoC6-BLE"] }
if ($RepoMigrations["PSoC6-BLE"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["kv11z"]) { gh gei wait-for-migration --migration-id $RepoMigrations["kv11z"] }
if ($RepoMigrations["kv11z"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-nav"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-nav"] }
if ($RepoMigrations["polaris-nav"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["1190can"]) { gh gei wait-for-migration --migration-id $RepoMigrations["1190can"] }
if ($RepoMigrations["1190can"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Jenkins-build-scripts"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Jenkins-build-scripts"] }
if ($RepoMigrations["Jenkins-build-scripts"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["MFI-iAP2-EAP-tester"]) { gh gei wait-for-migration --migration-id $RepoMigrations["MFI-iAP2-EAP-tester"] }
if ($RepoMigrations["MFI-iAP2-EAP-tester"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["pelias_docker_import_environment"]) { gh gei wait-for-migration --migration-id $RepoMigrations["pelias_docker_import_environment"] }
if ($RepoMigrations["pelias_docker_import_environment"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["kodiak"]) { gh gei wait-for-migration --migration-id $RepoMigrations["kodiak"] }
if ($RepoMigrations["kodiak"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["keaz128"]) { gh gei wait-for-migration --migration-id $RepoMigrations["keaz128"] }
if ($RepoMigrations["keaz128"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["timezone-service"]) { gh gei wait-for-migration --migration-id $RepoMigrations["timezone-service"] }
if ($RepoMigrations["timezone-service"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RL78_Bootloader"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RL78_Bootloader"] }
if ($RepoMigrations["RL78_Bootloader"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["libpostal-data"]) { gh gei wait-for-migration --migration-id $RepoMigrations["libpostal-data"] }
if ($RepoMigrations["libpostal-data"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["geocoder-nlp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["geocoder-nlp"] }
if ($RepoMigrations["geocoder-nlp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-imu"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-imu"] }
if ($RepoMigrations["polaris-imu"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["rom-crc-tool"]) { gh gei wait-for-migration --migration-id $RepoMigrations["rom-crc-tool"] }
if ($RepoMigrations["rom-crc-tool"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["platform-demo-app"]) { gh gei wait-for-migration --migration-id $RepoMigrations["platform-demo-app"] }
if ($RepoMigrations["platform-demo-app"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["venus-styles"]) { gh gei wait-for-migration --migration-id $RepoMigrations["venus-styles"] }
if ($RepoMigrations["venus-styles"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["pelias-geocoder-nlp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["pelias-geocoder-nlp"] }
if ($RepoMigrations["pelias-geocoder-nlp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Engineering_Tool"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Engineering_Tool"] }
if ($RepoMigrations["Engineering_Tool"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bbb-tbat"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bbb-tbat"] }
if ($RepoMigrations["bbb-tbat"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-bluetooth"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-bluetooth"] }
if ($RepoMigrations["polaris-bluetooth"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["cvcproxy"]) { gh gei wait-for-migration --migration-id $RepoMigrations["cvcproxy"] }
if ($RepoMigrations["cvcproxy"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-user"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-user"] }
if ($RepoMigrations["polaris-user"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["boot-animations"]) { gh gei wait-for-migration --migration-id $RepoMigrations["boot-animations"] }
if ($RepoMigrations["boot-animations"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vpro-cmtest"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vpro-cmtest"] }
if ($RepoMigrations["vpro-cmtest"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-init"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-init"] }
if ($RepoMigrations["polaris-init"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-disks"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-disks"] }
if ($RepoMigrations["polaris-disks"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtquickcompiler"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtquickcompiler"] }
if ($RepoMigrations["qtquickcompiler"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["apollo-arm0"]) { gh gei wait-for-migration --migration-id $RepoMigrations["apollo-arm0"] }
if ($RepoMigrations["apollo-arm0"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-telemetry"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-telemetry"] }
if ($RepoMigrations["polaris-telemetry"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["winchctrld"]) { gh gei wait-for-migration --migration-id $RepoMigrations["winchctrld"] }
if ($RepoMigrations["winchctrld"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-video"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-video"] }
if ($RepoMigrations["polaris-video"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["GPXValidator"]) { gh gei wait-for-migration --migration-id $RepoMigrations["GPXValidator"] }
if ($RepoMigrations["GPXValidator"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-freescale"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-freescale"] }
if ($RepoMigrations["meta-freescale"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-tiles"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-tiles"] }
if ($RepoMigrations["polaris-tiles"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["BBPOT"]) { gh gei wait-for-migration --migration-id $RepoMigrations["BBPOT"] }
if ($RepoMigrations["BBPOT"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-ccu-rtps-test"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-ccu-rtps-test"] }
if ($RepoMigrations["ktm-ccu-rtps-test"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["kodiak-tools"]) { gh gei wait-for-migration --migration-id $RepoMigrations["kodiak-tools"] }
if ($RepoMigrations["kodiak-tools"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["boot-animation"]) { gh gei wait-for-migration --migration-id $RepoMigrations["boot-animation"] }
if ($RepoMigrations["boot-animation"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["manufacturing-hmi"]) { gh gei wait-for-migration --migration-id $RepoMigrations["manufacturing-hmi"] }
if ($RepoMigrations["manufacturing-hmi"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["python-reflash-j1939"]) { gh gei wait-for-migration --migration-id $RepoMigrations["python-reflash-j1939"] }
if ($RepoMigrations["python-reflash-j1939"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-tts"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-tts"] }
if ($RepoMigrations["polaris-tts"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["LocationStudio"]) { gh gei wait-for-migration --migration-id $RepoMigrations["LocationStudio"] }
if ($RepoMigrations["LocationStudio"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-mcas"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-mcas"] }
if ($RepoMigrations["polaris-mcas"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["backlightd"]) { gh gei wait-for-migration --migration-id $RepoMigrations["backlightd"] }
if ($RepoMigrations["backlightd"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["powermanagerd"]) { gh gei wait-for-migration --migration-id $RepoMigrations["powermanagerd"] }
if ($RepoMigrations["powermanagerd"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-utils"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-utils"] }
if ($RepoMigrations["polaris-utils"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["debuglogger"]) { gh gei wait-for-migration --migration-id $RepoMigrations["debuglogger"] }
if ($RepoMigrations["debuglogger"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["HTTPApp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["HTTPApp"] }
if ($RepoMigrations["HTTPApp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-logger"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-logger"] }
if ($RepoMigrations["polaris-logger"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-usb"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-usb"] }
if ($RepoMigrations["polaris-usb"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-modemd"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-modemd"] }
if ($RepoMigrations["polaris-modemd"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-carplay-old"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-carplay-old"] }
if ($RepoMigrations["polaris-carplay-old"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-3180-LED"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-3180-LED"] }
if ($RepoMigrations["tt-pga-3180-LED"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-3210-ballast5"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-3210-ballast5"] }
if ($RepoMigrations["tt-pga-3210-ballast5"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-3215-ballast6"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-3215-ballast6"] }
if ($RepoMigrations["tt-pga-3215-ballast6"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-7020-TTO-programmer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-7020-TTO-programmer"] }
if ($RepoMigrations["tt-pga-7020-TTO-programmer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-7020-TTO"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-7020-TTO"] }
if ($RepoMigrations["tt-pga-7020-TTO"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-7050-TTV"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-7050-TTV"] }
if ($RepoMigrations["tt-pga-7050-TTV"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-7050-TTV-programmer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-7050-TTV-programmer"] }
if ($RepoMigrations["tt-pga-7050-TTV-programmer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-RL78-low-power"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-RL78-low-power"] }
if ($RepoMigrations["tt-pga-RL78-low-power"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-E100"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-E100"] }
if ($RepoMigrations["tt-pga-E100"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-8100"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-8100"] }
if ($RepoMigrations["tt-pga-8100"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-8100-programmer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-8100-programmer"] }
if ($RepoMigrations["tt-pga-8100-programmer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-8105"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-8105"] }
if ($RepoMigrations["tt-pga-8105"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-7000-gauges"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-7000-gauges"] }
if ($RepoMigrations["tt-pga-7000-gauges"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-Brammo-DashSimulator"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-Brammo-DashSimulator"] }
if ($RepoMigrations["tt-pga-Brammo-DashSimulator"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-Brammo"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-Brammo"] }
if ($RepoMigrations["tt-pga-Brammo"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-Brammo-programmer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-Brammo-programmer"] }
if ($RepoMigrations["tt-pga-Brammo-programmer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-coil-driver"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-coil-driver"] }
if ($RepoMigrations["tt-pga-coil-driver"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-OHVTrails"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-OHVTrails"] }
if ($RepoMigrations["tt-pga-OHVTrails"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-PICkit2-programmer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-PICkit2-programmer"] }
if ($RepoMigrations["tt-pga-PICkit2-programmer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-switch-controller"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-switch-controller"] }
if ($RepoMigrations["tt-pga-switch-controller"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-RideLeader"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-RideLeader"] }
if ($RepoMigrations["tt-pga-RideLeader"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-RideLeader-web"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-RideLeader-web"] }
if ($RepoMigrations["tt-pga-RideLeader-web"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-voyager"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-voyager"] }
if ($RepoMigrations["tt-pga-voyager"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-voyager-programmer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-voyager-programmer"] }
if ($RepoMigrations["tt-pga-voyager-programmer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-ST-VPro-app_OLD"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-ST-VPro-app_OLD"] }
if ($RepoMigrations["tt-pga-ST-VPro-app_OLD"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-ST-VPro-app"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-ST-VPro-app"] }
if ($RepoMigrations["tt-pga-ST-VPro-app"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-ST-VPro-bootloader"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-ST-VPro-bootloader"] }
if ($RepoMigrations["tt-pga-ST-VPro-bootloader"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-ST-VPro-buildroot"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-ST-VPro-buildroot"] }
if ($RepoMigrations["tt-pga-ST-VPro-buildroot"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-ST-VPro-gpsdriver"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-ST-VPro-gpsdriver"] }
if ($RepoMigrations["tt-pga-ST-VPro-gpsdriver"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-ST-VPro-kernel"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-ST-VPro-kernel"] }
if ($RepoMigrations["tt-pga-ST-VPro-kernel"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tt-pga-ST-VPro-bsp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tt-pga-ST-VPro-bsp"] }
if ($RepoMigrations["tt-pga-ST-VPro-bsp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["B1-Cypress-BLE-Module"]) { gh gei wait-for-migration --migration-id $RepoMigrations["B1-Cypress-BLE-Module"] }
if ($RepoMigrations["B1-Cypress-BLE-Module"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["B1-Bluegiga-WT12-Module"]) { gh gei wait-for-migration --migration-id $RepoMigrations["B1-Bluegiga-WT12-Module"] }
if ($RepoMigrations["B1-Bluegiga-WT12-Module"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Polaris_Engineering_Tool"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Polaris_Engineering_Tool"] }
if ($RepoMigrations["Polaris_Engineering_Tool"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Polaris_Flash_Tool"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Polaris_Flash_Tool"] }
if ($RepoMigrations["Polaris_Flash_Tool"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Polaris_Production_Software_v1"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Polaris_Production_Software_v1"] }
if ($RepoMigrations["Polaris_Production_Software_v1"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["lib-apple-carplay"]) { gh gei wait-for-migration --migration-id $RepoMigrations["lib-apple-carplay"] }
if ($RepoMigrations["lib-apple-carplay"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["linux-manufacturing"]) { gh gei wait-for-migration --migration-id $RepoMigrations["linux-manufacturing"] }
if ($RepoMigrations["linux-manufacturing"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["arnold"]) { gh gei wait-for-migration --migration-id $RepoMigrations["arnold"] }
if ($RepoMigrations["arnold"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["nuance-tts-binaries"]) { gh gei wait-for-migration --migration-id $RepoMigrations["nuance-tts-binaries"] }
if ($RepoMigrations["nuance-tts-binaries"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["nuance-tts-data"]) { gh gei wait-for-migration --migration-id $RepoMigrations["nuance-tts-data"] }
if ($RepoMigrations["nuance-tts-data"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["linux-manufacturing-deployment"]) { gh gei wait-for-migration --migration-id $RepoMigrations["linux-manufacturing-deployment"] }
if ($RepoMigrations["linux-manufacturing-deployment"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ApolloEHT_pic"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ApolloEHT_pic"] }
if ($RepoMigrations["ApolloEHT_pic"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["manufacturing-hmi-2"]) { gh gei wait-for-migration --migration-id $RepoMigrations["manufacturing-hmi-2"] }
if ($RepoMigrations["manufacturing-hmi-2"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-telematics"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-telematics"] }
if ($RepoMigrations["polaris-telematics"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["linux-uds-server"]) { gh gei wait-for-migration --migration-id $RepoMigrations["linux-uds-server"] }
if ($RepoMigrations["linux-uds-server"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["EOLT_Laser"]) { gh gei wait-for-migration --migration-id $RepoMigrations["EOLT_Laser"] }
if ($RepoMigrations["EOLT_Laser"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["sdbus-cpp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["sdbus-cpp"] }
if ($RepoMigrations["sdbus-cpp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bootpd"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bootpd"] }
if ($RepoMigrations["bootpd"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bbb-can"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bbb-can"] }
if ($RepoMigrations["bbb-can"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-kmrc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-kmrc"] }
if ($RepoMigrations["ktm-kmrc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["pocketCanBeagle"]) { gh gei wait-for-migration --migration-id $RepoMigrations["pocketCanBeagle"] }
if ($RepoMigrations["pocketCanBeagle"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-shm-test"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-shm-test"] }
if ($RepoMigrations["ktm-shm-test"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tiva_needle_press"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tiva_needle_press"] }
if ($RepoMigrations["tiva_needle_press"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["GroupRide"]) { gh gei wait-for-migration --migration-id $RepoMigrations["GroupRide"] }
if ($RepoMigrations["GroupRide"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-imu"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-imu"] }
if ($RepoMigrations["ktm-imu"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Shiba_DoIP_Tool"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Shiba_DoIP_Tool"] }
if ($RepoMigrations["Shiba_DoIP_Tool"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["LongRangeRadioDev"]) { gh gei wait-for-migration --migration-id $RepoMigrations["LongRangeRadioDev"] }
if ($RepoMigrations["LongRangeRadioDev"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["needlePressCanBeagle"]) { gh gei wait-for-migration --migration-id $RepoMigrations["needlePressCanBeagle"] }
if ($RepoMigrations["needlePressCanBeagle"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["CCURadioTester"]) { gh gei wait-for-migration --migration-id $RepoMigrations["CCURadioTester"] }
if ($RepoMigrations["CCURadioTester"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ccuRobot"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ccuRobot"] }
if ($RepoMigrations["ccuRobot"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm_manufacturing_app"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm_manufacturing_app"] }
if ($RepoMigrations["ktm_manufacturing_app"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["oreo-arm0"]) { gh gei wait-for-migration --migration-id $RepoMigrations["oreo-arm0"] }
if ($RepoMigrations["oreo-arm0"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["rockblockd"]) { gh gei wait-for-migration --migration-id $RepoMigrations["rockblockd"] }
if ($RepoMigrations["rockblockd"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-cvc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-cvc"] }
if ($RepoMigrations["polaris-cvc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-ccu-hmi"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-ccu-hmi"] }
if ($RepoMigrations["ktm-ccu-hmi"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["CANalyzer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["CANalyzer"] }
if ($RepoMigrations["CANalyzer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["rideleader"]) { gh gei wait-for-migration --migration-id $RepoMigrations["rideleader"] }
if ($RepoMigrations["rideleader"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-bluetooth"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-bluetooth"] }
if ($RepoMigrations["ktm-bluetooth"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ci-test"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ci-test"] }
if ($RepoMigrations["ci-test"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ttci"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ttci"] }
if ($RepoMigrations["ttci"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm_bbb_slot"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm_bbb_slot"] }
if ($RepoMigrations["ktm_bbb_slot"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["J1939_Parser"]) { gh gei wait-for-migration --migration-id $RepoMigrations["J1939_Parser"] }
if ($RepoMigrations["J1939_Parser"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-mfi"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-mfi"] }
if ($RepoMigrations["ktm-mfi"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm_eolt_exec"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm_eolt_exec"] }
if ($RepoMigrations["ktm_eolt_exec"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["cvdata"]) { gh gei wait-for-migration --migration-id $RepoMigrations["cvdata"] }
if ($RepoMigrations["cvdata"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ignite"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ignite"] }
if ($RepoMigrations["ignite"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ota-src"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ota-src"] }
if ($RepoMigrations["ota-src"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["harman_vdm"]) { gh gei wait-for-migration --migration-id $RepoMigrations["harman_vdm"] }
if ($RepoMigrations["harman_vdm"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["harman_rbua"]) { gh gei wait-for-migration --migration-id $RepoMigrations["harman_rbua"] }
if ($RepoMigrations["harman_rbua"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["libj1939"]) { gh gei wait-for-migration --migration-id $RepoMigrations["libj1939"] }
if ($RepoMigrations["libj1939"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["can_app_pieces"]) { gh gei wait-for-migration --migration-id $RepoMigrations["can_app_pieces"] }
if ($RepoMigrations["can_app_pieces"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["journald-plugin"]) { gh gei wait-for-migration --migration-id $RepoMigrations["journald-plugin"] }
if ($RepoMigrations["journald-plugin"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ignite-event-provider"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ignite-event-provider"] }
if ($RepoMigrations["ignite-event-provider"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-hfpproxy"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-hfpproxy"] }
if ($RepoMigrations["ktm-hfpproxy"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-vdm-client"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-vdm-client"] }
if ($RepoMigrations["polaris-vdm-client"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ota-update-agent"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ota-update-agent"] }
if ($RepoMigrations["ota-update-agent"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["HandlersGenerator"]) { gh gei wait-for-migration --migration-id $RepoMigrations["HandlersGenerator"] }
if ($RepoMigrations["HandlersGenerator"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["mapbox-gl-native-private"]) { gh gei wait-for-migration --migration-id $RepoMigrations["mapbox-gl-native-private"] }
if ($RepoMigrations["mapbox-gl-native-private"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["CESProjectManager"]) { gh gei wait-for-migration --migration-id $RepoMigrations["CESProjectManager"] }
if ($RepoMigrations["CESProjectManager"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ccu-flash"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ccu-flash"] }
if ($RepoMigrations["ccu-flash"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Polaris-Common"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Polaris-Common"] }
if ($RepoMigrations["Polaris-Common"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["python-j1939"]) { gh gei wait-for-migration --migration-id $RepoMigrations["python-j1939"] }
if ($RepoMigrations["python-j1939"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Polaris_Helmet_Audio_Accelerometer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Polaris_Helmet_Audio_Accelerometer"] }
if ($RepoMigrations["Polaris_Helmet_Audio_Accelerometer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Polaris_Helmet_Audio_Accelerometer_HW_Design"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Polaris_Helmet_Audio_Accelerometer_HW_Design"] }
if ($RepoMigrations["Polaris_Helmet_Audio_Accelerometer_HW_Design"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-hostname"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-hostname"] }
if ($RepoMigrations["ktm-hostname"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-ssl"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-ssl"] }
if ($RepoMigrations["polaris-ssl"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Polaris_Helmet_UI_Demo_BLE_FW"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Polaris_Helmet_UI_Demo_BLE_FW"] }
if ($RepoMigrations["Polaris_Helmet_UI_Demo_BLE_FW"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Polaris_Helmet_UI_Demo_Xcode_iPad_Application"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Polaris_Helmet_UI_Demo_Xcode_iPad_Application"] }
if ($RepoMigrations["Polaris_Helmet_UI_Demo_Xcode_iPad_Application"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-keystore"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-keystore"] }
if ($RepoMigrations["polaris-keystore"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["kodiak-tools-cluster"]) { gh gei wait-for-migration --migration-id $RepoMigrations["kodiak-tools-cluster"] }
if ($RepoMigrations["kodiak-tools-cluster"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["libdbuswrapper"]) { gh gei wait-for-migration --migration-id $RepoMigrations["libdbuswrapper"] }
if ($RepoMigrations["libdbuswrapper"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vehicle-info"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vehicle-info"] }
if ($RepoMigrations["vehicle-info"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Ultimate_Helmet_Project"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Ultimate_Helmet_Project"] }
if ($RepoMigrations["Ultimate_Helmet_Project"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["CCU-CM-Tester"]) { gh gei wait-for-migration --migration-id $RepoMigrations["CCU-CM-Tester"] }
if ($RepoMigrations["CCU-CM-Tester"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Rendezvous_UI_Connectivity_Prototype_Project"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Rendezvous_UI_Connectivity_Prototype_Project"] }
if ($RepoMigrations["Rendezvous_UI_Connectivity_Prototype_Project"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["eolt-v2-data"]) { gh gei wait-for-migration --migration-id $RepoMigrations["eolt-v2-data"] }
if ($RepoMigrations["eolt-v2-data"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["IVI-Automation"]) { gh gei wait-for-migration --migration-id $RepoMigrations["IVI-Automation"] }
if ($RepoMigrations["IVI-Automation"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-libsnf"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-libsnf"] }
if ($RepoMigrations["polaris-libsnf"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ivi-remote-access"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ivi-remote-access"] }
if ($RepoMigrations["ivi-remote-access"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-ownersmanual"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-ownersmanual"] }
if ($RepoMigrations["polaris-ownersmanual"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Follow_Me_Project"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Follow_Me_Project"] }
if ($RepoMigrations["Follow_Me_Project"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["BD_SOUND"]) { gh gei wait-for-migration --migration-id $RepoMigrations["BD_SOUND"] }
if ($RepoMigrations["BD_SOUND"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["DSP_Concepts"]) { gh gei wait-for-migration --migration-id $RepoMigrations["DSP_Concepts"] }
if ($RepoMigrations["DSP_Concepts"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["mcuxpresso-toolchain"]) { gh gei wait-for-migration --migration-id $RepoMigrations["mcuxpresso-toolchain"] }
if ($RepoMigrations["mcuxpresso-toolchain"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-mobileoffice"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-mobileoffice"] }
if ($RepoMigrations["polaris-mobileoffice"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-commons"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-commons"] }
if ($RepoMigrations["polaris-commons"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ci_backup_scripts"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ci_backup_scripts"] }
if ($RepoMigrations["ci_backup_scripts"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-ev"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-ev"] }
if ($RepoMigrations["polaris-ev"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["imx_cst_tool"]) { gh gei wait-for-migration --migration-id $RepoMigrations["imx_cst_tool"] }
if ($RepoMigrations["imx_cst_tool"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-core"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-core"] }
if ($RepoMigrations["polaris-core"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["legendary-templates"]) { gh gei wait-for-migration --migration-id $RepoMigrations["legendary-templates"] }
if ($RepoMigrations["legendary-templates"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bbb-poke"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bbb-poke"] }
if ($RepoMigrations["bbb-poke"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["sentinel-demo"]) { gh gei wait-for-migration --migration-id $RepoMigrations["sentinel-demo"] }
if ($RepoMigrations["sentinel-demo"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtbase"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtbase"] }
if ($RepoMigrations["qtbase"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtdeclarative"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtdeclarative"] }
if ($RepoMigrations["qtdeclarative"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtgraphicaleffects"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtgraphicaleffects"] }
if ($RepoMigrations["qtgraphicaleffects"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtlocation"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtlocation"] }
if ($RepoMigrations["qtlocation"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtmultimedia"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtmultimedia"] }
if ($RepoMigrations["qtmultimedia"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtquickcontrols2"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtquickcontrols2"] }
if ($RepoMigrations["qtquickcontrols2"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtquickcontrols"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtquickcontrols"] }
if ($RepoMigrations["qtquickcontrols"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtserialport"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtserialport"] }
if ($RepoMigrations["qtserialport"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtsvg"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtsvg"] }
if ($RepoMigrations["qtsvg"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qttools"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qttools"] }
if ($RepoMigrations["qttools"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtvirtualkeyboard"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtvirtualkeyboard"] }
if ($RepoMigrations["qtvirtualkeyboard"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtwayland"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtwayland"] }
if ($RepoMigrations["qtwayland"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtxmlpatterns"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtxmlpatterns"] }
if ($RepoMigrations["qtxmlpatterns"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtconnectivity"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtconnectivity"] }
if ($RepoMigrations["qtconnectivity"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtlocation-mapboxgl"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtlocation-mapboxgl"] }
if ($RepoMigrations["qtlocation-mapboxgl"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qt3d"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qt3d"] }
if ($RepoMigrations["qt3d"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["EOLT-Documents"]) { gh gei wait-for-migration --migration-id $RepoMigrations["EOLT-Documents"] }
if ($RepoMigrations["EOLT-Documents"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-can-simulator"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-can-simulator"] }
if ($RepoMigrations["polaris-can-simulator"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtquick3d"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtquick3d"] }
if ($RepoMigrations["qtquick3d"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["sdbuswrapper-codegen"]) { gh gei wait-for-migration --migration-id $RepoMigrations["sdbuswrapper-codegen"] }
if ($RepoMigrations["sdbuswrapper-codegen"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-polaris"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-polaris"] }
if ($RepoMigrations["meta-polaris"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bbb-hand-control"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bbb-hand-control"] }
if ($RepoMigrations["bbb-hand-control"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ttqaAutomation"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ttqaAutomation"] }
if ($RepoMigrations["ttqaAutomation"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-video-recorder"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-video-recorder"] }
if ($RepoMigrations["polaris-video-recorder"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["venus-docs"]) { gh gei wait-for-migration --migration-id $RepoMigrations["venus-docs"] }
if ($RepoMigrations["venus-docs"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_COMMON_SCM_Dynamix"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_COMMON_SCM_Dynamix"] }
if ($RepoMigrations["PROD_COMMON_SCM_Dynamix"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["test-profile-reconnector"]) { gh gei wait-for-migration --migration-id $RepoMigrations["test-profile-reconnector"] }
if ($RepoMigrations["test-profile-reconnector"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["manufacturing_software_utils"]) { gh gei wait-for-migration --migration-id $RepoMigrations["manufacturing_software_utils"] }
if ($RepoMigrations["manufacturing_software_utils"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["manufacturing_deployment_app"]) { gh gei wait-for-migration --migration-id $RepoMigrations["manufacturing_deployment_app"] }
if ($RepoMigrations["manufacturing_deployment_app"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["reset-manager"]) { gh gei wait-for-migration --migration-id $RepoMigrations["reset-manager"] }
if ($RepoMigrations["reset-manager"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_ASW_Tools"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_ASW_Tools"] }
if ($RepoMigrations["VC_ASW_Tools"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["translation-checker"]) { gh gei wait-for-migration --migration-id $RepoMigrations["translation-checker"] }
if ($RepoMigrations["translation-checker"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["GithubAction_Test_Repo"]) { gh gei wait-for-migration --migration-id $RepoMigrations["GithubAction_Test_Repo"] }
if ($RepoMigrations["GithubAction_Test_Repo"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung-yocto-builder"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung-yocto-builder"] }
if ($RepoMigrations["samsung-yocto-builder"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["IVI-Performance-Profiler"]) { gh gei wait-for-migration --migration-id $RepoMigrations["IVI-Performance-Profiler"] }
if ($RepoMigrations["IVI-Performance-Profiler"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung-src"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung-src"] }
if ($RepoMigrations["samsung-src"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-samsung-old"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-samsung-old"] }
if ($RepoMigrations["meta-samsung-old"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qtapplicationmanager"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qtapplicationmanager"] }
if ($RepoMigrations["qtapplicationmanager"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["qemu-erpc-firmware"]) { gh gei wait-for-migration --migration-id $RepoMigrations["qemu-erpc-firmware"] }
if ($RepoMigrations["qemu-erpc-firmware"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["DeploymentMonitor"]) { gh gei wait-for-migration --migration-id $RepoMigrations["DeploymentMonitor"] }
if ($RepoMigrations["DeploymentMonitor"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tata-project"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tata-project"] }
if ($RepoMigrations["tata-project"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_bin_security_exynostee"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_bin_security_exynostee"] }
if ($RepoMigrations["samsung_bin_security_exynostee"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_bl2-boot"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_bl2-boot"] }
if ($RepoMigrations["samsung_bl2-boot"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_boot-binary"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_boot-binary"] }
if ($RepoMigrations["samsung_boot-binary"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_fw_audio"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_fw_audio"] }
if ($RepoMigrations["samsung_fw_audio"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_fw_camera"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_fw_camera"] }
if ($RepoMigrations["samsung_fw_camera"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_fw_npu"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_fw_npu"] }
if ($RepoMigrations["samsung_fw_npu"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_fw_video"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_fw_video"] }
if ($RepoMigrations["samsung_fw_video"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_kernel"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_kernel"] }
if ($RepoMigrations["samsung_kernel"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_lib_camera_libcam"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_lib_camera_libcam"] }
if ($RepoMigrations["samsung_lib_camera_libcam"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_lib_gpu_libmali-linux"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_lib_gpu_libmali-linux"] }
if ($RepoMigrations["samsung_lib_gpu_libmali-linux"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_lib_gstreamer-plugins-exynos"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_lib_gstreamer-plugins-exynos"] }
if ($RepoMigrations["samsung_lib_gstreamer-plugins-exynos"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_lib_rendering"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_lib_rendering"] }
if ($RepoMigrations["samsung_lib_rendering"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_lib_video_openmax-linux"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_lib_video_openmax-linux"] }
if ($RepoMigrations["samsung_lib_video_openmax-linux"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_linux_bare_dts-orv"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_linux_bare_dts-orv"] }
if ($RepoMigrations["samsung_linux_bare_dts-orv"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_lk-boot"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_lk-boot"] }
if ($RepoMigrations["samsung_lk-boot"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-exynostee"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-exynostee"] }
if ($RepoMigrations["meta-exynostee"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-samsung-bsp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-samsung-bsp"] }
if ($RepoMigrations["meta-samsung-bsp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-samsung-externalsrc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-samsung-externalsrc"] }
if ($RepoMigrations["meta-samsung-externalsrc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-samsung-orv"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-samsung-orv"] }
if ($RepoMigrations["meta-samsung-orv"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-samsung-sec-auto"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-samsung-sec-auto"] }
if ($RepoMigrations["meta-samsung-sec-auto"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_sfi_bin"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_sfi_bin"] }
if ($RepoMigrations["samsung_sfi_bin"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_sfi_bootloader"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_sfi_bootloader"] }
if ($RepoMigrations["samsung_sfi_bootloader"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_sfi_bootloader_script"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_sfi_bootloader_script"] }
if ($RepoMigrations["samsung_sfi_bootloader_script"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_sfi_cdd_testbench_script"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_sfi_cdd_testbench_script"] }
if ($RepoMigrations["samsung_sfi_cdd_testbench_script"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_sfi_freertos"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_sfi_freertos"] }
if ($RepoMigrations["samsung_sfi_freertos"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_test_audio_aboxTestApp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_test_audio_aboxTestApp"] }
if ($RepoMigrations["samsung_test_audio_aboxTestApp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_test_camera"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_test_camera"] }
if ($RepoMigrations["samsung_test_camera"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_test_rendering-tests"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_test_rendering-tests"] }
if ($RepoMigrations["samsung_test_rendering-tests"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_test_security-tests"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_test_security-tests"] }
if ($RepoMigrations["samsung_test_security-tests"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_test_video_omxutc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_test_video_omxutc"] }
if ($RepoMigrations["samsung_test_video_omxutc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_test_video_mfcutc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_test_video_mfcutc"] }
if ($RepoMigrations["samsung_test_video_mfcutc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_boottime-viewer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_boottime-viewer"] }
if ($RepoMigrations["samsung_tool_boottime-viewer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_camera_NearSight"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_camera_NearSight"] }
if ($RepoMigrations["samsung_tool_camera_NearSight"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_gangutils"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_gangutils"] }
if ($RepoMigrations["samsung_tool_gangutils"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_partitiondump"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_partitiondump"] }
if ($RepoMigrations["samsung_tool_partitiondump"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_pit-maker"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_pit-maker"] }
if ($RepoMigrations["samsung_tool_pit-maker"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_ramdump"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_ramdump"] }
if ($RepoMigrations["samsung_tool_ramdump"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_script"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_script"] }
if ($RepoMigrations["samsung_tool_script"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-samsung"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-samsung"] }
if ($RepoMigrations["meta-samsung"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_MRZR_VCU_Cyborg"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_MRZR_VCU_Cyborg"] }
if ($RepoMigrations["RCP_MRZR_VCU_Cyborg"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vehicle-proxy"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vehicle-proxy"] }
if ($RepoMigrations["vehicle-proxy"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["spotx-daemon"]) { gh gei wait-for-migration --migration-id $RepoMigrations["spotx-daemon"] }
if ($RepoMigrations["spotx-daemon"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_linux_bare_dts"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_linux_bare_dts"] }
if ($RepoMigrations["samsung_linux_bare_dts"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-concurrency"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-concurrency"] }
if ($RepoMigrations["polaris-concurrency"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["libPlatform"]) { gh gei wait-for-migration --migration-id $RepoMigrations["libPlatform"] }
if ($RepoMigrations["libPlatform"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RANGER_VCM_Posn1_PlowMode2-0"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RANGER_VCM_Posn1_PlowMode2-0"] }
if ($RepoMigrations["RCP_RANGER_VCM_Posn1_PlowMode2-0"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RANGER_VCM_Posn1_CabPrecondition"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RANGER_VCM_Posn1_CabPrecondition"] }
if ($RepoMigrations["RCP_RANGER_VCM_Posn1_CabPrecondition"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RANGER_VCM_Posn1_LightBarPWM"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RANGER_VCM_Posn1_LightBarPWM"] }
if ($RepoMigrations["RCP_RANGER_VCM_Posn1_LightBarPWM"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Boilerplate_PCI_VCM_Gen3"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Boilerplate_PCI_VCM_Gen3"] }
if ($RepoMigrations["Boilerplate_PCI_VCM_Gen3"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_SPORTSMAN_DMC_Nebula"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_SPORTSMAN_DMC_Nebula"] }
if ($RepoMigrations["RCP_SPORTSMAN_DMC_Nebula"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ra6m5-vip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ra6m5-vip"] }
if ($RepoMigrations["ra6m5-vip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_MRZR_SGC_AlphaAutonomy"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_MRZR_SGC_AlphaAutonomy"] }
if ($RepoMigrations["RCP_MRZR_SGC_AlphaAutonomy"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["stm-cmost"]) { gh gei wait-for-migration --migration-id $RepoMigrations["stm-cmost"] }
if ($RepoMigrations["stm-cmost"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["audioweaver"]) { gh gei wait-for-migration --migration-id $RepoMigrations["audioweaver"] }
if ($RepoMigrations["audioweaver"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["linux-fslc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["linux-fslc"] }
if ($RepoMigrations["linux-fslc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["audiomanager-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["audiomanager-rcip"] }
if ($RepoMigrations["audiomanager-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["media-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["media-rcip"] }
if ($RepoMigrations["media-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-fmradio-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-fmradio-rcip"] }
if ($RepoMigrations["polaris-fmradio-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bluetooth-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bluetooth-rcip"] }
if ($RepoMigrations["bluetooth-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-carplay-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-carplay-rcip"] }
if ($RepoMigrations["polaris-carplay-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vehicle-services-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vehicle-services-rcip"] }
if ($RepoMigrations["vehicle-services-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["spdlog-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["spdlog-rcip"] }
if ($RepoMigrations["spdlog-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["health-monitor-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["health-monitor-rcip"] }
if ($RepoMigrations["health-monitor-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["devicemanager-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["devicemanager-rcip"] }
if ($RepoMigrations["devicemanager-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["common-projection-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["common-projection-rcip"] }
if ($RepoMigrations["common-projection-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["abrt-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["abrt-rcip"] }
if ($RepoMigrations["abrt-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["data-lib-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["data-lib-rcip"] }
if ($RepoMigrations["data-lib-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["data-gen-lib-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["data-gen-lib-rcip"] }
if ($RepoMigrations["data-gen-lib-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["vip-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["vip-rcip"] }
if ($RepoMigrations["vip-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bt-connection-service"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bt-connection-service"] }
if ($RepoMigrations["bt-connection-service"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["sentinel"]) { gh gei wait-for-migration --migration-id $RepoMigrations["sentinel"] }
if ($RepoMigrations["sentinel"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["satyr-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["satyr-rcip"] }
if ($RepoMigrations["satyr-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["libreport-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["libreport-rcip"] }
if ($RepoMigrations["libreport-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-common-infra-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-common-infra-rcip"] }
if ($RepoMigrations["polaris-common-infra-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_test_npu-tests"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_test_npu-tests"] }
if ($RepoMigrations["samsung_test_npu-tests"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_bin_security_el3_mon_exynostee"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_bin_security_el3_mon_exynostee"] }
if ($RepoMigrations["samsung_bin_security_el3_mon_exynostee"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_bin_security_ldfw"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_bin_security_ldfw"] }
if ($RepoMigrations["samsung_bin_security_ldfw"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_bin_security_keystorage"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_bin_security_keystorage"] }
if ($RepoMigrations["samsung_bin_security_keystorage"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_bin_security_tee_exynostee"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_bin_security_tee_exynostee"] }
if ($RepoMigrations["samsung_bin_security_tee_exynostee"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_fw_gpu"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_fw_gpu"] }
if ($RepoMigrations["samsung_fw_gpu"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_lib_libdrm"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_lib_libdrm"] }
if ($RepoMigrations["samsung_lib_libdrm"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_lib_gpu_sgpu-userspace"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_lib_gpu_sgpu-userspace"] }
if ($RepoMigrations["samsung_lib_gpu_sgpu-userspace"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_pit-binary-maker"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_pit-binary-maker"] }
if ($RepoMigrations["samsung_tool_pit-binary-maker"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_security_app-maker"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_security_app-maker"] }
if ($RepoMigrations["samsung_tool_security_app-maker"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_eub"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_eub"] }
if ($RepoMigrations["samsung_tool_eub"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_flash"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_flash"] }
if ($RepoMigrations["samsung_tool_flash"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_multidownloader"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_multidownloader"] }
if ($RepoMigrations["samsung_tool_multidownloader"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_security_ree_exynostee"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_security_ree_exynostee"] }
if ($RepoMigrations["samsung_security_ree_exynostee"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_variant_orv"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_variant_orv"] }
if ($RepoMigrations["samsung_variant_orv"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_lib_npu"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_lib_npu"] }
if ($RepoMigrations["samsung_lib_npu"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-ccu2-dbus-api"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-ccu2-dbus-api"] }
if ($RepoMigrations["ktm-ccu2-dbus-api"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-helpcall"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-helpcall"] }
if ($RepoMigrations["ktm-helpcall"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ktm-telemetry"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ktm-telemetry"] }
if ($RepoMigrations["ktm-telemetry"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["prpc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["prpc"] }
if ($RepoMigrations["prpc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-pulseaudio-modules"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-pulseaudio-modules"] }
if ($RepoMigrations["polaris-pulseaudio-modules"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["robot-test-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["robot-test-rcip"] }
if ($RepoMigrations["robot-test-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_RANGER_VCM_Cronus"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_RANGER_VCM_Cronus"] }
if ($RepoMigrations["PROD_RANGER_VCM_Cronus"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["map_loader_webservice"]) { gh gei wait-for-migration --migration-id $RepoMigrations["map_loader_webservice"] }
if ($RepoMigrations["map_loader_webservice"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_INDIAN_VCM_Posn1_Raptor"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_INDIAN_VCM_Posn1_Raptor"] }
if ($RepoMigrations["PROD_INDIAN_VCM_Posn1_Raptor"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_INDIAN_VCM_Posn1_Carbide"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_INDIAN_VCM_Posn1_Carbide"] }
if ($RepoMigrations["PROD_INDIAN_VCM_Posn1_Carbide"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_INDIAN_VCM_Posn2_Raptor"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_INDIAN_VCM_Posn2_Raptor"] }
if ($RepoMigrations["PROD_INDIAN_VCM_Posn2_Raptor"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["variant-config-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["variant-config-rcip"] }
if ($RepoMigrations["variant-config-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["gh-pages"]) { gh gei wait-for-migration --migration-id $RepoMigrations["gh-pages"] }
if ($RepoMigrations["gh-pages"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["sfi_rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["sfi_rcip"] }
if ($RepoMigrations["sfi_rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tcu-contract-tests"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tcu-contract-tests"] }
if ($RepoMigrations["tcu-contract-tests"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["mfi-auth-server"]) { gh gei wait-for-migration --migration-id $RepoMigrations["mfi-auth-server"] }
if ($RepoMigrations["mfi-auth-server"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["geodata"]) { gh gei wait-for-migration --migration-id $RepoMigrations["geodata"] }
if ($RepoMigrations["geodata"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["audio-hal"]) { gh gei wait-for-migration --migration-id $RepoMigrations["audio-hal"] }
if ($RepoMigrations["audio-hal"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_SLINGSHOT_VCM_Posn1_Trebuchet"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_SLINGSHOT_VCM_Posn1_Trebuchet"] }
if ($RepoMigrations["PROD_SLINGSHOT_VCM_Posn1_Trebuchet"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_RANGER_VCM_Posn1_Loki"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_RANGER_VCM_Posn1_Loki"] }
if ($RepoMigrations["PROD_RANGER_VCM_Posn1_Loki"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_RANGER_VCM_Posn2_Loki"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_RANGER_VCM_Posn2_Loki"] }
if ($RepoMigrations["PROD_RANGER_VCM_Posn2_Loki"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_RANGER_VCM_Phantom"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_RANGER_VCM_Phantom"] }
if ($RepoMigrations["PROD_RANGER_VCM_Phantom"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["apple-mfid-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["apple-mfid-rcip"] }
if ($RepoMigrations["apple-mfid-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["lib-apple-commplugin"]) { gh gei wait-for-migration --migration-id $RepoMigrations["lib-apple-commplugin"] }
if ($RepoMigrations["lib-apple-commplugin"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["sfI-linux-chardev-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["sfI-linux-chardev-rcip"] }
if ($RepoMigrations["sfI-linux-chardev-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["WindowsGUIAppSetHardwareID"]) { gh gei wait-for-migration --migration-id $RepoMigrations["WindowsGUIAppSetHardwareID"] }
if ($RepoMigrations["WindowsGUIAppSetHardwareID"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["WindowsCommandLineSetHardwareID"]) { gh gei wait-for-migration --migration-id $RepoMigrations["WindowsCommandLineSetHardwareID"] }
if ($RepoMigrations["WindowsCommandLineSetHardwareID"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VIP-Interface"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VIP-Interface"] }
if ($RepoMigrations["VIP-Interface"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VIP-ERPC"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VIP-ERPC"] }
if ($RepoMigrations["VIP-ERPC"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bluetooth-connection-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bluetooth-connection-rcip"] }
if ($RepoMigrations["bluetooth-connection-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bluetooth-telephony-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bluetooth-telephony-rcip"] }
if ($RepoMigrations["bluetooth-telephony-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bluetooth-phonebook-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bluetooth-phonebook-rcip"] }
if ($RepoMigrations["bluetooth-phonebook-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bluetooth-message-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bluetooth-message-rcip"] }
if ($RepoMigrations["bluetooth-message-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VS-SFI-VIP-Linux_Code"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VS-SFI-VIP-Linux_Code"] }
if ($RepoMigrations["VS-SFI-VIP-Linux_Code"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_COMMON_VCM_Thor"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_COMMON_VCM_Thor"] }
if ($RepoMigrations["PROD_COMMON_VCM_Thor"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_INDIAN_VCM_Posn3_RaptorMY24"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_INDIAN_VCM_Posn3_RaptorMY24"] }
if ($RepoMigrations["PROD_INDIAN_VCM_Posn3_RaptorMY24"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["erpc-interfaces"]) { gh gei wait-for-migration --migration-id $RepoMigrations["erpc-interfaces"] }
if ($RepoMigrations["erpc-interfaces"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_PII_Example"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_PII_Example"] }
if ($RepoMigrations["RCP_COMMON_PII_Example"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_COMMON_HCSM_HeatedCooledSeat"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_COMMON_HCSM_HeatedCooledSeat"] }
if ($RepoMigrations["PROD_COMMON_HCSM_HeatedCooledSeat"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-localization"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-localization"] }
if ($RepoMigrations["polaris-localization"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-mapbox-sdk"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-mapbox-sdk"] }
if ($RepoMigrations["polaris-mapbox-sdk"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["samsung_tool_camera_TuneSight"]) { gh gei wait-for-migration --migration-id $RepoMigrations["samsung_tool_camera_TuneSight"] }
if ($RepoMigrations["samsung_tool_camera_TuneSight"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["actions-playground"]) { gh gei wait-for-migration --migration-id $RepoMigrations["actions-playground"] }
if ($RepoMigrations["actions-playground"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-persistence"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-persistence"] }
if ($RepoMigrations["polaris-persistence"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["serial-block-transfer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["serial-block-transfer"] }
if ($RepoMigrations["serial-block-transfer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RANGER_GCM_ZeroePTChargerGateway"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RANGER_GCM_ZeroePTChargerGateway"] }
if ($RepoMigrations["RCP_RANGER_GCM_ZeroePTChargerGateway"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["harman-swm-client-agent"]) { gh gei wait-for-migration --migration-id $RepoMigrations["harman-swm-client-agent"] }
if ($RepoMigrations["harman-swm-client-agent"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["TTM"]) { gh gei wait-for-migration --migration-id $RepoMigrations["TTM"] }
if ($RepoMigrations["TTM"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_SLINGSHOT_VCM_Posn1_TrebuchetClearNVM"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_SLINGSHOT_VCM_Posn1_TrebuchetClearNVM"] }
if ($RepoMigrations["RCP_SLINGSHOT_VCM_Posn1_TrebuchetClearNVM"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RANGER_ePCM_StarterGenerator"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RANGER_ePCM_StarterGenerator"] }
if ($RepoMigrations["RCP_RANGER_ePCM_StarterGenerator"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_INDIAN_VCM_Posn3_RaptorMY25"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_INDIAN_VCM_Posn3_RaptorMY25"] }
if ($RepoMigrations["PROD_INDIAN_VCM_Posn3_RaptorMY25"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_INDIAN_VCM_Mustang"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_INDIAN_VCM_Mustang"] }
if ($RepoMigrations["PROD_INDIAN_VCM_Mustang"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Boilerplate_PCI_VCM_Gen2-1"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Boilerplate_PCI_VCM_Gen2-1"] }
if ($RepoMigrations["Boilerplate_PCI_VCM_Gen2-1"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_VCM_GhostRider"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_VCM_GhostRider"] }
if ($RepoMigrations["RCP_COMMON_VCM_GhostRider"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["redsea"]) { gh gei wait-for-migration --migration-id $RepoMigrations["redsea"] }
if ($RepoMigrations["redsea"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ubxfwupdate"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ubxfwupdate"] }
if ($RepoMigrations["ubxfwupdate"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["BSW_PCI_VCM_Gen2-1"]) { gh gei wait-for-migration --migration-id $RepoMigrations["BSW_PCI_VCM_Gen2-1"] }
if ($RepoMigrations["BSW_PCI_VCM_Gen2-1"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Tools_PCI"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Tools_PCI"] }
if ($RepoMigrations["Tools_PCI"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Boilerplate_PKT_SCM"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Boilerplate_PKT_SCM"] }
if ($RepoMigrations["Boilerplate_PKT_SCM"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-tcudetection"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-tcudetection"] }
if ($RepoMigrations["polaris-tcudetection"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["BSW_PCI_VCM_Gen3"]) { gh gei wait-for-migration --migration-id $RepoMigrations["BSW_PCI_VCM_Gen3"] }
if ($RepoMigrations["BSW_PCI_VCM_Gen3"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["c2b-fw"]) { gh gei wait-for-migration --migration-id $RepoMigrations["c2b-fw"] }
if ($RepoMigrations["c2b-fw"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-tuner-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-tuner-rcip"] }
if ($RepoMigrations["polaris-tuner-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_INDIAN_VCM_Posn4_Raptor"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_INDIAN_VCM_Posn4_Raptor"] }
if ($RepoMigrations["RCP_INDIAN_VCM_Posn4_Raptor"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ccu2_build"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ccu2_build"] }
if ($RepoMigrations["ccu2_build"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-tt-ccu"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-tt-ccu"] }
if ($RepoMigrations["meta-tt-ccu"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["meta-tt-atmel"]) { gh gei wait-for-migration --migration-id $RepoMigrations["meta-tt-atmel"] }
if ($RepoMigrations["meta-tt-atmel"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Line-F-Code"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Line-F-Code"] }
if ($RepoMigrations["Line-F-Code"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["BeagleBoardEOLTCode"]) { gh gei wait-for-migration --migration-id $RepoMigrations["BeagleBoardEOLTCode"] }
if ($RepoMigrations["BeagleBoardEOLTCode"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_ePCM_Frontier"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_ePCM_Frontier"] }
if ($RepoMigrations["RCP_COMMON_ePCM_Frontier"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["speaker-hal"]) { gh gei wait-for-migration --migration-id $RepoMigrations["speaker-hal"] }
if ($RepoMigrations["speaker-hal"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Tools_PKT"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Tools_PKT"] }
if ($RepoMigrations["Tools_PKT"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["BSW_PKT_SCM"]) { gh gei wait-for-migration --migration-id $RepoMigrations["BSW_PKT_SCM"] }
if ($RepoMigrations["BSW_PKT_SCM"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["pulseaudio"]) { gh gei wait-for-migration --migration-id $RepoMigrations["pulseaudio"] }
if ($RepoMigrations["pulseaudio"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["FreeRTOS-Kernel"]) { gh gei wait-for-migration --migration-id $RepoMigrations["FreeRTOS-Kernel"] }
if ($RepoMigrations["FreeRTOS-Kernel"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-vcard-parser"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-vcard-parser"] }
if ($RepoMigrations["polaris-vcard-parser"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_GENERAL_TCM_AdmiralpCVT"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_GENERAL_TCM_AdmiralpCVT"] }
if ($RepoMigrations["RCP_GENERAL_TCM_AdmiralpCVT"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-universal-buttons"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-universal-buttons"] }
if ($RepoMigrations["polaris-universal-buttons"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-bt-audio"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-bt-audio"] }
if ($RepoMigrations["polaris-bt-audio"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_MRZR_GCM_AlphaHybridGenerator"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_MRZR_GCM_AlphaHybridGenerator"] }
if ($RepoMigrations["RCP_MRZR_GCM_AlphaHybridGenerator"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["radio-complianced"]) { gh gei wait-for-migration --migration-id $RepoMigrations["radio-complianced"] }
if ($RepoMigrations["radio-complianced"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_VES2024_Minigolf"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_VES2024_Minigolf"] }
if ($RepoMigrations["VC_VES2024_Minigolf"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Boilerplate_OEH"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Boilerplate_OEH"] }
if ($RepoMigrations["Boilerplate_OEH"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ves-ops-tf-grunt"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ves-ops-tf-grunt"] }
if ($RepoMigrations["ves-ops-tf-grunt"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ves-ops-tf-poc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ves-ops-tf-poc"] }
if ($RepoMigrations["ves-ops-tf-poc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_MomentaryWiper"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_MomentaryWiper"] }
if ($RepoMigrations["VC_MomentaryWiper"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_LeanAngleLearn"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_LeanAngleLearn"] }
if ($RepoMigrations["VC_LeanAngleLearn"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_INDIAN_VCM_Posn1_RaptorMY24"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_INDIAN_VCM_Posn1_RaptorMY24"] }
if ($RepoMigrations["PROD_INDIAN_VCM_Posn1_RaptorMY24"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ves-ops-tf-modules"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ves-ops-tf-modules"] }
if ($RepoMigrations["ves-ops-tf-modules"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["CommonApp-KitchenSink"]) { gh gei wait-for-migration --migration-id $RepoMigrations["CommonApp-KitchenSink"] }
if ($RepoMigrations["CommonApp-KitchenSink"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["CronusHydraulicEcosystem"]) { gh gei wait-for-migration --migration-id $RepoMigrations["CronusHydraulicEcosystem"] }
if ($RepoMigrations["CronusHydraulicEcosystem"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["SANDBOX"]) { gh gei wait-for-migration --migration-id $RepoMigrations["SANDBOX"] }
if ($RepoMigrations["SANDBOX"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_COMMON_MBB_BMU_Thor_Loki"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_COMMON_MBB_BMU_Thor_Loki"] }
if ($RepoMigrations["PROD_COMMON_MBB_BMU_Thor_Loki"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-localization-sub"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-localization-sub"] }
if ($RepoMigrations["polaris-localization-sub"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ves-ops-template"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ves-ops-template"] }
if ($RepoMigrations["ves-ops-template"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_COMMON_HECU_CutterBrake"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_COMMON_HECU_CutterBrake"] }
if ($RepoMigrations["PROD_COMMON_HECU_CutterBrake"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Tools_CNT"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Tools_CNT"] }
if ($RepoMigrations["Tools_CNT"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_INDIAN_VCM_AdpvRideHei"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_INDIAN_VCM_AdpvRideHei"] }
if ($RepoMigrations["RCP_INDIAN_VCM_AdpvRideHei"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_SCM_HydraulicEcosystem"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_SCM_HydraulicEcosystem"] }
if ($RepoMigrations["RCP_COMMON_SCM_HydraulicEcosystem"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Boilerplate_PKT_P300Q"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Boilerplate_PKT_P300Q"] }
if ($RepoMigrations["Boilerplate_PKT_P300Q"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["BSW_PKT_P300Q"]) { gh gei wait-for-migration --migration-id $RepoMigrations["BSW_PKT_P300Q"] }
if ($RepoMigrations["BSW_PKT_P300Q"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["DeployerApp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["DeployerApp"] }
if ($RepoMigrations["DeployerApp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["recover_units"]) { gh gei wait-for-migration --migration-id $RepoMigrations["recover_units"] }
if ($RepoMigrations["recover_units"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ves-ops-action-runner"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ves-ops-action-runner"] }
if ($RepoMigrations["ves-ops-action-runner"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["bluez"]) { gh gei wait-for-migration --migration-id $RepoMigrations["bluez"] }
if ($RepoMigrations["bluez"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["secureboot"]) { gh gei wait-for-migration --migration-id $RepoMigrations["secureboot"] }
if ($RepoMigrations["secureboot"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_SCM_GenericCurrentController"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_SCM_GenericCurrentController"] }
if ($RepoMigrations["RCP_COMMON_SCM_GenericCurrentController"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RZR_SmartBlend"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RZR_SmartBlend"] }
if ($RepoMigrations["RCP_RZR_SmartBlend"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ivi-architecture"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ivi-architecture"] }
if ($RepoMigrations["ivi-architecture"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["koala"]) { gh gei wait-for-migration --migration-id $RepoMigrations["koala"] }
if ($RepoMigrations["koala"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_RANGER_VCM_Posn1_Thor_MY23_MY24"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_RANGER_VCM_Posn1_Thor_MY23_MY24"] }
if ($RepoMigrations["PROD_RANGER_VCM_Posn1_Thor_MY23_MY24"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-universal-buttons-tester"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-universal-buttons-tester"] }
if ($RepoMigrations["polaris-universal-buttons-tester"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["mwr-devops-playground"]) { gh gei wait-for-migration --migration-id $RepoMigrations["mwr-devops-playground"] }
if ($RepoMigrations["mwr-devops-playground"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-ublx"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-ublx"] }
if ($RepoMigrations["polaris-ublx"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RANGER_AMP"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RANGER_AMP"] }
if ($RepoMigrations["RCP_RANGER_AMP"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_VSMPriority"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_VSMPriority"] }
if ($RepoMigrations["VC_VSMPriority"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["janus"]) { gh gei wait-for-migration --migration-id $RepoMigrations["janus"] }
if ($RepoMigrations["janus"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["devops-test"]) { gh gei wait-for-migration --migration-id $RepoMigrations["devops-test"] }
if ($RepoMigrations["devops-test"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["DesktopSupport"]) { gh gei wait-for-migration --migration-id $RepoMigrations["DesktopSupport"] }
if ($RepoMigrations["DesktopSupport"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-universal-buttons-tester-depricated"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-universal-buttons-tester-depricated"] }
if ($RepoMigrations["polaris-universal-buttons-tester-depricated"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_Horn"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_Horn"] }
if ($RepoMigrations["VC_Horn"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Tools_BCH"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Tools_BCH"] }
if ($RepoMigrations["Tools_BCH"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RANGER_AMPbatt"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RANGER_AMPbatt"] }
if ($RepoMigrations["RCP_RANGER_AMPbatt"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_BoschSharingPoc"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_BoschSharingPoc"] }
if ($RepoMigrations["RCP_COMMON_BoschSharingPoc"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_VCM_Gen3_CronusEnablement"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_VCM_Gen3_CronusEnablement"] }
if ($RepoMigrations["RCP_COMMON_VCM_Gen3_CronusEnablement"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Tools_OEH"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Tools_OEH"] }
if ($RepoMigrations["Tools_OEH"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_Headlight"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_Headlight"] }
if ($RepoMigrations["VC_Headlight"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_B1C4_APP"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_B1C4_APP"] }
if ($RepoMigrations["RCP_COMMON_B1C4_APP"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_MotorCycle_ePCM_eReverse"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_MotorCycle_ePCM_eReverse"] }
if ($RepoMigrations["RCP_MotorCycle_ePCM_eReverse"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["versioning"]) { gh gei wait-for-migration --migration-id $RepoMigrations["versioning"] }
if ($RepoMigrations["versioning"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_GATEWAY_M110"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_GATEWAY_M110"] }
if ($RepoMigrations["RCP_COMMON_GATEWAY_M110"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-BLE-server"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-BLE-server"] }
if ($RepoMigrations["polaris-BLE-server"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-qt-builder"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-qt-builder"] }
if ($RepoMigrations["polaris-qt-builder"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["docker-base"]) { gh gei wait-for-migration --migration-id $RepoMigrations["docker-base"] }
if ($RepoMigrations["docker-base"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["action-release-action"]) { gh gei wait-for-migration --migration-id $RepoMigrations["action-release-action"] }
if ($RepoMigrations["action-release-action"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["action-composite-action-template"]) { gh gei wait-for-migration --migration-id $RepoMigrations["action-composite-action-template"] }
if ($RepoMigrations["action-composite-action-template"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["action-manual-version-bump"]) { gh gei wait-for-migration --migration-id $RepoMigrations["action-manual-version-bump"] }
if ($RepoMigrations["action-manual-version-bump"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCIPLogAnalysis"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCIPLogAnalysis"] }
if ($RepoMigrations["RCIPLogAnalysis"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["action-github-tag-action"]) { gh gei wait-for-migration --migration-id $RepoMigrations["action-github-tag-action"] }
if ($RepoMigrations["action-github-tag-action"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RZR_GCM_AST"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RZR_GCM_AST"] }
if ($RepoMigrations["RCP_RZR_GCM_AST"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-thermald"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-thermald"] }
if ($RepoMigrations["polaris-thermald"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["gopro"]) { gh gei wait-for-migration --migration-id $RepoMigrations["gopro"] }
if ($RepoMigrations["gopro"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_LoadShed"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_LoadShed"] }
if ($RepoMigrations["VC_LoadShed"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["comtech-nav-ltk"]) { gh gei wait-for-migration --migration-id $RepoMigrations["comtech-nav-ltk"] }
if ($RepoMigrations["comtech-nav-ltk"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_DarkMode"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_DarkMode"] }
if ($RepoMigrations["VC_DarkMode"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["comtech-ltk-adaptor"]) { gh gei wait-for-migration --migration-id $RepoMigrations["comtech-ltk-adaptor"] }
if ($RepoMigrations["comtech-ltk-adaptor"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_Immobilizer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_Immobilizer"] }
if ($RepoMigrations["VC_Immobilizer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["devops_playground"]) { gh gei wait-for-migration --migration-id $RepoMigrations["devops_playground"] }
if ($RepoMigrations["devops_playground"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_EngineStartControl"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_EngineStartControl"] }
if ($RepoMigrations["VC_EngineStartControl"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["settime_webservice"]) { gh gei wait-for-migration --migration-id $RepoMigrations["settime_webservice"] }
if ($RepoMigrations["settime_webservice"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["SetHardwareID"]) { gh gei wait-for-migration --migration-id $RepoMigrations["SetHardwareID"] }
if ($RepoMigrations["SetHardwareID"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["hardware_id_publisher"]) { gh gei wait-for-migration --migration-id $RepoMigrations["hardware_id_publisher"] }
if ($RepoMigrations["hardware_id_publisher"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["camera-service-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["camera-service-rcip"] }
if ($RepoMigrations["camera-service-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ci-templates"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ci-templates"] }
if ($RepoMigrations["ci-templates"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["finalizer"]) { gh gei wait-for-migration --migration-id $RepoMigrations["finalizer"] }
if ($RepoMigrations["finalizer"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_SKIM"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_SKIM"] }
if ($RepoMigrations["VC_SKIM"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["recover_units_v2"]) { gh gei wait-for-migration --migration-id $RepoMigrations["recover_units_v2"] }
if ($RepoMigrations["recover_units_v2"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["comtech-polarispoitool"]) { gh gei wait-for-migration --migration-id $RepoMigrations["comtech-polarispoitool"] }
if ($RepoMigrations["comtech-polarispoitool"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["comtech-polarispoiscript"]) { gh gei wait-for-migration --migration-id $RepoMigrations["comtech-polarispoiscript"] }
if ($RepoMigrations["comtech-polarispoiscript"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_WakeLineControl"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_WakeLineControl"] }
if ($RepoMigrations["VC_WakeLineControl"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_InternalStateControl"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_InternalStateControl"] }
if ($RepoMigrations["VC_InternalStateControl"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_IlluminationBrightnessSetting"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_IlluminationBrightnessSetting"] }
if ($RepoMigrations["VC_IlluminationBrightnessSetting"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["koala-builder"]) { gh gei wait-for-migration --migration-id $RepoMigrations["koala-builder"] }
if ($RepoMigrations["koala-builder"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_BlindSpotDetection"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_BlindSpotDetection"] }
if ($RepoMigrations["VC_BlindSpotDetection"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["yocto-builder"]) { gh gei wait-for-migration --migration-id $RepoMigrations["yocto-builder"] }
if ($RepoMigrations["yocto-builder"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["yocto-package-version-finder"]) { gh gei wait-for-migration --migration-id $RepoMigrations["yocto-package-version-finder"] }
if ($RepoMigrations["yocto-package-version-finder"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_COMMON_GVCM_CRONUS"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_COMMON_GVCM_CRONUS"] }
if ($RepoMigrations["PROD_COMMON_GVCM_CRONUS"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_BatterySaver"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_BatterySaver"] }
if ($RepoMigrations["VC_BatterySaver"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["python-utils"]) { gh gei wait-for-migration --migration-id $RepoMigrations["python-utils"] }
if ($RepoMigrations["python-utils"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Boilerplate_PCI_VCM_Gen2-1_Git_Runner"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Boilerplate_PCI_VCM_Gen2-1_Git_Runner"] }
if ($RepoMigrations["Boilerplate_PCI_VCM_Gen2-1_Git_Runner"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Appareo-TCU"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Appareo-TCU"] }
if ($RepoMigrations["Appareo-TCU"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_NSftyWarn"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_NSftyWarn"] }
if ($RepoMigrations["VC_NSftyWarn"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_RANGER_AMP_M130"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_RANGER_AMP_M130"] }
if ($RepoMigrations["RCP_RANGER_AMP_M130"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["MBD_YML"]) { gh gei wait-for-migration --migration-id $RepoMigrations["MBD_YML"] }
if ($RepoMigrations["MBD_YML"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_VCM_Posn1_Driveline_Modes"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_VCM_Posn1_Driveline_Modes"] }
if ($RepoMigrations["RCP_COMMON_VCM_Posn1_Driveline_Modes"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["variant_manager"]) { gh gei wait-for-migration --migration-id $RepoMigrations["variant_manager"] }
if ($RepoMigrations["variant_manager"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["dev-input-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["dev-input-rcip"] }
if ($RepoMigrations["dev-input-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCP_COMMON_BCM_Mauler"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCP_COMMON_BCM_Mauler"] }
if ($RepoMigrations["RCP_COMMON_BCM_Mauler"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["android-auto"]) { gh gei wait-for-migration --migration-id $RepoMigrations["android-auto"] }
if ($RepoMigrations["android-auto"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["weblink"]) { gh gei wait-for-migration --migration-id $RepoMigrations["weblink"] }
if ($RepoMigrations["weblink"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["rcip-flash-util"]) { gh gei wait-for-migration --migration-id $RepoMigrations["rcip-flash-util"] }
if ($RepoMigrations["rcip-flash-util"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_DrvLnMode"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_DrvLnMode"] }
if ($RepoMigrations["VC_DrvLnMode"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["IaC_NewLargeRunner"]) { gh gei wait-for-migration --migration-id $RepoMigrations["IaC_NewLargeRunner"] }
if ($RepoMigrations["IaC_NewLargeRunner"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Flash_utility"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Flash_utility"] }
if ($RepoMigrations["Flash_utility"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Boilerplate_PKT_VCM_v2_2"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Boilerplate_PKT_VCM_v2_2"] }
if ($RepoMigrations["Boilerplate_PKT_VCM_v2_2"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["BSW_PKT_VCM_v2_2"]) { gh gei wait-for-migration --migration-id $RepoMigrations["BSW_PKT_VCM_v2_2"] }
if ($RepoMigrations["BSW_PKT_VCM_v2_2"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["Automation-script-next-gen"]) { gh gei wait-for-migration --migration-id $RepoMigrations["Automation-script-next-gen"] }
if ($RepoMigrations["Automation-script-next-gen"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_COMMOM_PKTCM_NoRunApp"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_COMMOM_PKTCM_NoRunApp"] }
if ($RepoMigrations["PROD_COMMOM_PKTCM_NoRunApp"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-exynos-keystore"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-exynos-keystore"] }
if ($RepoMigrations["polaris-exynos-keystore"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["yocto-build-utilities"]) { gh gei wait-for-migration --migration-id $RepoMigrations["yocto-build-utilities"] }
if ($RepoMigrations["yocto-build-utilities"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["tel_cybersecurity"]) { gh gei wait-for-migration --migration-id $RepoMigrations["tel_cybersecurity"] }
if ($RepoMigrations["tel_cybersecurity"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["pub-fct"]) { gh gei wait-for-migration --migration-id $RepoMigrations["pub-fct"] }
if ($RepoMigrations["pub-fct"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["RCIP_EOLT"]) { gh gei wait-for-migration --migration-id $RepoMigrations["RCIP_EOLT"] }
if ($RepoMigrations["RCIP_EOLT"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["PROD_INDIAN_Pektron_Posn1_Carbide"]) { gh gei wait-for-migration --migration-id $RepoMigrations["PROD_INDIAN_Pektron_Posn1_Carbide"] }
if ($RepoMigrations["PROD_INDIAN_Pektron_Posn1_Carbide"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["TPMS"]) { gh gei wait-for-migration --migration-id $RepoMigrations["TPMS"] }
if ($RepoMigrations["TPMS"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["polaris-privacy-logger-rcip"]) { gh gei wait-for-migration --migration-id $RepoMigrations["polaris-privacy-logger-rcip"] }
if ($RepoMigrations["polaris-privacy-logger-rcip"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["settime"]) { gh gei wait-for-migration --migration-id $RepoMigrations["settime"] }
if ($RepoMigrations["settime"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["VC_HCSM"]) { gh gei wait-for-migration --migration-id $RepoMigrations["VC_HCSM"] }
if ($RepoMigrations["VC_HCSM"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["ScannerWatchdog"]) { gh gei wait-for-migration --migration-id $RepoMigrations["ScannerWatchdog"] }
if ($RepoMigrations["ScannerWatchdog"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }

if ($RepoMigrations["BluetoothWatcher"]) { gh gei wait-for-migration --migration-id $RepoMigrations["BluetoothWatcher"] }
if ($RepoMigrations["BluetoothWatcher"] -and $lastexitcode -eq 0) { $Succeeded++ } else { $Failed++ }


Write-Host =============== Summary ===============
Write-Host Total number of successful migrations: $Succeeded
Write-Host Total number of failed migrations: $Failed

if ($Failed -ne 0) {
    exit 1
}


