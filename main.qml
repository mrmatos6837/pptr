import QtQuick 2.9
import QtQuick.Controls 2.2
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
        buttonHelp.onClicked: {} //implement
        dialNumber.onAccepted: { dial(dialNumber.text, global.line) }
        buttonList.onClicked: {
            memoryWindow.visible = true;
            memoryWindow.x = application.x-410;
            memoryWindow.y = application.y;
        }
        buttonSettings.onClicked: { settingsWindow.visible = true }
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
//        width: 200
//        height:200
        title: qsTr("Kpuppetter - v0.1 - Settings")

        SettingsForm {
            ipValue.onAccepted: {
                global.ip = ipValue.text;
                log("ip", "changed")
            }
            login.onAccepted: {
                global.login = login.text;
                log("login", "changed")
            }
            password.onAccepted: {
                global.password = password.text;
                log("password", "changed")
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
            property var log1: "";
            property var log2: "";
            property var log3: "";
            property var ip: "172.16.4.200";
            property var login: "root";
            property var password: "root";
            property var line: "1";
            //property var dialNumber;
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
        if (number!=""){
            request('http://'+global.login+':'+global.password+'@'+global.ip+'/goform/SavePhoneCallInfoCfg?DialNumber='+number+'&Operate=Dail&BlackListAccountID='+line);
            console.log('http://'+global.login+':'+global.password+'@'+global.ip+'/goform/SavePhoneCallInfoCfg?DialNumber='+number+'&Operate=Dail&BlackListAccountID='+line);
            log('dialing', number);
        }

        mainWindow.dialNumber.text = qsTr('');
    }

    function log(action, text){ //desativado por hora

        mainWindow.logText.text = qsTr(mainWindow.logText.text+"\n"+action+": "+text)
//        global.log1 = global.log2
//        global.log2 = global.log3
//        global.log3 = action+": "+text
//        mainWindow.logText.text=qsTr(global.log1+'\n'+global.log2+'\n'+global.log3);
        mainWindow.scrollBar.position = 1;
        mainWindow.scrollBar.increase();
        return 0
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
