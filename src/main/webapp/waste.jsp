<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <script>
        window.onload = function() {
            // Toggle visibility of sorting options
            function toggleSortingOptions() {
                var sortingOptions = document.getElementById("sortingOptions");
                sortingOptions.style.display = (sortingOptions.style.display === "none") ? "flex" : "none";
            }

            // Generic function to sort the table by column index
            function sortTableByColumn(columnIndex) {
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.getElementById("myTable");
                switching = true;

                while (switching) {
                    switching = false;
                    rows = table.rows;
                    var rowCount = rows.length - 1;

                    for (i = 1; i < rowCount; i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("TD")[columnIndex];
                        y = rows[i + 1].getElementsByTagName("TD")[columnIndex];

                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }

                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
            }

            // Event listener for "Sort By" button click
            document.getElementById("sortByButton").addEventListener("click", function() {
                toggleSortingOptions();
            });

            // Event listeners for sorting options
            var sortingOptions = document.getElementsByClassName("sorting-option");
            for (var i = 0; i < sortingOptions.length; i++) {
                sortingOptions[i].addEventListener("click", function() {
                    var columnIndex = parseInt(this.getAttribute("data-column"));
                    sortTableByColumn(columnIndex);
                });
            }
        };
    </script>
    <style>
        .menu {
            display: flex;
            align-items: center;
        }

        .menu-item {
            cursor: pointer;
            padding: 8px;
            margin-right: 8px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .menu-item:hover {
            background-color: #e0e0e0;
        }

        #sortingOptions {
            display: none;
        }

        .sorting-option {
            display: flex;
            align-items: center;
            padding: 8px;
            margin-right: 8px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .sorting-option:first-child {
            margin-left: 8px;
        }
    </style>
</head>
<body>
    <div class="menu">
        <button id="sortByButton">Sort By</button>
        <div id="sortingOptions">
            <div class="sorting-option" data-column="0">Sort by Name</div>
            <div class="sorting-option" data-column="1">Sort by Country</div>
            <!-- Add more sorting options as needed -->
        </div>
    </div>

    <table id="myTable">
        <tr>
            <th>Name</th>
            <th>Country</th>
            <!-- Add more table headers as needed -->
        </tr>
        <tr>
            <td>John</td>
            <td>USA</td>
            <!-- Add more table cells as needed -->
        </tr>
        <tr>
            <td>Emma</td>
            <td>Canada</td>
            <!-- Add more table cells as needed -->
        </tr>
        <!-- Add more table rows as needed -->
    </table>
</body>
</html>

    