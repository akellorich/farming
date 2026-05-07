const validationanchor = $(".validation")
const toggle = $("#nav-toggle")
// toggle.prop("checked",true)
let serverdate

function getserverdate() {
    const dfd = $.Deferred()
    $.get(
        "../controllers/settingsoperations.php",
        {
            getserverdate: true
        },
        (data) => {
            serverdate = new Date(data)
            dfd.resolve()
        }
    )
    return dfd.promise()
}



function setactivemenu(menu) {
    menu.addClass("active")
}

const patterns = {
    mobile: /^\+?\d{10,13}$/,
    name: /^\[a-zA-z]+$/,
    password: /^[\w@-]{5,20}$/,
    email: /^[a-z\d\.-]+@[a-z\d]+\.[a-z]{2,8}(\.[a-z]{2,8})?$/,
    pinno: /[A-Z]{1}\d{9}[A-Z]{1}/
}

validationanchor.on("click", function (e) {
    const objectcode = $(this).attr("data-id"),
        pagetonavigate = $(this).attr("href")
    e.preventDefault()
    validateuserprivilege(objectcode).done(function (data) {
        if (data == 0) {
            bootbox.alert({
                message: `<i class="fal fa-exclamation-triangle fa-3x fa-fw text-danger"></i>Sorry. Your are not authorized to perform this operation.`,
            })
        } else {
            window.location.href = pagetonavigate
        }
    })
})

function validateuserprivilege(objectcode) {
    const dfd = $.Deferred();
    $.post(
        "../controllers/useroperations.php",
        {
            getuserprivilege: true,
            objectcode
        },
        function (data) {
            dfd.resolve(data)
        }
    )
    return dfd.promise()
}

function validatefielddata(validatevalue, format) {
    return patterns[format].test(validatevalue) ? true : false
}

function subtractYears(numOfYears, date = new Date()) {
    date.setFullYear(date.getFullYear() - numOfYears);
    return date;
}

function formatDate(value) {
    let date = new Date(value);
    const day = date.toLocaleString('default', { day: '2-digit' });
    const month = date.toLocaleString('default', { month: 'short' });
    const year = date.toLocaleString('default', { year: 'numeric' });
    return day + '-' + month + '-' + year;
}

function isJSON(str) {
    try {
        return (JSON.parse(str) && !!str);
    } catch (e) {
        return false;
    }
}

// get current server date 
const titletag = $("title")
const fileName = window.location.pathname.split("/").pop();
const titletext = titleCase(fileName.split(".")[0].replace(/-/g, " ").replace(/_/g, " "))

// Set the sidebar brand text
// $(".sidebar-brand h2").text(titletext) 

// System Name
titletag.text("GuardsApp - " + titletext)

if (fileName != "index.html" && fileName != "index.php" && fileName != "") {
    getloggedinuser()
}

function getloggedinuser() {
    const username = $("#loggedinuser")
    // const role=$(".role")
    // const image=$(".profilephoto")

    $.getJSON(
        "../controllers/useroperations.php",
        {
            getloggedinuser: true
        },
        (data) => {
            // console.log(data)   
            if (isJsonObject(data)) {
                username.html(`${data.firstname} ${data.middlename}`)
                // role.html(data.systemadmin==1?'Admin Account':'User Account')
                // image.attr("src","../images/blankavatar.jpg")
            } else {
                window.location.href = "../index.php"
            }
        }
    )
}


// Logout person
$("#logout").on("click", function (e) {
    e.preventDefault()
    window.location.href = "../controllers/personoperations.php?logoff"
})

$("#logoutuser").on("click", function (e) {
    e.preventDefault()
    window.location.href = "../controllers/useroperations.php?logout"
})


function getcountries(obj, option = 'all') {
    $.getJSON(
        "../controllers/countryoperations.php",
        {
           getcountries:true
        },
        (data) => {
            let results = "";
            option == 'all' ? results = "<option value='0'>&lt;All&gt;</option>" : results = "<option value=''>&lt;Choose&gt;</option>";
            data.forEach((country) => {
                const id = country.id;
                const name = country.countryname;
                results += `<option value='${id}'>${name}</option>`;
            });
            obj.html(results);
        }
    );
}

function getIngredients(targetSelect, selectedValue = '') {
    $.getJSON("../controllers/inventoryoperations.php?action=getitems", function(response) {
        let options = '<option value="" disabled selected>Select Ingredient</option>';
        if (response && response.length > 0) {
            // Filter out only items that are ingredients
            const ingredients = response.filter(item => item.itemtype && item.itemtype.toLowerCase() === 'ingredient');
            ingredients.forEach(function(item) {
                const selected = (selectedValue == item.id) ? "selected" : "";
                options += `<option value="${item.id}" ${selected}>${item.itemname}</option>`;
            });
        }
        $(targetSelect).html(options);
    }).fail(function() {
        console.error("Failed to load ingredients.");
        $(targetSelect).html('<option value="" disabled>Error loading</option>');
    });
}

function getbreeds(obj) {
    $.getJSON(
        "../controllers/breedoperations.php",
        {
            getbreeds: true
        },
        (data) => {
            let results = "";
            data.forEach((breed) => {
                const efficiencyColor = breed.efficiency >= 90 ? '#1a4d1a' : (breed.efficiency >= 70 ? '#4d7c0f' : '#854d0e');
                const healthStyle = breed.health_status === 'OPTIMAL' ? 'background-color: #bbf7d0; color: #166534;' : (breed.health_status === 'GOOD' ? 'background-color: #fef08a; color: #854d0e;' : 'background-color: #fecaca; color: #991b1b;');

                results += `
                    <tr class="border-bottom" style="border-color: rgba(0,0,0,0.03) !important;">
                        <td class="py-4 pl-0">
                            <div class="d-flex align-items-center">
                                <div class="rounded p-2 mr-3 d-flex" style="background-color: #f1f5f1;">
                                    <span class="material-symbols-outlined" style="font-size: 20px; color: #1a4d1a; font-variation-settings: 'FILL' 1;">${breed.icon || 'stars'}</span>
                                </div>
                                <div class="font-weight-bold text-truncate" style="color: #1a1c19; font-size: 0.9rem; line-height: 1.2; max-width: 120px;">${breed.breedname}</div>
                            </div>
                        </td>
                        <td class="py-4 text-center">
                            <div class="font-weight-bold" style="color: #475569; font-size: 0.85rem;">${breed.totalcount}</div>
                            <div class="text-muted" style="font-size: 0.75rem;">head</div>
                        </td>
                        <td class="py-4 text-center">
                            <div class="font-weight-bold" style="color: #475569; font-size: 0.85rem;">${parseFloat(breed.avg_actual_milking).toFixed(1)}</div>
                            <div class="text-muted" style="font-size: 0.75rem;">ltrs</div>
                        </td>
                        <td class="d-none d-lg-table-cell py-4">
                            <div class="d-flex align-items-center justify-content-center">
                                <div class="progress mr-3" style="height: 6px; width: 100px; background-color: #f1f5f1; border-radius: 10px;">
                                    <div class="progress-bar" style="width: ${breed.efficiency}%; background-color: ${efficiencyColor}; border-radius: 10px;"></div>
                                </div>
                                <span class="font-weight-bold" style="font-size: 0.75rem; color: #1a4d1a;">${breed.efficiency}%</span>
                            </div>
                        </td>
                        <td class="d-none d-lg-table-cell py-4 text-center">
                            <span class="badge badge-pill py-1 px-3" style="${healthStyle} font-size: 9px; font-weight: 800; letter-spacing: 0.05em;">${breed.health_status}</span>
                        </td>
                        <td class="py-4 text-right pr-0">
                            <div class="dropdown">
                                <button class="btn btn-link text-muted p-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="material-symbols-outlined" style="font-size: 20px;">more_vert</span>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right shadow border-0 p-2" style="border-radius: 12px; min-width: 150px;">
                                    <a class="dropdown-item d-flex align-items-center py-2" href="#" style="border-radius: 8px;">
                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px; color: var(--primary);">groups</span>
                                        <span style="font-size: 13px; font-weight: 500;">View Herd</span>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center py-2" href="#" style="border-radius: 8px;">
                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px; color: var(--secondary);">edit</span>
                                        <span style="font-size: 13px; font-weight: 500;">Edit Profile</span>
                                    </a>
                                    <div class="dropdown-divider mx-2"></div>
                                    <a class="dropdown-item d-flex align-items-center py-2 text-danger" href="#" style="border-radius: 8px;">
                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px;">delete</span>
                                        <span style="font-size: 13px; font-weight: 500;">Remove</span>
                                    </a>
                                </div>
                            </div>
                        </td>
                    </tr>
                `;
            });
            obj.html(results);
        }
    );
}

