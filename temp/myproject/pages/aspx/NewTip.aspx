<%@ Page Language="C#" CodeFile="../cs/NewTip.aspx.cs" Inherits="Namespace.NewTip" MasterPageFile="../Master/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Submit a New Tip</h2>
    <script src="../js/NewTip.js" type="text/javascript"></script>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        .tip-form {
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input[type="text"], .form-group input[type="file"], .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .error {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }

        .submit-button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #4cae4c;
        }

        .result-label {
            margin-top: 15px;
            text-align: center;
            font-weight: bold;
        }
    </style>

    <div class="tip-form">
        <div class="form-group">
            <label for="txtTipName">Tip Name</label>
            <asp:TextBox ID="txtTipName" runat="server" placeholder="Enter the tip name" ClientIDMode="Static"></asp:TextBox>
            <asp:Panel ID="TipNameError" runat="server" ClientIDMode="Static" style="display:none;" CssClass="error">
                Error: Tip Name is required and must be 2-50 characters long.
            </asp:Panel>
        </div>

        <div class="form-group">
            <label for="ddlSubjects">Select Subject</label>
            <asp:DropDownList ID="ddlSubjects" runat="server" ClientIDMode="Static" AutoPostBack="false">
                <asp:ListItem Text="-- Select Subject --" Value="" />
                <asp:ListItem Text="Biology" Value="Biology" />
                <asp:ListItem Text="Chemistry" Value="Chemistry" />
                <asp:ListItem Text="Physics" Value="Physics" />
                <asp:ListItem Text="Geography" Value="Geography" />
                <asp:ListItem Text="Environmental Science" Value="EnvironmentalScience" />
                <asp:ListItem Text="Computer Science" Value="ComputerScience" />
                <asp:ListItem Text="Software Engineering" Value="SoftwareEngineering" />
                <asp:ListItem Text="Information Systems" Value="InformationSystems" />
                <asp:ListItem Text="Mathematics" Value="Mathematics" />
                <asp:ListItem Text="Statistics" Value="Statistics" />
                <asp:ListItem Text="Psychology" Value="Psychology" />
                <asp:ListItem Text="Sociology" Value="Sociology" />
                <asp:ListItem Text="Political Science" Value="PoliticalScience" />
                <asp:ListItem Text="Economics" Value="Economics" />
                <asp:ListItem Text="Anthropology" Value="Anthropology" />
                <asp:ListItem Text="English" Value="English" />
                <asp:ListItem Text="Spanish" Value="Spanish" />
                <asp:ListItem Text="French" Value="French" />
                <asp:ListItem Text="German" Value="German" />
                <asp:ListItem Text="Chinese" Value="Chinese" />
                <asp:ListItem Text="Hebrew" Value="Hebrew" />
                <asp:ListItem Text="Arabic" Value="Arabic" />
                <asp:ListItem Text="Philosophy" Value="Philosophy" />
                <asp:ListItem Text="History" Value="History" />
                <asp:ListItem Text="Literature" Value="Literature" />
                <asp:ListItem Text="Art History" Value="ArtHistory" />
                <asp:ListItem Text="Law" Value="Law" />
                <asp:ListItem Text="Business Studies" Value="BusinessStudies" />
                <asp:ListItem Text="Education" Value="Education" />
                <asp:ListItem Text="Medicine" Value="Medicine" />
                <asp:ListItem Text="Nursing" Value="Nursing" />
                <asp:ListItem Text="Engineering" Value="Engineering" />
            </asp:DropDownList>
            <asp:Panel ID="SubjectError" runat="server" ClientIDMode="Static" style="display:none;" CssClass="error">
                Error: Please select a subject.
            </asp:Panel>
        </div>

        <div class="form-group">
            <label for="txtTipText">Tell Us Your Tip</label>
            <asp:TextBox ID="txtTipText" runat="server" TextMode="MultiLine" Rows="4" placeholder="Enter the tip!" ClientIDMode="Static"></asp:TextBox>
            <asp:Panel ID="TipTextError" runat="server" ClientIDMode="Static" style="display:none;" CssClass="error">
                Error: The tip text is required and must be between 2 and 50 characters long.
            </asp:Panel>
        </div>

        <div class="form-group">
            <label for="FileUpload1">Attach File</label>
            <asp:FileUpload ID="FileUpload1" runat="server" ClientIDMode="Static" />
        </div>

        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="submit-button" />
        <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text=""></asp:Label>
    </div>
</asp:Content>
