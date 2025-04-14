// פונקציה לבדיקת תקינות הטופס
function validateForm() {
    const txtTipName = document.getElementById('txtTipName').value.trim();
    const txtTipSubject = document.getElementById('txtTipSubject').value.trim();
    let isValid = true;

    // פונקציה עזר לבדוק ולהציג שגיאות
    function validateField(fieldValue, regex, errorElementId) {
        const errorElement = document.getElementById(errorElementId);
        if (fieldValue === '' || !regex.test(fieldValue)) {
            errorElement.style.display = 'block';
            isValid = false;
        } else {
            errorElement.style.display = 'none';
        }
    }

    // בדיקות עבור שם הטיפ ונושא הטיפ
    validateField(txtTipName, /^[A-Za-z\s]{2,50}$/, 'TipNameError');
    validateField(txtTipSubject, /^[A-Za-z\s]{2,50}$/, 'pwTipSubject');

    return isValid;
}

// פונקציה להעלאת קובץ
function uploadFile() {
    const fileUpload = document.getElementById('FileUpload1');
    const allowedFileTypes = ['zip', 'rar', 'pdf', 'png', 'jpg', 'jpeg', 'gif'];

    if (fileUpload.files.length === 0) {
        document.getElementById('ResultLabel').innerText = 'Please select a file.';
        return null; // החזרת null במקרה ואין קובץ
    }

    const file = fileUpload.files[0];
    const extension = file.name.split('.').pop().toLowerCase();

    // בדיקת סיומת הקובץ
    if (!allowedFileTypes.includes(extension)) {
        document.getElementById('ResultLabel').innerText = 'File type not allowed.';
        return null; // החזרת null במקרה שהסיומת לא מתאימה
    }

    const formDataFile = new FormData();
    formDataFile.append('file', file);

    // שליחת הבקשה להעלאת הקובץ
    return fetch('/upload', {
        method: 'POST',
        body: formDataFile
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('File upload failed: ' + response.statusText);
            }
            document.getElementById('ResultLabel').innerText = 'File uploaded successfully!';
            return file; // החזרת הקובץ במקרה של הצלחה
        })
        .catch(error => {
            document.getElementById('ResultLabel').innerText = 'File upload failed: ' + error.message;
            return null; // החזרת null במקרה של שגיאה
        });
}

// פונקציה לשליחת הטופס והעלאת הטיפ
async function handleSubmit(event) {
    event.preventDefault(); // מניעת רענון הדף

    // בדיקת תקינות הטופס
    if (!validateForm()) {
        alert("Please fix the errors before submitting.");
        return;
    }

    const txtTipName = document.getElementById('txtTipName').value.trim();
    const txtTipSubject = document.getElementById('txtTipSubject').value.trim();
    const fileUpload = document.getElementById('FileUpload1');

    // העלאת הקובץ אם קיים
    let uploadedFile = null;
    if (fileUpload.files.length > 0) {
        uploadedFile = await uploadFile();
        if (!uploadedFile) return; // אם ההעלאה נכשלה, לא נמשיך
    }

    // יצירת אובייקט FormData עבור הנתונים
    const formData = new FormData();
    formData.append('tip name', txtTipName);
    formData.append('tip subject', txtTipSubject);
    formData.append('formPage', 'new tip');

    if (uploadedFile) {
        formData.append('tip related files', uploadedFile);
    }

    // שליחת הבקשה
    try {
        const response = await fetch('/pages/aspx/SqlCode.aspx', {
            method: 'POST',
            body: formData
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Server error: ${response.status} - ${response.statusText}: ${errorText}`);
        }

        const data = await response.text();
        console.log("Server response: ", data);
        if (data.includes("New Tip Was Added!")) {
            alert("New Tip Was Added!");
            window.location.href = "/pages/Home Page/HomePage.aspx";
        } else {
            alert("Please try again.");
        }
    } catch (error) {
        console.error("Error during fetch:", error);
        alert(`There was an issue with the submission. Please try again later. Detailed error: ${error.message}`);
    }
}

// קישור הפונקציה לאירוע שליחת הטופס
document.getElementById('tipForm').addEventListener('submit', handleSubmit);