function getsmsproviders(obj) {
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            action: 'getsmsproviders'
        },
        (data) => {
            let results = "";
            let defaultId = 0;
            data.forEach((provider) => {
                results += `<option value='${provider.id}' ${provider.isdefault == 1 ? 'selected' : ''}>${provider.providername}</option>`;
                if(provider.isdefault == 1) defaultId = provider.id;
            });
            obj.html(results);
            
            // Trigger load for the default/selected provider
            if(typeof loadSMSSettings === 'function') {
                loadSMSSettings(obj.val());
            }
        }
    );
}

function exporttable(tableid, sheetname, documentname) {
    // check if multiple tables are to be exported
    var wb = XLSX.utils.table_to_book(document.getElementById(tableid), { sheet: sheetname });
    var wbout = XLSX.write(wb, { bookType: 'xlsx', bookSST: true, type: 'binary' });
    saveAs(new Blob([s2ab(wbout)], { type: "application/octet-stream" }), `${documentname}.xlsx`);

    function s2ab(s) {
        var buf = new ArrayBuffer(s.length);
        var view = new Uint8Array(buf);
        for (var i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
        return buf;
    }
}

function exportMultipleTables(tableIds, sheetNames, documentName) {
    // Create a new workbook
    var wb = XLSX.utils.book_new()

    // Convert each table to a worksheet and append to the workbook
    tableIds.forEach((tableId, index) => {
        var tableElement = document.getElementById(tableId)
        var ws = XLSX.utils.table_to_sheet(tableElement)
        XLSX.utils.book_append_sheet(wb, ws, sheetNames[index])
    });

    // Write the workbook to a binary string
    var wbout = XLSX.write(wb, { bookType: 'xlsx', bookSST: true, type: 'binary' })

    // Convert binary string to ArrayBuffer
    function s2ab(s) {
        var buf = new ArrayBuffer(s.length)
        var view = new Uint8Array(buf)
        for (var i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF
        return buf
    }

    // Save the workbook
    saveAs(new Blob([s2ab(wbout)], { type: "application/octet-stream" }), `${documentName}.xlsx`);
}

function getusers(obj, option) {
    $.getJSON(
        "../controllers/useroperations.php",
        {
            getuserslist: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((user) => {
                results += `<option value='${user.id}'>${user.firstname} ${user.middlename} ${user.lastname}</option>`
            })
            obj.html(results)
        }
    )
}

function setDatePicker(controlname, maxdate = true, mindate = false) {
    if (maxdate) {
        controlname.datepicker({
            yearRange: "c-70:c+0",
            dateFormat: 'dd-M-yy',
            changeMonth: true,
            changeYear: true,
            maxDate: new Date()
        })
    } else if (mindate) {
        controlname.datepicker({
            yearRange: "c-0:c+20",
            dateFormat: 'dd-M-yy',
            changeMonth: true,
            changeYear: true,
            minDate: new Date()
        })
    } else {
        controlname.datepicker({
            yearRange: "c-70:c+20",
            dateFormat: 'dd-M-yy',
            changeMonth: true,
            changeYear: true
        })
    }

    // Add Icon showing its a date field
    const $icon = $('<i>').addClass('fal fa-calendar-alt');
}

function titleCase(str) {
    str = str.toLowerCase().split(' ');
    for (var i = 0; i < str.length; i++) {
        str[i] = str[i].charAt(0).toUpperCase() + str[i].slice(1);
    }
    return str.join(' ');
}

function getglaccountclasses(obj, option = 'all') {
    $.getJSON(
        "../controllers/glaccountoperations.php",
        {
            getglaccountclasses: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((glclass) => {
                results += `<option value='${glclass.id}'>${glclass.classname}</option>`
            })
            obj.html(results)
        }
    )
}

function getglaccounts(obj, groupid = 0, option = 'all') {
    $.getJSON(
        "../controllers/glaccountoperations.php",
        {
            getglaccounts: true,
            groupid
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((glaccount) => {
                results += `<option value='${glaccount.id}' data-accountcode='${glaccount.accountcode}'>${glaccount.accountname}</option>`
            })
            obj.html(results)
        }
    )
}

function getpropertyunitcategories(obj, option = 'all') {
    $.getJSON(
        "../controllers/propertyoperations.php",
        {
            getpropertyunitcategories: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((category) => {
                results += `<option value='${category.categoryid}'>${category.categoryname}</option>`
            })
            obj.html(results)
        }
    )
}

function getbranches(obj, option = 'all') {
    $.getJSON(
        "../controllers/branchoperations.php",
        {
            getbranches: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((branch) => {
                results += `<option value='${branch.branchid}'>${branch.branchname}</option>`
            })
            obj.html(results)
        }
    )
}

function getproperties(obj, option = 'all') {
    $.getJSON(
        "../controllers/propertyoperations.php",
        {
            filterproperties: true,
            branchid: 0
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((property) => {
                results += `<option value='${property.propertyid}'>${property.propertyname}</option>`
            })
            obj.html(results)
        }
    )
}

function sanitizestring(str) {
    return str == '' ? str : str.replace("'", "''").trim()
}


function convertToRoman(num) {
    if (num <= 0 || num >= 4000) {
        return "Invalid input. Please enter a number between 1 and 3999.";
    }

    const romanNumerals = [
        ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
        ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
        ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
        ["", "M", "MM", "MMM"]
    ];

    const thousands = Math.floor(num / 1000);
    const hundreds = Math.floor((num % 1000) / 100);
    const tens = Math.floor((num % 100) / 10);
    const ones = num % 10;

    return (
        romanNumerals[3][thousands] +
        romanNumerals[2][hundreds] +
        romanNumerals[1][tens] +
        romanNumerals[0][ones]
    );
}

function convertToAscii(num) {
    if (num < 0 || num > 255) {
        return "Invalid input. Please enter a number between 0 and 255.";
    }

    return String.fromCharCode(num);
}

function convertToNumeric(char) {
    if (char.length !== 1) {
        return "Invalid input. Please enter a single character.";
    }

    const asciiCode = char.charCodeAt(0);
    return asciiCode;
}

function isOnlyLetters(text) {
    // Use a regular expression to check if the string contains only letters from a to z
    const regex = /^[a-z]+$/i; // The 'i' flag makes the check case-insensitive

    return regex.test(text);
}


function getvoteheads(obj, option = 'all') {
    $.getJSON(
        "../controllers/accountoperations.php",
        {
            getvoteheads: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((item) => {
                results += `<option value='${item.itemid}'>${item.itemname}</option>`
            })
            obj.html(results)
        }
    )
}

function getidocuments(obj, option = 'all') {
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getregistrationdocuments: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0' data-expires='1'>&lt;All&gt;</option>" : "<option value='' data-expires='1'>&lt;Choose&gt;</option>"
            data.forEach((document) => {
                results += `<option value='${document.documentid}' data-expires=${document.expires}>${document.documenttypename}</option>`
            })
            obj.html(results)
        }
    )
}

