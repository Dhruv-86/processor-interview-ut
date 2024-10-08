<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Upload CSV Files</title>
    <style>
        .file-table {
            width: 60%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .file-table th, .file-table td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }

        .file-table th {
            background-color: #f2f2f2;
        }


        .success-text {
            color: green;
        }

        .error-text {
            color: red;
        }


        .nav-links a {
            margin-right: 15px;
            text-decoration: none;
            color: #2196F3;
        }

        .nav-links a:hover {
            text-decoration: underline;
        }

        #uploadButton {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 18px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }

        #uploadButton:hover {
            background-color: #45a049;
        }

        #file {
            margin-top: 10px;
        }

    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let selectedFiles = [];
            let uploadedFiles = [];


            document.getElementById('file').addEventListener('change', handleFileSelect);

            function handleFileSelect(event) {
                const files = event.target.files;
                const fileTable = document.getElementById('fileTableBody');

                for (let i = 0; i < files.length; i++) {
                    const file = files[i];


                    if (!uploadedFiles.includes(file.name) && !selectedFiles.some(f => f.name === file.name)) {
                        selectedFiles.push(file);


                        const row = fileTable.insertRow();
                        const nameCell = row.insertCell(0);
                        const actionCell = row.insertCell(1);

                        nameCell.textContent = file.name;


                        const removeButton = document.createElement('button');
                        removeButton.textContent = 'Remove';
                        removeButton.className = 'remove-btn';
                        removeButton.onclick = function() {
                            removeFile(file.name, row);
                        };
                        actionCell.appendChild(removeButton);
                    }
                }


                event.target.value = '';
            }


            function removeFile(fileName, row) {
                selectedFiles = selectedFiles.filter(f => f.name !== fileName);
                row.remove();
            }


            document.getElementById('fileUploadForm').addEventListener('submit', uploadFiles);

            function uploadFiles(event) {
                event.preventDefault();

                if (selectedFiles.length === 0) {
                    alert("Please select files to upload.");
                    return;
                }

                const formData = new FormData();
                selectedFiles.forEach(file => {
                    formData.append('files', file);
                });

                fetch('${pageContext.request.contextPath}/upload', {
                    method: 'POST',
                    body: formData,
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (Array.isArray(data)) {
                        const fileTable = document.getElementById('fileTableBody');

                        data.forEach(file => {
                            const rows = fileTable.rows;
                            for (let i = 0; i < rows.length; i++) {
                                if (rows[i].cells[0].textContent === file.name) {
                                    rows[i].cells[1].innerHTML = file.success
                                        ? '<span class="success-text">Uploaded Successfully</span>'
                                        : '<span class="error-text">Upload Failed</span>';
                                }
                            }

                            if (file.success) {
                                uploadedFiles.push(file.name);
                            }
                        });


                        selectedFiles = [];
                    } else {
                        console.error('Unexpected data format:', data);
                        alert('Error: Unexpected response from the server.');
                    }
                })
                .catch(error => {
                    console.error('Error uploading files:', error);
                    alert('Error uploading files');
                });
            }
        });
    </script>
</head>
<body>
<jsp:include page="header.jsp" />
<h1>Upload CSV Files</h1>


<form id="fileUploadForm" method="POST" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data">
    <label for="file">Choose CSV Files:</label><br>
    <input type="file" id="file" name="files" accept=".csv" multiple />
    <br><br>


    <table class="file-table">
        <thead>
            <tr>
                <th>File Name</th>
                <th>Status / Action</th>
            </tr>
        </thead>
        <tbody id="fileTableBody">

        </tbody>
    </table>

    <br>
    <button type="submit" id="uploadButton">Upload All</button>
</form>

<jsp:include page="footer.jsp" />
</body>
</html>
