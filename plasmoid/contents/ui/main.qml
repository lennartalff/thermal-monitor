import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id : main
    Plasmoid.preferredRepresentation : Plasmoid.fullRepresentation
    anchors.fill: parent
    Layout.minimumWidth: cpuItem.width

    TemperatureItem {id: cpuItem; device: "CPU"; customHeight: parent.height/2; anchors.top: parent.top}
    TemperatureItem {id: gpuItem; device: "GPU"; customHeight: parent.height/2; anchors.bottom: parent.bottom}


    PlasmaCore.DataSource {
        id : cpuSource
        engine : "systemmonitor"
        connectedSources : ["lmsensors/coretemp-isa-0000/Package_id_0"]
        interval : 1000

        onNewData : {
            if (data.value === undefined) {
                cpuItem.temperature = "00°C"
                return
            }
            cpuItem.temperature = Math.round(data.value) + "°C"
        }
    }
    PlasmaCore.DataSource {
        id: gpuSource
        engine: "executable"
        property string nvidiaSource: "nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader"
        connectedSources: [nvidiaSource]
        interval: 1000

        onNewData: {
            gpuItem.temperature = Math.round(data.stdout) + "°C"
        }
    }
}