function getblocks(obj, propertyid, option = 'all') {
    const dfd = $.Deferred()
    $.getJSON(
        "../controllers/propertyoperations.php",
        {
            getblocks: true,
            propertyid
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((block) => {
                results += `<option value='${block.blockid}'>${block.blockname}</option>`
            })
            obj.html(results)
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function getmaritalstatuses(obj, option = 'all') {
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getmaritalstatuses: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((maritalstatus) => {
                results += `<option value='${maritalstatus.id}'>${maritalstatus.maritalstatus}</option>`
            })
            obj.html(results)
        }
    )
}

function getreligions(obj, option = 'all') {
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getreligions: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((religion) => {
                results += `<option value='${religion.id}'>${religion.religionname}</option>`
            })
            obj.html(results)
        }
    )
}

function getsalutations(obj, option = 'all') {
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getsalutations: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((salutation) => {
                results += `<option value='${salutation.id}'>${salutation.salutation}</option>`
            })
            obj.html(results)
        }
    )
}

function getpropertyunittypes(obj, option = 'all') {
    $.getJSON(
        "../controllers/propertyoperations.php",
        {
            getunittypes: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((unittype) => {
                results += `<option value='${unittype.typeid}'>${unittype.typename}</option>`
            })
            obj.html(results)
        }
    )
}

function getpropertyowners(obj, option = 'all') {
    $.getJSON(
        "../controllers/owneroperations.php",
        {
            getowners: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((owner) => {
                results += `<option value='${owner.ownerid}'>${owner.name}</option>`
            })
            obj.html(results)
        }
    )
}

