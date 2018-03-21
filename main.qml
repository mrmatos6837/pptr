import QtQuick 2.9
import QtQuick.Controls 2.2
import "."
import "./images"

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 326
    height: 653
    title: qsTr("Kpuppetter - v0.1")

    MainForm {
        id: pelamordedeus;
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

        buttonDial.onClicked: { dial(dialNumber.text, '1') }

        ////other stuff
        buttonHelp.onClicked: {} //implement
        dialNumber.onAccepted: { dial(dialNumber.text, '1') }
        buttonList.onClicked: { memoryWindow.visible = true }
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
            buttonLine2.font.underline = false;
            buttonLine3.font.underline = false;
            if (buttonLine1.font.underline){
                buttonLine1.font.underline = false
            }
            else {
                buttonLine1.font.underline = true
            }
            request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=L1');
        }

        buttonLine2.onClicked: {
            buttonLine1.font.underline = false;
            buttonLine3.font.underline = false;
            if (buttonLine2.font.underline){
                buttonLine2.font.underline = false
            }
            else {
                buttonLine2.font.underline = true
            }
            request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=L2');
        }
        buttonLine3.onClicked: {
            buttonLine1.font.underline = false
            buttonLine2.font.underline = false
            if (buttonLine3.font.underline){
                buttonLine3.font.underline = false
            }
            else {
                buttonLine3.font.underline = true
            }
            request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=L3');
        }
    }

    ApplicationWindow{
        id: settingsWindow
        visible: false
        width: 200
        height:400
        title: qsTr("Kpuppetter - v0.1 - Settings")

        SettingsForm {
            ipValue.onAccepted: {
                global.ip = ipValue.text;
                pelamordedeus.logText.text = qsTr(global.ip);
            }
            login.onAccepted: {
                global.login = login.text;
                pelamordedeus.logText.text = qsTr(global.login);
            }
            password.onAccepted: {
                global.password = password.text;
                pelamordedeus.logText.text = qsTr(global.password);
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
            button0.onClicked: { dial(number0.text, "1") }
            button1.onClicked: { dial(number1.text, "1") }
            button2.onClicked: { dial(number2.text, "1") }
            button3.onClicked: { dial(number3.text, "1") }
            button4.onClicked: { dial(number4.text, "1") }
            button5.onClicked: { dial(number5.text, "1") }
            button6.onClicked: { dial(number6.text, "1") }
            button7.onClicked: { dial(number7.text, "1") }
            button8.onClicked: { dial(number8.text, "1") }
            button9.onClicked: { dial(number9.text, "1") }
            button10.onClicked: { dial(number10.text, "1") }
            button11.onClicked: { dial(number11.text, "1") }
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
        //

//        request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=SPEAKER');
//        //        request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key='+number);
//        request('http://'+global.login+':'+global.password+'@'+global.ip+'/cgi-bin/ConfigManApp.com?key='+number);
//        request('http://root:root@172.16.4.200/cgi-bin/ConfigManApp.com?key=F1'); //confirm dial

        request('http://'+global.login+':'+global.password+'@'+global.ip+'/goform/SavePhoneCallInfoCfg?DialNumber='+number+'&Operate=Dail&BlackListAccountID='+line);
        pelamordedeus.logText.text=qsTr(log('dialing', number))
        ////log dial
        //        logLine1 = logLine2;
        //        logLine2 = logLine3;
        //        logLine3 = 'dialing '+dialNumber.text;
        //        logText.text = qsTr(logLine1+'\n'+logLine2+'\n'+logLine3);

//        global.log1 = global.log2;
//        global.log2 = global.log3;
//        global.log3 = 'dialing '+mainWindow.MainForm.dialNumber.text;
//        mainWindow.logText.text = qsTr(global.log1+'\n'+global.log2+'\n'+global.log3);

        ////clear variables
        pelamordedeus.dialNumber.text = qsTr('');

    }

    function log(action, text){ //desativado por hora

        global.log1 = global.log2
        global.log2 = global.log3
        global.log3 = action+":"+text
        var resultString = global.log1+'\n'+global.log2+'\n'+global.log3
        return resultString
    }
}
