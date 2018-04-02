import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.2
import "."
import "./images"

ApplicationWindow {
    id: application
    visible: true
    minimumWidth: 325
    minimumHeight: 650
    title: qsTr("Kpuppetter - ALPHA version")

    MainForm {
        id: mainWindow;
        anchors.fill: parent;

        ////dial stuff
        roundButton0.onClicked: { dialNumber.text = dialNumber.text+'0' }
        roundButton1.onClicked: { dialNumber.text = dialNumber.text+'1' }
        roundButton2.onClicked: { dialNumber.text = dialNumber.text+'2' }
        roundButton3.onClicked: { dialNumber.text = dialNumber.text+'3' }
        roundButton4.onClicked: { dialNumber.text = dialNumber.text+'4' }
        roundButton5.onClicked: { dialNumber.text = dialNumber.text+'5' }
        roundButton6.onClicked: { dialNumber.text = dialNumber.text+'6' }
        roundButton7.onClicked: { dialNumber.text = dialNumber.text+'7' }
        roundButton8.onClicked: { dialNumber.text = dialNumber.text+'8' }
        roundButton9.onClicked: { dialNumber.text = dialNumber.text+'9' }
        roundButton10.onClicked: { dialNumber.text = dialNumber.text+'*' }
        roundButton11.onClicked: { dialNumber.text = dialNumber.text+'POUND' }

        buttonDial.onClicked: {
            if (mainWindow.iconDial.rotation == 0){
                request('http://'+getCredentials()+'/goform/SavePhoneCallInfoCfg?Operate=Hangup');
                mainWindow.iconDial.source = "images/phone-1.png";
                mainWindow.iconDial.rotation = 135;
            }
            else{
                dial(dialNumber.text, global.line);
            }

        }

        ////other stuff
        buttonHelp.onClicked: {
            FileIO.openUrlFile("C:/pptr/help.html");
//            popup.visible = true;
        }
        dialNumber.onAccepted: { dial(dialNumber.text, global.line) }
        buttonList.onClicked: {
            memoryWindow.visible = true;
            memoryWindow.x = application.x-410;
            memoryWindow.y = application.y;
        }
        buttonSettings.onClicked: {
            settingsWindow.visible = true;
            settings.ipAddress.text = qsTr(FileIO.readLines(0, global.settingsFilePath));
            settings.login.text = qsTr(FileIO.readLines(1, global.settingsFilePath));
            settings.password.text = qsTr(FileIO.readLines(2, global.settingsFilePath));
        }
        buttonRedial.onClicked: {
            command('SPEAKER');
            command('RD');
        }
        buttonConf.onClicked: { command('F_CONFERENCE') }
        buttonMsg.onClicked: { command('MSG') }
        buttonTransfer.onClicked: { command('F_TRANSFER') }
        buttonCancel.onClicked: { command('X') }
        buttonHold.onClicked: { command('F_HOLD') }
        buttonSpeaker.onClicked: { command('SPEAKER') }
        buttonHeadset.onClicked: { command('HEADSET') }
        buttonMute.onClicked: { command('MUTE') }
        switchDND.onClicked: {
            if (switchDND.checked) {
                command('DNDOn');
            } else {
                command('DNDOff');
            }
        }

        buttonLine1.onClicked: {
            buttonLine1.font.underline = true;
            buttonLine2.font.underline = false;
            buttonLine3.font.underline = false;
            global.line=0;

        }

        buttonLine2.onClicked: {
            buttonLine1.font.underline = false;
            buttonLine2.font.underline = true;
            buttonLine3.font.underline = false;
            global.line=1;
        }
        buttonLine3.onClicked: {
            buttonLine1.font.underline = false;
            buttonLine2.font.underline = false;
            buttonLine3.font.underline = true;
            global.line=2;
        }
    }

    ApplicationWindow{
        id: settingsWindow
        visible: false
        x: application.x+335
        y: application.y
        width: 300
        height: 420


        signal ipChangedSignal(string text);
        signal loginChangedSignal(string text);
        signal passwordChangedSignal(string text);
        title: qsTr("Kpuppetter - v0.1 - Settings");

        SettingsForm {
            id:settings;
            ipAddress.onAccepted: {
                FileIO.overwriteLine(0, ipAddress.text, global.settingsFilePath);
                log("ip changed");
            }
            login.onAccepted: {
                FileIO.overwriteLine(1, login.text, global.settingsFilePath);
                log("login changed");
            }
            password.onAccepted: {
                FileIO.overwriteLine(2, password.text, global.settingsFilePath);
                log("password changed");
            }
            showPassword.onPressed: {
                password.echoMode = TextInput.Normal
            }
            showPassword.onReleased: {
                password.echoMode = TextInput.Password
            }
        }
    }


    ApplicationWindow {
        id: memoryWindow
        visible: false
        width: 400
        height: 400
        title: qsTr("Kpuppetter - v0.1 - Memory")

        MemoryForm {
            button0.onClicked: { dial(number0.text, global.line) }
            button1.onClicked: { dial(number1.text, global.line) }
            button2.onClicked: { dial(number2.text, global.line) }
            button3.onClicked: { dial(number3.text, global.line) }
            button4.onClicked: { dial(number4.text, global.line) }
            button5.onClicked: { dial(number5.text, global.line) }
            button6.onClicked: { dial(number6.text, global.line) }
            button7.onClicked: { dial(number7.text, global.line) }
            button8.onClicked: { dial(number8.text, global.line) }
            button9.onClicked: { dial(number9.text, global.line) }
            button10.onClicked: { dial(number10.text, global.line) }
            button11.onClicked: { dial(number11.text, global.line) }
        }
    }

    ApplicationWindow {
        id: popup
        visible: false
        width: 250
        height: 120

        IncomingCallForm {
            answerButton.onClicked: {
                command('F1');
                popup.visible = false;
                mainWindow.iconDial.source = "images/phone-volume.png";
                mainWindow.iconDial.rotation = 0;
            }
            rejectButton.onClicked: {
                command('X');
                popup.visible = false;
                mainWindow.iconDial.source = "images/phone-1.png";
                mainWindow.iconDial.rotation = 135;
            }
        }
    }

    Item {
        QtObject {
            id: global;
            property var logFilePath: "C:/pptr/log.txt";
            property var settingsFilePath: "C:/pptr/settings.txt";
            property var line: 0;
//            property var status;
        }

    }


    // this function is included locally, but you can also include separately via a header definition
    function request(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.send('');
    }

    function dial(number, line){
        //to be implemented
        //trocar pontos por asteriscos antes de enviar
        //vericiar se a chamada já não foi iniciada com o uso de POUND
        //verificar se a chamada eh sip ou ip
//        var credentials = getCredentials();
        if (number!=""){
            request('http://'+getCredentials()+'/goform/SavePhoneCallInfoCfg?DialNumber='+number+'&Operate=Dail&BlackListAccountID='+line);
            console.log('http://'+getCredentials()+'/goform/SavePhoneCallInfoCfg?DialNumber='+number+'&Operate=Dail&BlackListAccountID='+line);
            log('Dialing: '+number+', line '+(line+1));
        }

        mainWindow.dialNumber.text = qsTr('');
    }

    function command(code){
        request('http://'+getCredentials()+'/cgi-bin/ConfigManApp.com?key='+code);
        log('command: '+code);
        return 0;
    }

    function log(text){
        var append = "[ "+getTime()+" ] "+text;
        mainWindow.logText.text = qsTr(mainWindow.logText.text+"\n"+append);
        mainWindow.scrollBar.position = 1;  //autoscroll
        mainWindow.scrollBar.increase();    //gambiarra para o autoscroll funcionar corretamente

        FileIO.appendToEnd(append, global.logFilePath);  //salva no log.txt
        return 0;
    }

    function getCredentials() {
        var ip = FileIO.readLines(0, global.settingsFilePath);
        var login = FileIO.readLines(1, global.settingsFilePath);
        var password = FileIO.readLines(2, global.settingsFilePath);
        return login+':'+password+'@'+ip;
}

    function getTime(){
        var d = new Date();
        return d.getDate()+"/"+d.getMonth()+"/"+d.getFullYear()+"-"+d.getHours()+":"+d.getMinutes();
    }

    /// slot functions

    function slotRegistered(){
        log("status: registered");
    }
    function slotOffhook(){
        log("status: offhook");
    }
    function slotOnhook(){
        log("status: onhook");
    }
    function slotIncoming(){
        log("status: incoming");
        popup.visible = true;
    }
    function slotOutgoing(){
        log("status: outgoing");
//        global.status = "calling";
        mainWindow.iconDial.source = "images/phone-volume.png";
        mainWindow.iconDial.rotation = 0;
    }
    function slotEstabilished(){
        log("status: estabilished");
    }
    function slotTerminated(){
        log("status: terminated");
//        global.status = "idle";
        mainWindow.iconDial.source = "images/phone-1.png";
        mainWindow.iconDial.rotation = 135;
    }
    function slotMissed(){
        log("status: missed");
    }


}



//