function getpropertyunits(obj, propertyid, option = 'all') {
    dfd = $.Deferred()
    $.getJSON(
        "../controllers/propertyoperations.php",
        {
            filterpropertyunits: true,
            propertyid
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((unit) => {
                results += `<option value='${unit.unitid}'>${unit.unitname}</option>`
            })
            obj.html(results)
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function gettenantcategories(obj, option = 'all') {
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            gettenantcategories: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((category) => {
                results += `<option value='${category.categoryid}'>${category.categoryname}</option>`
            })
            obj.html(results)
        }
    )
}


function getpropertyowners(obj, unitid, option = 'all') {
    $.getJSON(
        "../controllers/owneroperations.php",
        {
            getpropertyunitowners: true,
            unitid
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((owner) => {
                results += `<option value='${owner.ownerid}'>${owner.ownername}</option>`
            })
            obj.html(results)
        }
    )
}

function getinventorytypes(obj, option = 'all') {
    $.getJSON(
        "../controllers/inventoryoperations.php",
        {
            getinventorytypes: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((type) => {
                results += `<option value='${type.typeid}'>${type.typename}</option>`
            })
            obj.html(results)
        }
    )
}

function getinventorycategorieslist(obj, option = 'all') {
    $.getJSON(
        "../controllers/inventoryoperations.php",
        {
            action: 'getcategories'
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose Category&gt;</option>";
            if (Array.isArray(data)) {
                data.forEach((category) => {
                    results += `<option value='${category.id}' data-prefix='${category.itemprefix}' data-start='${category.startingnumber}'>${category.categoryname}</option>`;
                });
            }
            obj.html(results);
        }
    );
}

function getbanks(obj, option = 'all') {
    dfd = $.Deferred()
    $.getJSON(
        "../controllers/bankoperations.php",
        {
            getbanks: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((bank) => {
                results += `<option value='${bank.bankid}'>${bank.bankname}</option>`
            })
            obj.html(results)
            dfd.resolve()
        }
    )
    return dfd.promise()
}

//function for getting a bank branch
function getbankbranches(obj, bankid, option = 'all') {
    dfd = $.Deferred()
    $.getJSON(
        "../controllers/bankoperations.php",
        {
            getbranches: true,
            bankid
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((branch) => {
                results += `<option value='${branch.branchid}'>${branch.branchname} </option>`
            })
            // console.log(results)
            obj.html(results)
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function gotonotifications(notificationid) {
    $('html, body').animate({
        scrollTop: (notificationid.offset().top - 300)
    }, 1000)
}


function populatemonths(obj) {
    const dfd = $.Deferred()
    const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let results = ""
    months.forEach((month, i) => {
        results += `<option value=${i + 1}>${month}</option>`
    })

    obj.html(results)

    getserverdate().done(() => {
        const currentmonth = serverdate.getMonth()
        obj.val(currentmonth + 1)
        dfd.resolve()
    })

    return dfd.promise()
}

function populateyears(obj) {
    const dfd = $.Deferred()
    let results = ""

    for (let i = 2010; i <= 2050; i++) {
        results += `<option value=${i}>${i}</option>`
    }

    obj.html(results)

    getserverdate().done(() => {
        const currentyear = serverdate.getFullYear()
        obj.val(currentyear)
        dfd.resolve()
    })

    return dfd.promise()
}

function generatenumbers(style, startat, units, padzeros = false, prefix = "", suffix = "") {
    const numbers = [], totalunits = Number(startat) + Number(units) - 1

    if (style == "numeric" || style == "roman") {
        if (parseInt(startat)) {
            for (let i = startat; i <= totalunits; i++) {
                currentno = style == "roman" ? decimalToRoman(i) : i
                if (padzeros == false) {
                    numbers.push(`${prefix}${currentno}${suffix}`)
                } else {
                    let padding = "", currnolength = currentno.toString().length
                    for (let j = currnolength; j < totalunits.toString().length; j++) {
                        padding += `0`
                    }
                    numbers.push(`${prefix}${padding}${currentno}${suffix}`)
                }
            }
            return numbers
        } else {
            return "invalid start number"
        }
    } else if (style == "alphabetic") {
        // check that start style is a single alphabetic letter
        startat = startat.toUpperCase()
        const pattern = /^[A-Z]$/
        if (pattern.test(startat)) {
            const numericstart = convertToNumeric(startat)
            for (i = numericstart; i < totalunits; i++) {
                if (padding == false) {
                    numbers.push(`${prefix}${convertToAscii(i)}${suffix}`)
                } else {
                    let padding = "", currnolength = convertToAscii(i).toString().length
                    for (let j = currnolength; j < totalunits.toString().length; j++) {
                        padding += `0`
                    }
                    numbers.push(`${prefix}${padding}${convertToAscii(i)}${suffix}`)
                }
            }
            return numbers
        } else {
            return "invalid start number"
        }
    }
}

function decimalToRoman(num) {
    // Array of objects containing Roman numeral and corresponding value
    const romanNumerals = [
        { value: 1000, numeral: 'M' },
        { value: 900, numeral: 'CM' },
        { value: 500, numeral: 'D' },
        { value: 400, numeral: 'CD' },
        { value: 100, numeral: 'C' },
        { value: 90, numeral: 'XC' },
        { value: 50, numeral: 'L' },
        { value: 40, numeral: 'XL' },
        { value: 10, numeral: 'X' },
        { value: 9, numeral: 'IX' },
        { value: 5, numeral: 'V' },
        { value: 4, numeral: 'IV' },
        { value: 1, numeral: 'I' }
    ]

    // Initialize result string
    let romanNumeral = ''

    // Iterate through the array of objects
    for (const item of romanNumerals) {
        while (num >= item.value) {
            romanNumeral += item.numeral
            num -= item.value
        }
    }

    return romanNumeral
}


function getjobgroups(obj, option = 'all') {
    $.getJSON(
        "../controllers/payrolloperations.php",
        {
            getjobgroups: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((jobgroup) => {
                results += `<option value='${jobgroup.jobgroupid}'>${jobgroup.jobgroupname}</option>`
            })
            obj.html(results)
        }
    )
}


function getjobnotches(obj, option = 'all') {
    $.getJSON(
        "../controllers/payrolloperations.php",
        {
            getnotches: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((notch) => {
                results += `<option value='${notch.notchid}'>${notch.notchname}</option>`
            })
            obj.html(results)
        }
    )
}

function getjobpositions(obj, option = 'all', showtop = 0) {
    $.getJSON(
        "../controllers/payrolloperations.php",
        {
            getjobpositions: true
        },
        (data) => {
            let results = showtop == 1 ? `<option value="0">&lt;Top&gt;</option>` : option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            // results+=
            data.forEach((position) => {
                results += `<option value='${position.positionid}'>${position.positionname}</option>`
            })
            obj.html(results)
        }
    )
}


function getcreditors(obj, option = 'all') {
    $.getJSON(
        "../controllers/creditoroperations.php",
        {
            getcreditors: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((creditor) => {
                results += `<option value='${creditor.creditorid}'>${creditor.creditorname}</option>`
            })
            obj.html(results)
        }
    )
}

function renumbertablerows(table) {
    table.find("tbody tr").each(function (i) {
        $(this).find("td").eq(0).text(Number(i + 1))
    })
}


function getpayrollitems(obj, category = '<all>', option = 'all', addgross = false) {
    dfd = $.Deferred()
    $.getJSON(
        "../controllers/payrolloperations.php",
        {
            getpayrollitems: true,
            category
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            if (addgross) {
                results += `<option value='gross'>&lt;Gross Salary&gt;</option>`
            }
            data.forEach((item) => {
                results += `<option value='${item.itemid}'>${item.itemname}</option>`
            })
            obj.html(results)
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function getemploymentterms(obj, option = 'all') {
    $.getJSON(
        "../controllers/payrolloperations.php",
        {
            getemploymentterms: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((term) => {
                results += `<option value='${term.termid}'>${term.termname}</option>`
            })
            obj.html(results)
        }
    )
}

function getjobcategories(obj, option = 'all') {
    $.getJSON(
        "../controllers/payrolloperations.php",
        {
            getjobcategories: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((category) => {
                results += `<option value='${category.categoryid}'>${category.categoryname}</option>`
            })
            obj.html(results)
        }
    )
}

function getdepartments(obj, option = 'all') {
    $.getJSON(
        "../controllers/departmentoperations.php",
        {
            getdepartments: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((department) => {
                results += `<option value='${department.departmentid}'>${department.departmentname}</option>`
            })
            obj.html(results)
        }
    )
}

function getTodaysDate() {
    const date = new Date();
    const day = String(date.getDate()).padStart(2, '0'); // Get day and pad with zero if needed
    const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    const month = monthNames[date.getMonth()]; // Get month name from the array
    const year = date.getFullYear(); // Get full year

    return `${day}-${month}-${year}`;
}

function gettaxlabels(obj, option = 'all') {
    $.getJSON(
        "../controllers/payrolloperations.php",
        {
            gettaxlabels: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((taxlabel) => {
                results += `<option value='${taxlabel.payeid}' ${taxlabel.current == 1 ? 'selected' : ''}>${taxlabel.label}</option>`
            })
            obj.html(results)
        }
    )
}

function getstatutoryitems(obj, option = 'all') {
    $.getJSON(
        "../controllers/payrolloperations.php",
        {
            getstatutoryitems: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((item) => {
                results += `<option value='${item.itemid}'>${item.itemname}</option>`
            })
            obj.html(results)
        }
    )
}

function getpayrollitemgroups(obj, option = 'all') {
    $.getJSON(
        "../controllers/payrolloperations.php",
        {
            getpayrollitemgroups: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value='0'>&lt;None&gt;</option>"
            data.forEach((group) => {
                results += `<option value='${group.groupid}'>${group.groupname}</option>`
            })
            obj.html(results)
        }
    )
}

function getrelationships(obj, option = 'all') {
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getrelationships: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((relationship) => {
                results += `<option value='${relationship.relationshipid}'>${relationship.description}</option>`
            })
            obj.html(results)
        }
    )
}


function getleaveapprovalflows(obj, option = 'all') {
    $.getJSON(
        "../controllers/leaveoperations.php",
        {
            getleaveapprovalflows: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((flow) => {
                results += `<option value='${flow.flowid}'>${flow.flowname}</option>`
            })
            obj.html(results)
        }
    )
}

function getleavetypes(obj, option = 'all') {
    $.getJSON(
        "../controllers/leaveoperations.php",
        {
            getleavetypes: true
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((leave) => {
                results += `<option value='${leave.leaveid}'>${leave.leavename}</option>`
            })
            obj.html(results)
        }
    )
}

function getemployeedepartmentcolleagues(obj, employeeid, option = 'all') {
    dfd = $.Deferred()
    $.getJSON(
        "../controllers/employeeoperations.php",
        {
            getemployeedepartmentcolleagues: true,
            employeeid
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((colleague) => {
                results += `<option value='${colleague.employeeid}'>${colleague.firstname} ${colleague.middlename} ${colleague.lastname}</option>`

            })
            obj.html(results)

            // if only 1 colleague select by default
            if (data.length == 1) {
                obj.val(data[0].employeeid)
            }

            dfd.resolve()
        }
    )
    return dfd.promise()
}

function getemployeesupervisors(obj, employeeid, option = 'all') {
    dfd = $.Deferred()
    $.getJSON(
        "../controllers/employeeoperations.php",
        {
            getemployeesupervisors: true,
            employeeid
        },
        (data) => {

            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((supervisor) => {
                results += `<option value='${supervisor.employeeid}'>${supervisor.firstname} ${supervisor.middlename} ${supervisor.lastname}</option>`
            })
            obj.html(results)

            // if only 1 supervisor select by default
            if (data.length == 1) {
                obj.val(data[0].employeeid)
            }
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function countWorkingDays(startDate, endDate) {
    // Convert the input dates to Date objects
    let start = new Date(startDate);
    let end = new Date(endDate);
    let count = 0;

    // Loop through each date between start and end
    while (start <= end) {
        const day = start.getDay();
        // 0 = Sunday, 6 = Saturday; count only weekdays (Monday to Friday)
        if (day !== 0 && day !== 6) {
            count++;
        }
        // Move to the next day
        start.setDate(start.getDate() + 1);
    }
    return count;
}

function getDaysBetweenDates(startDate, endDate) {
    // Convert both dates to Date objects
    const start = new Date(startDate);
    const end = new Date(endDate);

    // Get the time difference in milliseconds
    const timeDifference = end - start;

    // Convert time difference from milliseconds to days
    const daysDifference = timeDifference / (1000 * 60 * 60 * 24);

    return Math.round(daysDifference);
}

function convertDate(dateStr) {
    // Define months array
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    // Split the input date string
    const [day, monthStr, year] = dateStr.split("-");
    // Find the month index (January is 0, February is 1, etc.)
    const month = months.indexOf(monthStr) + 1;
    // Return formatted date
    return `${year}-${String(month).padStart(2, '0')}-${day}`;
}

function getleaveapplicationstatus(applicationid) {
    const deferred = $.Deferred();
    $.getJSON(
        "../controllers/leaveoperations.php",
        {
            getleaveapplicationstatus: true,
            applicationid
        },
        (data) => {
            deferred.resolve(data[0].applicationstatus);
        }
    )
    return deferred.promise();
}

function getemployeebeneficiariestotal(obj, employeeid, beneficiaryid = 0) {
    dfd = $.Deferred()
    $.getJSON(
        "../controllers/employeeoperations.php",
        {
            getemployeebeneficiarypercentage: true,
            employeeid,
            beneficiaryid
        },
        (data) => {
            obj.val(100 - data[0].percentage)
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function getcourselevels(obj, option = 'all') {
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getcourselevels: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((level) => {
                results += `<option value='${level.levelid}'>${level.levelname}</option>`
            })
            obj.html(results)
        }
    )
}

function makedatatable(tableobj, results, pagelength = 10, showall = 0) {
    // destroy datatable bfore re-initialization
    if ($.fn.dataTable.isDataTable(tableobj)) {
        tableobj.DataTable().clear().destroy();
    }

    // update content
    tableobj.find("tbody").html(results)
    // reinitializedatatable
    if (showall == 1) {
        tableobj.DataTable({
            "autoWidth": false,
            "paging": false,        // disable pagination
            "info": false,          // optional: hide "Showing X of Y entries"
            "lengthChange": false   // optional: hide length dropdown

        }).columns.adjust().draw()
    } else {
        tableobj.DataTable({
            "autoWidth": false,
            "lengthMenu": [[10, 15, 25, 50, 100, -1], [10, 15, 25, 50, 100, "All"]],
            "pageLength": pagelength
            // "paging": true,
            // "searching": true,
            // "ordering": true,
            // "info": true
            // Additional options can be added here
        }).columns.adjust().draw()
    }
}

function getdisciplinarycategoriess(obj, option = 'all') {
    $.getJSON(
        "../controllers/employeeoperations.php",
        {
            getdisciplinarycategories: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((category) => {
                results += `<option value='${category.categoryid}'>${category.categoryname}</option>`
            })
            obj.html(results)
        }
    )
}

function getdisciplinaryactions(obj, option = 'all') {
    $.getJSON(
        "../controllers/employeeoperations.php",
        {
            getdisciplinaryactions: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((action) => {
                results += `<option value='${action.actionid}'>${action.actionname}</option>`
            })
            obj.html(results)
        }
    )
}

function getdisciplinaryatypes(obj, option = 'all') {
    $.getJSON(
        "../controllers/employeeoperations.php",
        {
            getdisciplinarytypes: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((type) => {
                results += `<option value='${type.typeid}'>${type.typename}</option>`
            })
            obj.html(results)
        }
    )
}

function getemployeeattachabledocuments(obj, option = 'all') {
    $.getJSON(
        "../controllers/employeeoperations.php",
        {
            getemployeeattachabledocuments: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((document) => {
                results += `<option value='${document.documentid}' data-expires='${document.expires}'>${document.documentname}</option>`
            })
            obj.html(results)
        }
    )
}

function gettenantallunits(obj, tenantid, option = 'all', addpropertyname = 0) {
    dfd = $.Deferred()
    $.getJSON(
        "../controllers/tenantoperations.php",
        {
            gettenantallunits: true,
            tenantid
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            data.forEach((unit) => {
                results += `<option value='${unit.unitid}'>${addpropertyname == 1 ? `${unit.propertyname} - ${unit.unitname}` : `${unit.unitname}`}</option>`
            })

            obj.forEach(element => {
                element.html(results)
            })
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function getpaymentmethods(obj, option = 'all') {
    dfd = $.Deferred()
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getpaymentmethods: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            // check if object is an array of objects
            data.forEach((paymentmode) => {
                results += `<option value='${paymentmode.paymentmodeid}' data-requiresref='${paymentmode.requiresref}'>${paymentmode.paymentmodename}</option>`
            })

            if (Array.isArray(obj)) {
                obj.forEach(element => {
                    element.html(results)
                })
            } else {
                obj.html(results)
            }
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function getdaysinmonth(monthname, leapyear = false) {
    const monthdays = {
        January: 31,
        February: !leapyear ? 28 : 29, // Assume non-leap year
        March: 31,
        April: 30,
        May: 31,
        June: 30,
        July: 31,
        August: 31,
        September: 30,
        October: 31,
        November: 30,
        December: 31
    }

    const normalizedMonth = titleCase(monthname) //monthName.charAt(0).toUpperCase() + monthName.slice(1).toLowerCase()

    if (monthdays.hasOwnProperty(normalizedMonth)) {
        return monthdays[normalizedMonth]
    } else {
        throw new Error("Invalid month name")
    }
}

function extractTime(datetimeString) {
    // Try to parse the date string into a Date object
    const dateObject = new Date(datetimeString)

    // Check if the date is valid
    if (!isNaN(dateObject.getTime())) {
        const hours = dateObject.getHours().toString().padStart(2, '0')
        const minutes = dateObject.getMinutes().toString().padStart(2, '0')
        return `${hours}:${minutes}`
    }

    return null; // Return null if the string is not a valid date
}

function getallemployees(obj, option = 'choose') {
    $.getJSON(
        "../controllers/employeeoperations.php",
        {
            getallemployees: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            // sort the 
            data.forEach((employee) => {
                results += `<option data-staffno='${employee.staffno}' value='${employee.employeeid}'>${employee.firstname} ${employee.middlename} ${employee.lastname}</option>`
            })
            obj.html(results)
        }
    )
}

function getshifts(obj, option = 'choose') {
    $.getJSON(
        "../controllers/attendanceoperations.php",
        {
            getshiftmaster: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
            // sort the 
            data.forEach((shift) => {
                results += `<option value='${shift.shiftid}'>${shift.shiftname}</option>`
            })
            obj.html(results)
        }
    )
}

function getFirstDayOfMonth(monthName, year) {
    const monthIndex = new Date(`${monthName} 1, ${year}`).getMonth();
    const firstDay = new Date(year, monthIndex, 1);
    return formatDate(firstDay);
}

function getLastDayOfMonth(monthName, year) {
    const monthIndex = new Date(`${monthName} 1, ${year}`).getMonth();
    const lastDay = new Date(year, monthIndex + 1, 0);
    return formatDate(lastDay);
}

function isValidTime(time) {
    // Regular expression to match the 24-hour format (HH:mm)
    const regex = /^([01]?[0-9]|2[0-3]):([0-5]?[0-9])$/
    return regex.test(time)
}

function getunits(obj, companyid = 0, option = 'choose') {
    const dfd = $.Deferred()
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getunits: true,
            companyid
        },
        (data) => {
            let results = option == 'all' ? "<option value='0' disabled selected>&lt;All&gt;</option>" : "<option value='' disabled selected>&lt;Choose&gt;</option>"
            // sort the 
            data.forEach((unit) => {
                results += `<option value='${unit.unitid}'>${unit.unitname}</option>`
            })
            obj.html(results)
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function getsections(obj, departmentid, option = 'choose') {
    const dfd = $.Deferred()
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getsections: true,
            departmentid
        },
        (data) => {
            let results = option == 'all' ? "<option value='0' disabled selected>&lt;All&gt;</option>" : "<option value='' disabled selected>&lt;Choose&gt;</option>"
            // sort the 
            data.forEach((section) => {
                results += `<option value='${section.sectionid}'>${section.sectionname}</option>`
            })
            obj.html(results)
            dfd.resolve()
        }
    )
    return dfd.promise()
}

function getdefaultattendanceimportsource() {
    const dfd = $.Deferred()
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getinstitutiondetails: true
        },
        (data) => {
            return dfd.resolve(data[0].defaultattendanceimport)
        }
    )
    return dfd.promise()
}

let elpasedtime = 0
let counter = 0
let intervalId = null

function formatTime(seconds) {
    const mins = String(Math.floor(seconds / 60)).padStart(2, '0')
    const secs = String(seconds % 60).padStart(2, '0')
    return `${mins}:${secs}`
}

function updateDisplay(notificationelement) {
    notificationelement.html(showAlert("processing", `Procesing please wait. Elapsed time: <strong>${formatTime(counter)}</strong>`))
}

function startIncrementing(notificationelement) {
    // console.log(intervalId)
    if (intervalId !== null) return // avoid multiple intervals
    intervalId = setInterval(() => {
        counter++
        updateDisplay(notificationelement)
        console.log(`Counter: ${counter}`) // For debugging purposes
    },
        1000
    )
}

function stopIncrementing() {
    clearInterval(intervalId)
    intervalId = null
}

function resetCounter() {
    stopIncrementing()
    counter = 0
    // updateDisplay(notificationelement)
}

function getcompanies(obj, option = 'all') {
    const dfd = $.Deferred()
    $.getJSON(
        "../controllers/settingsoperations.php",
        {
            getcompanies: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0' disabled selected>&lt;All&gt;</option>" : "<option value='' disabled selected>&lt;Choose&gt;</option>"
            data.forEach((company) => {
                results += `<option value='${company.companyid}'>${company.companyname}</option>`
            })
            // console.log(results)
            obj.html(results)
            dfd.resolve()
        }
    )
    return dfd.promise()
}


function getstartandenddatesofthemonth() {
    const now = new Date()

    // Get first day
    const firstDay = new Date(now.getFullYear(), now.getMonth(), 1)

    // Get last day
    const lastDay = new Date(now.getFullYear(), now.getMonth() + 1, 0)

    return {
        firstDay: formatDate(firstDay),
        lastDay: formatDate(lastDay)
    };
}

function filtercompanyunits(obj, companyid, status = 'all') {
    const dfd = $.Deferred()
    if (companyid == "0") {
        obj.html(status == 'all' ? `<option value='0'>&lt;All&gt;</option>` : `<option value=''>&lt;Choose&gt;</option>`)
    } else {
        getunits(obj, companyid, status).done(() => {
            dfd.resolve()
        })
    }
    return dfd.promise()
}

function hoursBetween(startTime, endTime) {
    const [startH, startM] = startTime.split(':').map(Number)
    const [endH, endM] = endTime.split(':').map(Number)

    const start = new Date();
    start.setHours(startH, startM, 0)

    const end = new Date();
    end.setHours(endH, endM, 0)

    const diffMs = end - start
    const diffHrs = diffMs / (1000 * 60 * 60) // convert ms to hours
    return diffHrs;
}

function addHoursToTime(timeStr, hoursToAdd) {
    // Ensure the time has hours, minutes, and seconds
    let [hours, minutes, seconds] = timeStr.split(':')

    // Default missing parts to zero
    hours = parseInt(hours || '0', 10)
    minutes = parseInt(minutes || '0', 10)
    seconds = parseInt(seconds || '0', 10)

    // Use a fixed reference date to avoid timezone issues
    const date = new Date(1970, 0, 1, hours, minutes, seconds)

    // Add the hours
    date.setHours(date.getHours() + hoursToAdd)

    // Format the output in HH:mm:ss
    const pad = num => num.toString().padStart(2, '0')
    return `${pad(date.getHours())}:${pad(date.getMinutes())}:${pad(date.getSeconds())}`
}

maximizebutton = $("#maximizebutton")
/* Get the documentElement (<html>) to display the page in fullscreen */
const elem = document.documentElement;

/* View in fullscreen */
function openFullscreen() {
    if (elem.requestFullscreen) {
        elem.requestFullscreen();
    } else if (elem.webkitRequestFullscreen) { /* Safari */
        elem.webkitRequestFullscreen();
    } else if (elem.msRequestFullscreen) { /* IE11 */
        elem.msRequestFullscreen();
    }
    fullscreen = true
}

function closeFullscreen() {
    if (document.exitFullscreen) {
        document.exitFullscreen();
    } else if (document.webkitExitFullscreen) { /* Safari */
        document.webkitExitFullscreen();
    } else if (document.msExitFullscreen) { /* IE11 */
        document.msExitFullscreen();
    }
    fullscreen = false
}

maximizebutton.on("click", function (e) {
    e.preventDefault()
    const $this = $(this)
    $this.hasClass("fullscreen") ? closeFullscreen() : openFullscreen()
    $this.toggleClass("fullscreen")
})

$("body").on("load", () => {
    if (fullscreen) {
        openFullscreen()
    }
})

// function getcountries(obj, option = 'choose') {
//     const dfd = $.Deferred()
//     $.getJSON(
//         "../controllers/settingsoperations.php",
//         {
//             getcountries: true
//         },
//         (data) => {
//             let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
//             data.forEach((country) => {
//                 results += `<option value='${country.countryid}'>${country.countryname}</option>`
//             })
//             // console.log(results)
//             obj.html(results)
//             dfd.resolve()
//         }
//     )
//     return dfd.promise()
// }


function validateuserrecruitmentapproval(levelid, unitid) {
    const dfd = $.Deferred()
    $.getJSON(
        "../controllers/useroperations.php",
        {
            checkrecruitmentuserprivilege: true,
            levelid,
            unitid
        }
    ).done((data) => {
        dfd.resolve(data)
    })
    return dfd.promise()
}

function validateuserovertimeapproval(levelid, unitid) {
    const dfd = $.Deferred();
    $.getJSON(
        "../controllers/useroperations.php",
        {
            checkovertimeuserprivilege: true,
            levelid,
            unitid
        }
    ).done((data) => {
        dfd.resolve(data)
    })
    return dfd.promise()
}

function isJsonObject(variable) {
    return (
        typeof variable === 'object' &&
        variable !== null &&
        !Array.isArray(variable)
    )
}

function minutesBetween(time1, time2) {
    // Convert to Date objects (same day assumed)
    // 1970-01-01 is a dummy date to ensure the times are on the same date
    const t1 = new Date(`1970-01-01T${time1}:00`)
    const t2 = new Date(`1970-01-01T${time2}:00`)

    // Difference in milliseconds → convert to minutes
    const diffMs = t2 - t1;
    return diffMs / (1000 * 60)
}

function getveterinariansselect(obj, option = 'choose') {
    $.getJSON(
        "../controllers/veterinarianoperations.php",
        {
            getveterinarians: true
        },
        (data) => {
            let results = option == 'all' ? "<option value='0' disabled selected>All</option>" : "<option value='' disabled selected>Choose Vet</option>"
            data.forEach((vet) => {
                results += `<option value='${vet.id}'>${vet.vetname}</option>`
            })
            obj.html(results)
        }
    )
}

function addMinutesToTime(time, minutesToAdd) {
    const date = new Date(`1970-01-01T${time}:00`);
    date.setMinutes(date.getMinutes() + minutesToAdd);
    return date.toTimeString().slice(0, 5); // HH:MM format
}

function getrequisitionrectruitments(obj, option = 'all', showall = 1) {
    $.getJSON(
        "../controllers/requisitionoperations.php",
        {
            filterrecruitmentrequisitions: true,
            companyid: 0,
            unitid: 0,
            departmentid: 0,
            startdate: '01-Jan-2025',
            enddate: '31-Dec-2100'
        }
    ).done((data) => {
        if (showall == 0) {
            data = data.filter(requisition => requisition.status == "Approved")
        }
        let results = option == 'all' ? "<option value='0'>&lt;All&gt;</option>" : "<option value=''>&lt;Choose&gt;</option>"
        data.forEach((requisition) => {
            results += `<option value='${requisition.requisitionid}'>${requisition.requisitionno}</option>`
        })
        // console.log(results)
        obj.html(results)
    })
}

function getpens(obj) {
    $.getJSON(
        "../controllers/penoperations.php",
        {
            action: 'getpens'
        },
        (data) => {
            let results = "";
            let totalActivePens = data.length;
            let totalCapacity = 0;
            let totalOccupancy = 0;

            data.forEach((pen) => {
                totalCapacity += parseInt(pen.capacity) || 0;
                totalOccupancy += parseInt(pen.current_occupancy) || 0;

                const occupancyPercent = pen.capacity > 0 ? (pen.current_occupancy / pen.capacity) * 100 : 0;
                let statusBadge = '';
                
                if (occupancyPercent >= 100) {
                    statusBadge = `<span class="badge badge-pill py-1 px-3 d-inline-flex align-items-center" style="background-color: #fecaca; color: #991b1b; font-size: 10px; font-weight: 700; letter-spacing: 0.05em;">
                                    <span class="mr-1" style="width: 5px; height: 5px; background: #b91c1c; border-radius: 50%;"></span> OVER CAPACITY
                                  </span>`;
                } else if (occupancyPercent >= 90) {
                    statusBadge = `<span class="badge badge-pill py-1 px-3 d-inline-flex align-items-center" style="background-color: #fef08a; color: #854d0e; font-size: 10px; font-weight: 700; letter-spacing: 0.05em;">
                                    <span class="mr-1" style="width: 5px; height: 5px; background: #a16207; border-radius: 50%;"></span> NEAR CAPACITY
                                  </span>`;
                } else {
                    statusBadge = `<span class="badge badge-pill py-1 px-3 d-inline-flex align-items-center" style="background-color: #acf4a4; color: #002203; font-size: 10px; font-weight: 700; letter-spacing: 0.05em;">
                                    <span class="mr-1" style="width: 5px; height: 5px; background: #206223; border-radius: 50%;"></span> OPTIMAL
                                  </span>`;
                }

                results += `
                    <tr class="border-bottom" style="border-color: rgba(0,0,0,0.03) !important;">
                        <td class="py-4 pl-4 font-weight-bold">${pen.penname}</td>
                        <td class="py-4 text-muted small d-none d-md-table-cell">${pen.pentype}</td>
                        <td class="py-4 font-weight-medium d-none d-md-table-cell">${pen.current_occupancy} / ${pen.capacity}</td>
                        <td class="py-4 d-none d-lg-table-cell">${statusBadge}</td>
                        <td class="py-4 text-right pr-4">
                            <button class="btn btn-link text-muted p-0"><span class="material-symbols-outlined">more_vert</span></button>
                        </td>
                    </tr>
                `;
            });
            obj.html(results);

            // Update infrastructure stats
            const totalCapacityUtilized = totalCapacity > 0 ? Math.round((totalOccupancy / totalCapacity) * 100) : 0;
            $("#totalActivePens").text(totalActivePens);
            $("#capacityProgressBar").css("width", totalCapacityUtilized + "%");
            $("#totalCapacityUtilizedText").text(totalCapacityUtilized + "% Capacity Utilized");
        }
    );
}

function getbreedsselect(obj) {
    $.getJSON("../controllers/breedoperations.php", { getbreeds: true }, (data) => {
        let breeds = data;
        let options = '<option value="" disabled selected>Select breed...</option>';
        breeds.forEach(breed => {
            options += `<option value="${breed.id}">${breed.breedname}</option>`;
        });
        obj.html(options);
    });
}

function getpensselect(obj) {
    $.getJSON("../controllers/penoperations.php", { action: 'getpens' }, (data) => {
        let pens = data;
        let options = '<option value="" disabled selected>Select pen...</option>';
        pens.forEach(pen => {
            options += `<option value="${pen.id}">${pen.penname} (${pen.pentype})</option>`;
        });
        obj.html(options);
    });
}

function getpenscheckboxes(container) {
    $.getJSON("../controllers/penoperations.php", { getpens: true }, (data) => {
        let html = '';
        if (data && data.length > 0) {
            data.forEach(pen => {
                html += `
                    <label class="pen-item">
                        <input type="checkbox" value="${pen.id}">
                        <span>${pen.penname} (${pen.pentype})</span>
                    </label>
                `;
            });
        } else {
            html = '<div class="text-center py-3 text-muted small">No pens found</div>';
        }
        container.html(html);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.error("Pen Loading Error:", textStatus, errorThrown);
        container.html('<div class="text-center py-3 text-danger small">Error loading pens. Please try again.</div>');
    });
}

function getanimals(obj, status = 'all', option = 'choose') {
    const $target = (typeof obj === 'string') ? $('#' + obj) : $(obj);
    
    $.getJSON("../controllers/animaloperations.php", { action: 'getanimals' }, (data) => {
        let animals = data;
        
        // Filter by status if provided and not 'all'
        if (status !== 'all') {
            animals = animals.filter(animal => animal.status.toLowerCase() === status.toLowerCase());
        }
        
        let options = (option === 'all' || option === 'All Animals') ? '<option value="">All Animals</option>' : '<option value="" disabled selected>Choose an animal</option>';
        animals.forEach(animal => {
            options += `<option value="${animal.id}">${animal.tagid} (${animal.designatedname || 'Unnamed'})</option>`;
        });
        $target.html(options);
    }).fail((jqXHR, textStatus, errorThrown) => {
        console.error("Failed to load animals:", textStatus, errorThrown);
    });
}

function getfeedmixesselect(obj) {
    $.getJSON("../controllers/feedmixoperations.php", { action: 'getfeedmixes' }, (data) => {
        let mixes = data;
        let options = '<option value="" disabled selected>Select Ration Mix...</option>';
        mixes.forEach(mix => {
            options += `<option value="${mix.id}">${mix.feedname} (${mix.feedcode})</option>`;
        });
        obj.html(options);
    });
}

function getdiseases(obj) {
    $.getJSON("../controllers/diseaseoperations.php", { getdiseases: true }, (data) => {
        let options = '<option value="" disabled selected>Select disease...</option>';
        data.forEach(disease => {
            options += `<option value="${disease.id}">${disease.diseasename}</option>`;
        });
        obj.html(options);
    });
}

function getinventoryfeedsselect(obj) {
    $.getJSON("../controllers/inventoryoperations.php", { action: 'getitems' }, (data) => {
        let options = '<option value="" disabled selected>Select Complete Feed...</option>';
        if (data && data.length > 0) {
            // Filter only items marked as feed
            const feeds = data.filter(item => parseInt(item.is_feed) === 1);
            feeds.forEach(feed => {
                options += `<option value="${feed.id}">${feed.itemname} (${feed.itemcode})</option>`;
            });
        }
        obj.html(options);
    });
}


function getAnimalsByPenList(penid, targetList) {
    $.getJSON("../controllers/animaloperations.php", { action: 'getanimalsbypen', penid: penid }, (data) => {
        let html = '';
        if (data && data.length > 0) {
            html = '<div class="d-flex flex-column gap-2">';
            data.forEach(animal => {
                const breed = animal.breedname ? animal.breedname : 'Unknown Breed';
                html += `
                    <div class="animal-card-wrapper">
                        <div class="animal-card-item" data-animalid="${animal.id}">
                            <div class="d-flex align-items-center">
                                <div class="mr-3" style="min-width: 60px; border-right: 1px solid #f1f5f1;">
                                    <span class="text-muted" style="font-size: 0.725rem; font-weight: 800; font-family: monospace; color: #206223 !important;">${animal.tagid}</span>
                                </div>
                                <div>
                                    <span style="font-size: 0.825rem; font-weight: 500; color: #1a1c19;">${animal.designatedname || 'Unnamed'}</span>
                                    <span class="text-muted" style="font-size: 0.675rem; font-weight: 400; margin-left: 2px;">(${breed})</span>
                                </div>
                            </div>
                            <span class="material-symbols-outlined text-success" style="font-size: 1.25rem; font-variation-settings: 'FILL' 1;">check_circle</span>
                        </div>
                    </div>`;
            });
            html += '</div>';
        } else {
            html = '<div class="text-center py-4"><span class="material-symbols-outlined text-muted mb-2" style="font-size: 2.5rem; opacity: 0.2;">groups</span><p class="text-muted small italic mb-0">No animals found in this pen.</p></div>';
        }
        $(targetList).html(html);
    }).fail(() => {
        $(targetList).html('<div class="text-center py-4 text-danger small">Error loading animal audit ledger.</div>');
    });
}

function getinsurancecompaniesselect(obj) {
    $.getJSON(
        "../controllers/insuranceoperations.php",
        {
            action: 'getinsurancecompanies'
        },
        (data) => {
            let results = '<option value="" selected disabled>Select Insurance Provider</option>';
            data.forEach((company) => {
                results += `
                    <option value="${company.id}">${company.companyname}</option>
                `;
            });
            obj.html(results);
        }
    );
}