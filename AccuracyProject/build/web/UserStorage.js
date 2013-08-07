/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function createDatabaseWithFirstUser(userName)
{
    var storage = {"name": "storage"};
    storage.userList = new Array();
    storage.animalList = new Array();
    localStorage["UserDatabase"] = JSON.stringify(storage);
    addUser(userName);
}

function doesUserNameExist(userName)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    for(var i = 0; i < storage.userList.length; i++)
    {
        if(storage.userList[i].name === userName)
            return true;
    }
    
    return false;
}

function getUserLocationInArray(userName)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    for(var i = 0; i < storage.userList.length; i++)
    {
        if(storage.userList[i].name === userName)
        {
            return i;
        }
    }
    
    return -1;
}

function doesWeaponExist(userName, weaponName)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    var location = getUserLocationInArray(userName);
    for(var i = 0; i < storage.userList[location].weaponList.length ; i++)
    {
        if(storage.userList[location].weaponList[i].name === weaponName)
            return true;
    }
    
    return false;    
}

function getWeaponLocationInArray(userName, weaponName)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    var location = getUserLocationInArray(userName);
    for(var i = 0; i < storage.userList[location].weaponList.length ; i++)
    {
        if(storage.userList[location].weaponList[i].name === weaponName)
            return i;
    }
    
    return -1;    
}


function addUser(userName)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    var location = storage.userList.length;
    var user = {"name": userName};
    user.weaponList = new Array();
    storage.userList.splice(location, 0, user);
    
    localStorage["UserDatabase"] = JSON.stringify(storage);
}

function addWeapon(userName, weaponName)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    var location = getUserLocationInArray(userName);
    var weapon = {"name": weaponName};
    weapon.groupList = new Array();
    weapon.totalShots = 0;
    weapon.lastCleaned = "";
    weapon.preferredRounds = 100000;
    if(location !== -1)
    {
        storage.userList[location].weaponList.splice(storage.userList[location].length, 0, weapon);
    }
    else
    {
        return -1;
    }
    
    localStorage["UserDatabase"] = JSON.stringify(storage);
}

function addGroup(userName, weaponName, group)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    var userLocation = getUserLocationInArray(userName);
    var weaponLocation;
    var locationPlaced = 0;
    if(userLocation !== -1)
    {
        weaponLocation = getWeaponLocationInArray(userName, weaponName);
        if(weaponLocation !== -1)
        {           
            for(var i = storage.userList[userLocation].weaponList[weaponLocation].groupList.length -1; i > -1; i--)
            {
                if(compareDates(storage.userList[userLocation].weaponList[weaponLocation].groupList[i].date, group.date) || storage.userList[userLocation].weaponList[weaponLocation].groupList[i].date === group.date)
                {
                    locationPlaced = i + 1;
                    break;
                }
            }
            storage.userList[userLocation].weaponList[weaponLocation].groupList.splice(locationPlaced, 0, group);
            storage.userList[userLocation].weaponList[weaponLocation].totalShots = parseInt(storage.userList[userLocation].weaponList[weaponLocation].totalShots) + parseInt(group.shots);
        }
    }
    else
    {
        return -1;
    }
    
    localStorage["UserDatabase"] = JSON.stringify(storage);
}

function getWeaponListNames(userName)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    var tempArray = new Array();
    var userLocation = getUserLocationInArray(userName);
    for(var i = 0; i < storage.userList[userLocation].weaponList.length; i++)
    {
        tempArray.splice(0, 0, storage.userList[userLocation].weaponList[i].name);
    }
    
    return tempArray;
}

function addCleaning(userName, weaponName, date, preferredRounds)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    var userLocation = getUserLocationInArray(userName);
    if(userLocation !== -1)
    {
        var weaponLocation = getWeaponLocationInArray(userName, weaponName);
        if(weaponLocation !== -1)
        {
            if(date !== "")
            {
                storage.userList[userLocation].weaponList[weaponLocation].lastCleaned = date;
            }
            if(preferredRounds !== "")
            {
                storage.userList[userLocation].weaponList[weaponLocation].preferredRounds = parseInt(preferredRounds);
            }
        }
    }
    
    //check dates here 
    if(date !== "")
    {
        for(var i = 0; i < storage.userList[userLocation].weaponList[weaponLocation].groupList.length; i++)
        {
            if(storage.userList[userLocation].weaponList[weaponLocation].groupList[i].cleaned === false)
            {
                if(compareDates(storage.userList[userLocation].weaponList[weaponLocation].groupList[i].date, date))
                {
                   storage.userList[userLocation].weaponList[weaponLocation].totalShots -= parseInt(storage.userList[userLocation].weaponList[weaponLocation].groupList[i].shots);
                   storage.userList[userLocation].weaponList[weaponLocation].groupList[i].cleaned = true;
                }
            }
        }
    }
    
    
    
    localStorage["UserDatabase"] = JSON.stringify(storage);
}

