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
        tempArray.splice(0, 0, storage.userList[userLocation].weaponList[i].name)
    }
    
    return tempArray;
}


