<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="../cs/UserTips.aspx.cs" Inherits="UserTipsNameSpace.UserTips"   MasterPageFile="../Master/Site.Master"%>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>User Tips</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1 class="text-center">User Tips</h1>
            <div class="row">
                <div class="col-md-12">
                    <h3>User Tips</h3>
                    <div id="UserTipsLiteral" runat="server"></div>
                </div>
            </div>
        </div>
    </form>

    <!-- Add Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