function compareDates(firstDate, secondDate)
{
    firstDate = new String(firstDate);
    var first = new Object();
    first.day = parseInt(firstDate.substring(0,firstDate.indexOf("-")));
    firstDate = firstDate.slice(firstDate.indexOf("-")+1, firstDate.length);
    first.month = parseInt(firstDate.substring(0,firstDate.indexOf("-")));
    firstDate = firstDate.slice(firstDate.indexOf("-")+1, firstDate.length);
    first.year = parseInt(firstDate.substring(0,firstDate.indexOf(" ")));
    firstDate = firstDate.slice(firstDate.indexOf(" ")+1, firstDate.length);
    
    first.hours = parseInt(firstDate.substring(0,firstDate.indexOf(":")));
    firstDate = firstDate.slice(firstDate.indexOf(":")+1, firstDate.length);
    first.minutes = parseInt(firstDate.substring(0,firstDate.indexOf(":")));
    firstDate = firstDate.slice(firstDate.indexOf(":")+1, firstDate.length);
    first.seconds = parseInt(firstDate.substring(0,firstDate.length));
    
    var firstDateObject = new Date(first.year, first.month-1, first.day, first.hours, first.minutes, first.seconds, 0);
    firstDate = new String(secondDate);
    
    first.day = parseInt(firstDate.substring(0,firstDate.indexOf("-")));
    firstDate = firstDate.slice(firstDate.indexOf("-")+1, firstDate.length);
    first.month = parseInt(firstDate.substring(0,firstDate.indexOf("-")));
    firstDate = firstDate.slice(firstDate.indexOf("-")+1, firstDate.length);
    first.year = parseInt(firstDate.substring(0,firstDate.indexOf(" ")));
    firstDate = firstDate.slice(firstDate.indexOf(" ")+1, firstDate.length);
    
    first.hours = parseInt(firstDate.substring(0,firstDate.indexOf(":")));
    firstDate = firstDate.slice(firstDate.indexOf(":")+1, firstDate.length);
    first.minutes = parseInt(firstDate.substring(0,firstDate.indexOf(":")));
    firstDate = firstDate.slice(firstDate.indexOf(":")+1, firstDate.length);
    first.seconds = parseInt(firstDate.substring(0,firstDate.length));
    
    var secondDateObject = new Date(first.year, first.month-1, first.day, first.hours, first.minutes, first.seconds, 0);
    
    return (secondDateObject > firstDateObject);    
}

function checkWeapons(userName)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    var userLocation = getUserLocationInArray(userName);
    var needsCleaned = new Array();
    if(userLocation === -1)
        return;
    
    for(var i=0; i < storage.userList[userLocation].weaponList.length; i++)
    {
        if(storage.userList[userLocation].weaponList[i].preferredRounds < storage.userList[userLocation].weaponList[i].totalShots)
        {
            needsCleaned.splice(0, 0, storage.userList[userLocation].weaponList[i].name);
        }
    }

    localStorage["UserDatabase"] = JSON.stringify(storage);
    
    return needsCleaned;
}

function plotGroups(userName)
{
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    var userLocation = getUserLocationInArray(userName);
    if(userLocation === -1)
        return;
    //var weaponLocation = getWeaponLocationInArray(userName, weaponName);
    //if(weaponLocation === -1)
        //return;
    
    var stringPlot = [];
    //"[[" + "[" + "0" + "," + storage.userList[userLocation].weaponList[weaponLocation].groupList[0].size + "]";
    
    for(var i = 0; i < storage.userList[userLocation].weaponList.length; i++)
    {
        var tempPlot = [];
        for(var j = 0; j < storage.userList[userLocation].weaponList[i].groupList.length; j++)
        {
            tempPlot.push([convertDate(storage.userList[userLocation].weaponList[i].groupList[j].date), storage.userList[userLocation].weaponList[i].groupList[j].size]);
        }      
        stringPlot.push(tempPlot);
    }
    
    //stringPlot += "]]";
    
    return stringPlot;
}

