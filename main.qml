import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.2
import "."
import "./images"

ApplicationWindow {
    id: application
    visible: true
    minimumWidth: 325
    minimumHeight: 650
    title: qsTr("Kpuppetter - v0.1")

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

        buttonDial.onClicked: { dial(dialNumber.text, global.line) }

        ////other stuff
        buttonHelp.onClicked: {
            FileIO.readLines(1, global.logFilePath);
        } //implement
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
        buttonRedial.onClicked: { request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=RD') }
        buttonConf.onClicked: { request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=MUTE') }
        buttonMsg.onClicked: { request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=MSG') }
        buttonTransfer.onClicked: { request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=F_TRANSFER') }
        buttonCancel.onClicked: { request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=X') }
        buttonHold.onClicked: { request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=F_HOLD') }
        buttonSpeaker.onClicked: { request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=SPEAKER') }
        buttonHeadset.onClicked: { request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=HEADSET') }
        buttonMute.onClicked: { request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=MUTE') }
        switchDND.onClicked: {
            if (switchDND.checked) {
                request('http://'+global.login+':'+global.password+'@'+global.ip+'/cgi-bin/ConfigManApp.com?key=DNDOn');
            }
            else {
                request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=DNDOff');
            }
        }


        buttonLine1.onClicked: {
            buttonLine1.font.underline = true;
            buttonLine2.font.underline = false;
            buttonLine3.font.underline = false;
            global.line="1";
//            if (buttonLine1.font.underline){
//                buttonLine1.font.underline = false
//            }
//            else {
//                buttonLine1.font.underline = true
//            }
//            request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=L1');
        }

        buttonLine2.onClicked: {
            buttonLine1.font.underline = false;
            buttonLine2.font.underline = true;
            buttonLine3.font.underline = false;
            global.line="2";
//            if (buttonLine2.font.underline){
//                buttonLine2.font.underline = false
//            }
//            else {
//                buttonLine2.font.underline = true
//            }
//            request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=L2');
        }
        buttonLine3.onClicked: {
            buttonLine1.font.underline = false;
            buttonLine2.font.underline = false;
            buttonLine3.font.underline = true;
            global.line="3";
//            if (buttonLine3.font.underline){
//                buttonLine3.font.underline = false
//            }
//            else {
//                buttonLine3.font.underline = true
//            }
//            request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=L3');
        }
    }

    ApplicationWindow{
        id: settingsWindow
        visible: false
        x: application.x+335
        y: application.y

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

    Item {
        QtObject {
            id: global;
            property var logFilePath: "C:/Users/Khomp/Documents/QTprojects/pptr/log.txt";
            property var settingsFilePath: "C:/Users/Khomp/Documents/QTprojects/pptr/settings.txt";
            property var line: "1";
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
        var credentials = getCredentials();
        if (number!=""){
            request('http://'+getCredentials()+'/goform/SavePhoneCallInfoCfg?DialNumber='+number+'&Operate=Dail&BlackListAccountID='+line);
            console.log('http://'+getCredentials()+'/goform/SavePhoneCallInfoCfg?DialNumber='+number+'&Operate=Dail&BlackListAccountID='+line);
            log('Dialing: '+number);
        }

        mainWindow.dialNumber.text = qsTr('');
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
        log("request", "registered");
    }
    function slotOffhook(){
        log("request", "offhook");
    }
    function slotOnhook(){
        log("request", "onhook");
    }
    function slotIncoming(){
        log("request", "incoming");
    }
    function slotOutgoing(){
        log("request", "outgoing");
        mainWindow.iconDial.source = "images/phone-volume.png";
        mainWindow.iconDial.rotation = 0;
    }
    function slotEstabilished(){
        log("request", "estabilished");
    }
    function slotTerminated(){
        log("request", "terminated");
        mainWindow.iconDial.source = "images/phone-1.png";
        mainWindow.iconDial.rotation = 135;
    }
    function slotMissed(){
        log("request", "missed");
    }


}



//
