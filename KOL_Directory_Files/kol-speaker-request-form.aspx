<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kol-speaker-request-form.aspx.cs" Inherits="speaker_request_form" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Key Opinion Leader Speaker Request</title>
    <link href="kol-speaker-directory.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function displayCalendar1() {
            var datePicker1 = document.getElementById('datePicker1');
            datePicker1.style.display = 'block';
        }
        function displayCalendar2() {
            var datePicker2 = document.getElementById('datePicker2');
            datePicker2.style.display = 'block';
        }
        function displayCalendar3() {
            var datePicker3 = document.getElementById('datePicker3');
            datePicker3.style.display = 'block';
        }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
  <div id="header">
    <h1 class="headerUnderline">KOL Guest Speaker Directory</h1>
    <h2>Speaker policy and request form</h2>
    <div id="backButton"><a href="javascript: window.history.go(-1)"><img src="Images/back-arrow.png" width="30" height="14" border="0" />Back to the speaker directory</a></div>
  </div>
  <!--end of Header-->
    <asp:Panel ID="PolicyPanel" runat="server">
      <p style="margin-left:20px; margin-right:20px;">&nbsp;</p>
        <p style="margin-left:20px; margin-right:20px;">To request to have a KOL speak at a local meeting or event, please fill out the KOL Request Form below.</p>
      <p style="margin-left:20px; margin-right:20px;">*Tip: To help minimize expenses while gaining a larger target audience, please secure speakers in conjunction with a local chapter event or meeting if possible.</p>
        <ul>
            <li>All requests will be submitted for approval to the Marketing Director of the division selected:
                <ul>
                    <li>IV Therapy: <strong>Jason Woodbury</strong></li>
                    <li>Oncology: <strong>Tracie Kirtz</strong></li>
                    <li>Critical Care: <strong>Scott Seewald</strong></li>
                </ul>
            </li>
            <li>Only the Marketing Directors can make direct contact with the KOL speaker.  PSR's are <strong>NOT</strong> to contact the KOL speaker. </li>
          <li>Request must be submitted using the KOL Speaker Request Form. This form will ensure the proper handling and planning of all requests.<br />
          </li>
            <li>Request form must be submitted 60 days prior to the purposed date.<br />
            </li>
            <li>Allow 7 days for processing &amp; approval.
                <br />
            </li>
            <li>All requests are subject to approval by the management.<br />
            </li>
            <li>Please fill out all required fields (fields with an <span class="redText">*</span>
                asterisk on the form indicates a required field).<br />
            </li>
            <li>PSR must be available to attend the presentation.