function convertDate(date) {
    firstDate = new String(date);
    var first = new Object();
    first.day = parseInt(firstDate.substring(0,firstDate.indexOf("-")));
    firstDate = firstDate.slice(firstDate.indexOf("-")+1, firstDate.length);
    first.month = parseInt(firstDate.substring(0,firstDate.indexOf("-")));
    firstDate = firstDate.slice(firstDate.indexOf("-")+1, firstDate.length);
    first.year = parseInt(firstDate.substring(0,firstDate.indexOf(" ")));
    firstDate = firstDate.slice(firstDate.indexOf(" ")+1, firstDate.length);
    
    first.hours = parseInt(firstDate.substring(0,firstDate.indexOf(":")));
    firstDate = firstDate.slice(firstDate.indexOf(":")+1, firstDate.length);
    first.minutes = parseInt(firstDate.substring(0,firstDate.indexOf(":")));
    firstDate = firstDate.slice(firstDate.indexOf(":")+1, firstDate.length);
    first.seconds = parseInt(firstDate.substring(0,firstDate.length));
    
    var firstDateObject = new Date(first.year, first.month-1, first.day, first.hours, first.minutes, first.seconds, 0);
    
    var dateStringReturned = "";
    
    dateStringReturned += firstDateObject.getDay() + "-"; 
    
    switch(firstDateObject.getMonth()) {
        case 0:
            dateStringReturned += "Jan";
            break;
        case 1:
            dateStringReturned += "Feb";
            break;
        case 2:
            dateStringReturned += "Mar";
            break;
        case 3:
            dateStringReturned += "Apr";
            break;
        case 4:
            dateStringReturned += "May";
            break;
        case 5:
            dateStringReturned += "Jun";
            break;
        case 6:
            dateStringReturned += "Jul";
            break;
        case 7:
            dateStringReturned += "Aug";
            break;
        case 8:
            dateStringReturned += "Sep";
            break;
        case 9:
            dateStringReturned += "Oct";
            break;
        case 10:
            dateStringReturned += "Nov";
            break;
        case 11:
            dateStringReturned += "Dec";
            break;   
    }

    dateStringReturned += "-" + (firstDateObject.getFullYear() % 100); 
    
    return dateStringReturned;
}

function AddAnimal(name, size) {
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    if(DoesAnimalExist(name))
    {
        return false;
    }
    
    var animal = {name: name,
            size: size};
    storage.animalList.splice(0, 0, animal);
    
    
    localStorage["UserDatabase"] = JSON.stringify(storage);
    return true;
}

function DoesAnimalExist(name) {
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    for(var i = 0; i < storage.animalList.length; i++)
    {
        if(storage.animalList[i].name === name)
            return true;
    }
    
    return false;
}

function GetAnimalList(){
    var storage = JSON.parse(localStorage["UserDatabase"]);
    return storage.animalList;
}

function getAverageGroupSize(userName, weaponName) {
    var storage = JSON.parse(localStorage["UserDatabase"]);
    
    var userLocation = getUserLocationInArray(userName);
    if(userLocation === -1)
        return -1;
    
    var weaponLocation = getWeaponLocationInArray(userName, weaponName);
    if(weaponLocation === -1)
        return -1;
    
    var count = 0;
    var total = parseInt(0);
    var distance = 0;
    
    for(var i = storage.userList[userLocation].weaponList[weaponLocation].groupList.length - 1; i > -1; i--)
    {
        count++;
        
        total = parseFloat(total) + parseFloat(storage.userList[userLocation].weaponList[weaponLocation].groupList[i].size);
        distance = parseFloat(distance) + parseFloat(storage.userList[userLocation].weaponList[weaponLocation].groupList[i].distance);
        if(count === 30)
            break;
    }
    
    var temp = {
        avgSize: total/count,
        distance: distance/count
    };
    
    return temp;
}



