/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function createDatabaseWithFirstUser(userName)
{
    var storage = {"name": "storage"};
    storage.userList = new Array();
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
    if(userLocation !== -1)
    {
        weaponLocation = getWeaponLocationInArray(userName, weaponName);
        if(weaponLocation !== -1)
        {
            storage.userList[userLocation].weaponList[weaponLocation].groupList.splice(storage.userList[userLocation].weaponList[weaponLocation].length, 0, group);
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
    
    var firstDateObject = new Date(first.year, first.month, first.day, first.hours, first.minutes, first.seconds, 0);
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