<ul>
              <li>If not available to attend, the PSR is responsible to find a replacement
            and notifying the Marketing Director.</li>
              </ul>
                <br />
          </li>
            <li>Evaluation &amp; Survey Forms with leads must be sent to the Marketing Manager within
                3 days after the presentation.</li>
        </ul>
            <h3 style="margin: 10px 0px 0px 20px;">Fill out a speaker request form:</h3>
 
    </asp:Panel>
    <p>
        <asp:HiddenField ID="ManagerName" runat="server" />
        <asp:HiddenField ID="ManagerEmail" runat="server" />
    </p>
    <asp:Panel ID="FormPanel" runat="server">
        <table width="100%" border="1" cellpadding="5" cellspacing="0" class="requestTable">
            <tr>
                <td width="265" valign="top">
                    <span class="redText">* Indicates a Required Field</span></td>
                <td colspan="2">&nbsp;
                    </td>
            </tr>
            <tr>
                <td valign="top" width="265"><strong>Your name:<span class="redText">*</span></strong>&nbsp;</td>
                <td colspan="2">
                    <asp:TextBox ID="RequestorName" runat="server" Width="250px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RequestorName" ErrorMessage="Enter your name" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top" width="265"><strong>Your e-mail address:<span class="redText">*</span></strong>&nbsp;</td>
                <td colspan="2">
                    <asp:TextBox ID="RequestorEmail" runat="server" Width="250px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RequestorEmail" ErrorMessage="Enter your e-mail" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top" width="265"><strong>Your business division:</strong>&nbsp;</td>
                <td colspan="2">
                    <asp:TextBox ID="BusinessDivision" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" width="265"><strong>Requested speaker:</strong>&nbsp;</td>
                <td colspan="2">
                    <asp:TextBox ID="RequestedSpeaker" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" width="265"><strong>Requested speaking topic:</strong>&nbsp;</td>
                <td colspan="2">
                    <asp:TextBox ID="RequestedSpeakingTopic" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" width="265"><strong>Chapter and/or Association:<span class="redText">*</span></strong>&nbsp; </td>
                <td colspan="2">
                    <asp:DropDownList ID="ChapterAssociation" runat="server">
                    </asp:DropDownList>
                    &nbsp;or Other:<asp:TextBox ID="ChapterAssociationOther" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ChapterAssociation" ErrorMessage="Select a Chapter/Association" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td rowspan="2" valign="top">
                    <strong>Chapter/Association location:<span class="redText">*</span></strong>&nbsp;
                </td>
                <td>
                    City:
                </td>
                <td width="525">
                    <asp:TextBox ID="ChapterAssociationCity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ChapterAssociationCity"
                        ErrorMessage="Enter a City" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td width="110">
                    State:
                </td>
                <td >
                    <asp:TextBox ID="ChapterAssociationState" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ChapterAssociationState"
                        ErrorMessage="Enter a State" ForeColor="Red" SetFocusOnError="True" 
                        Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <strong>Is this part of a local chapter
                        <br />
                        or association meeting? </strong>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="ChapterLocalMeeting" runat="server">
                        <asp:ListItem Value="None chosen">Please Select</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <strong>Is there a table-top or<br />
                        exhibit opportunity?</strong>&nbsp;
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="ExhibitOpportunity" runat="server">
                        <asp:ListItem Value="None chosen">Please Select</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td rowspan="5" valign="top">
                    <strong>Chapter/Association contact: <span class="redText">*</span></strong>&nbsp;
                </td>
                <td>
                    Facility:
                </td>
                <td >
                    <asp:TextBox ID="AssociationContactFacility" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="AssociationContactFacility"
                        ErrorMessage="Enter a Facility" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Name:
                </td>
                <td >
                    <asp:TextBox ID="AssociationContactName" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="AssociationContactName"
                        ErrorMessage="Enter a Contact Name" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Title:
                </td>
                <td >
                    <asp:TextBox ID="AssociationContactTitle" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Phone:
                </td>
                <td >
                    <asp:TextBox ID="AssociationContactPhone" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="AssociationContactPhone"
                        ErrorMessage="Enter a Contact Phone" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    E-Mail:
                </td>
                <td >
                    <asp:TextBox ID="AssociationContactEmail" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="AssociationContactEmail"
                        ErrorMessage="Enter a Contact E-Mail" ForeColor="Red" SetFocusOnError="True"
                        Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td rowspan="3" valign="top">
                    <strong>Proposed date(s):<span class="redText">*</span></strong>&nbsp;
                </td>
                <td>
                    Date Option 1:
                </td>
                <td >
                    <asp:TextBox ID="ProposedDate1" runat="server"></asp:TextBox>
                    <img src="Images/calendar-icon.gif" onclick="displayCalendar1()" border="0" />
                    <div id="datePicker1">
                        <asp:Calendar ID="calEventDate1" runat="server" OnSelectionChanged="calEventDate1_SelectionChanged" />
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ProposedDate1"
                        ErrorMessage="Enter a Proposed Date" ForeColor="Red" SetFocusOnError="True"
                        Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Date Option 2:
                </td>
                <td >
                    <asp:TextBox ID="ProposedDate2" runat="server"></asp:TextBox>
                    <img src="Images/calendar-icon.gif" onclick="displayCalendar2()" border="0" />
                    <div id="datePicker2">
                        <asp:Calendar ID="calEventDate2" runat="server" OnSelectionChanged="calEventDate2_SelectionChanged" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    Date Option 3:
                </td>
                <td >
                    <asp:TextBox ID="ProposedDate3" runat="server"></asp:TextBox>
                    <img src="Images/calendar-icon.gif" onclick="displayCalendar3()" border="0" />
                    <div id="datePicker3">
                        <asp:Calendar ID="calEventDate3" runat="server" OnSelectionChanged="calEventDate3_SelectionChanged" />
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <strong>Purposed time: <span class="redText">*</span></strong>&nbsp;
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="ProposedTime" runat="server">
                        <asp:ListItem Value="No time was chosen">Please Select</asp:ListItem>
                        <asp:ListItem>6:00am</asp:ListItem>
                        <asp:ListItem>6:30am</asp:ListItem>
                        <asp:ListItem>7:00am</asp:ListItem>
                        <asp:ListItem>7:30am</asp:ListItem>
                        <asp:ListItem>8:00am</asp:ListItem>
                        <asp:ListItem>8:30am</asp:ListItem>
                        <asp:ListItem>9:00am</asp:ListItem>
                        <asp:ListItem>9:30am</asp:ListItem>
                        <asp:ListItem>10:00am</asp:ListItem>
                        <asp:ListItem>10:30am</asp:ListItem>
                        <asp:ListItem>11:00am</asp:ListItem>
                        <asp:ListItem>11:30am</asp:ListItem>
                        <asp:ListItem>12:00 noon</asp:ListItem>
                        <asp:ListItem>12:30pm</asp:ListItem>
                        <asp:ListItem>1:00pm</asp:ListItem>
                        <asp:ListItem>1:30pm</asp:ListItem>
                        <asp:ListItem>2:00pm</asp:ListItem>
                        <asp:ListItem>2:30pm</asp:ListItem>
                        <asp:ListItem>3:00pm</asp:ListItem>
                        <asp:ListItem>3:30pm</asp:ListItem>
                        <asp:ListItem>4:00pm</asp:ListItem>
                        <asp:ListItem>4:30pm</asp:ListItem>
                        <asp:ListItem>5:00pm</asp:ListItem>
                        <asp:ListItem>5:30pm</asp:ListItem>
                        <asp:ListItem>6:00pm</asp:ListItem>
                        <asp:ListItem>6:30pm</asp:ListItem>
                        <asp:ListItem>7:00pm</asp:ListItem>
                        <asp:ListItem>7:30pm</asp:ListItem>
                        <asp:ListItem>8:00pm</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ProposedTime"
                        ErrorMessage="Enter a Proposed Time" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <strong>Number of expected attendees:<span class="redText">*</span></strong>&nbsp;
                </td>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ExpectedAttendees"
                        ErrorMessage="Enter an Expected # of Attendees" ForeColor="Red" SetFocusOnError="True"
                        Style="font-weight: 700"></asp:RequiredFieldValidator>
                    <asp:RadioButtonList ID="ExpectedAttendees" runat="server">
                        <asp:ListItem>20-35</asp:ListItem>
                        <asp:ListItem>35-45</asp:ListItem>
                        <asp:ListItem>45-55</asp:ListItem>
                        <asp:ListItem>55 or more</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <strong>ICU will fund the following:<span class="redText">*</span></strong>&nbsp;
                </td>
                <td colspan="2">
                    <asp:CheckBoxList ID="IcuWillFund" runat="server">
                        <asp:ListItem>Speaker Honorarium</asp:ListItem>
                        <asp:ListItem>Speaker Travel</asp:ListItem>
                        <asp:ListItem>Venue</asp:ListItem>
                        <asp:ListItem>Audio/Visual Rental</asp:ListItem>
                        <asp:ListItem>Catering and/or Food and Beverage</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <strong>If a venue is needed, please recommend 2-3 possible locations:</strong>
                </td>
                <td colspan="2">
                    <p>
                        <asp:TextBox ID="VenueRecomnd" runat="server" Rows="4" TextMode="MultiLine" Width="400px"></asp:TextBox>
                        &nbsp;</p>
                    <p class="redText">
                        (Venue is based on availability &amp; management approval)</p>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <strong>Will continuing education credits<br />
                        be provided?</strong>&nbsp;
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="CEcredits" runat="server">
                        <asp:ListItem>Please Select</asp:ListItem>
                        <asp:ListItem>Yes CE credits will be provided</asp:ListItem>
                        <asp:ListItem>No CE credits will not be provided</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <strong>Please select an invitation option:<span class="redText">*</span></strong>
                </td>
                <td colspan="2">
                    <asp:CheckBoxList ID="InviteOption" runat="server">
                        <asp:ListItem>Printed Invite</asp:ListItem>
                        <asp:ListItem>E-Invite</asp:ListItem>
                        <asp:ListItem>No Invite Needed</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <strong>Additional comments:</strong>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="Comments" runat="server" Rows="4" TextMode="MultiLine" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" rowspan="3">
                    &nbsp; &nbsp; &nbsp;
                </td>
                <td colspan="2">&nbsp;
                    
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="SubmitBtn" runat="server" Text="Submit Request" 
                        onclick="SubmitBtn_Click" UseSubmitBehavior="False" />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;
                    
                </td>
            </tr>
        </table>
    </asp:Panel>
             </div>
  <!--end of Wrapper-->
    </form>
</body>
</html>
