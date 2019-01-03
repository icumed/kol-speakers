using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class speaker_request_form : System.Web.UI.Page
{
    string BsnDivision;
    string Speaker; 

     protected void Page_Load(object sender, EventArgs e)
    {
        // Get values passed in URL
        if (Request.QueryString["bsnDiv"] != null)
        {
            BsnDivision = Request.QueryString["bsnDiv"].ToString();
            BusinessDivision.Text = BsnDivision;
        }

        if (Request.QueryString["Speaker"] != null)
        {
            Speaker = Request.QueryString["Speaker"].ToString();
            RequestedSpeaker.Text = Speaker;
        }
        

        //Set the Marketing Manager based on the selection made to the BsnDivsnSelect DropDownList.
        switch (BsnDivision)
        {
            case "IV Therapy":
                ManagerName.Value = "Jason Woodbury";
                ManagerEmail.Value = "jwoodbury@icumed.com, jsmith1@icumed.com";
                break;
            case "Oncology":
                ManagerName.Value = "Tracie Kirtz";
                ManagerEmail.Value = "tkirtz@icumed.com, jsmith1@icumed.com";
                break;
            case "Critical Care":
                ManagerName.Value = "Scott Seewald";
                ManagerEmail.Value = "sseewald@icumed.com, jsmith1@icumed.com";
                break;
            default:
                ManagerName.Value = "Jennifer Smith";
                ManagerEmail.Value = "jsmith@icumed.com";
                break;
                
        }

        //Set the ChapterAssociation DropDownList values based on the business division
        if (!IsPostBack)
        {
            switch (BsnDivision)
            {
                case "IV Therapy":
                    // Create a new ListItemCollection.
                    ListItemCollection AssociationlistBoxDataIVT = new ListItemCollection();
                    // Add items to the collection.
                    AssociationlistBoxDataIVT.Add(new ListItem("Please Select"));
                    AssociationlistBoxDataIVT.Add(new ListItem("ANNA"));
                    AssociationlistBoxDataIVT.Add(new ListItem("APIC"));
                    AssociationlistBoxDataIVT.Add(new ListItem("AVA"));
                    AssociationlistBoxDataIVT.Add(new ListItem("INS"));
                    AssociationlistBoxDataIVT.Add(new ListItem("Other:"));
                    // Set the ListItemCollection as the data source for ChapterAssociation DropDownList.
                    ChapterAssociation.DataSource = AssociationlistBoxDataIVT;
                    ChapterAssociation.DataBind();
                    break;
                case "Oncology":
                    // Create a new ListItemCollection.
                    ListItemCollection AssociationlistBoxDataONC = new ListItemCollection();
                    // Add items to the collection.
                    AssociationlistBoxDataONC.Add(new ListItem("Please Select"));
                    AssociationlistBoxDataONC.Add(new ListItem("APHON"));
                    AssociationlistBoxDataONC.Add(new ListItem("ASHP"));
                    AssociationlistBoxDataONC.Add(new ListItem("HOPA"));
                    AssociationlistBoxDataONC.Add(new ListItem("ISOPP"));
                    AssociationlistBoxDataONC.Add(new ListItem("ONS"));
                    AssociationlistBoxDataONC.Add(new ListItem("Other:"));
                    // Set the ListItemCollection as the data source for ChapterAssociation DropDownList.
                    ChapterAssociation.DataSource = AssociationlistBoxDataONC;
                    ChapterAssociation.DataBind();
                    break;
                case "Critical Care":
                    // Create a new ListItemCollection.
                    ListItemCollection AssociationlistBoxDataCC = new ListItemCollection();
                    // Add items to the collection.
                    AssociationlistBoxDataCC.Add(new ListItem("Please Select"));
                    AssociationlistBoxDataCC.Add(new ListItem("AACN"));
                    AssociationlistBoxDataCC.Add(new ListItem("ASA"));
                    AssociationlistBoxDataCC.Add(new ListItem("SCCM"));
                    AssociationlistBoxDataCC.Add(new ListItem("UHC"));
                    AssociationlistBoxDataCC.Add(new ListItem("Other:"));
                    // Set the ListItemCollection as the data source for ChapterAssociation DropDownList.
                    ChapterAssociation.DataSource = AssociationlistBoxDataCC;
                    ChapterAssociation.DataBind();
                    break;
                default:
                    // Create a new ListItemCollection.
                    ListItemCollection AssociationlistBoxData = new ListItemCollection();
                    // Add items to the collection.
                    AssociationlistBoxData.Add(new ListItem("None"));
                    AssociationlistBoxData.Add(new ListItem("Other:"));
                    // Set the ListItemCollection as the data source for ChapterAssociation DropDownList.
                    ChapterAssociation.DataSource = AssociationlistBoxData;
                    ChapterAssociation.DataBind();
                    break;
            }
        }
 
    } // end of page load methods


    //Change the date in the Proposed Date text boxs from the calendar date pickers
    protected void calEventDate1_SelectionChanged(object sender, EventArgs e)
    {
        ProposedDate1.Text = calEventDate1.SelectedDate.ToString("d");
        ProposedDate1.Focus(); //return the scroll window position back down to that area
    }
    protected void calEventDate2_SelectionChanged(object sender, EventArgs e)
    {
        ProposedDate2.Text = calEventDate2.SelectedDate.ToString("d");
        ProposedDate2.Focus(); //return the scroll window position back down to that area
    }
    protected void calEventDate3_SelectionChanged(object sender, EventArgs e)
    {
        ProposedDate3.Text = calEventDate3.SelectedDate.ToString("d");
        ProposedDate3.Focus(); //return the scroll window position back down to that area
    }
 

    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        // Collect all check box list items from the 'ICU will fund the following'
        // check box list group into one string
        string IcuWillFundChoosenItems = "";
        foreach (ListItem li in IcuWillFund.Items)
        {
            if (li.Selected)
            {
                IcuWillFundChoosenItems = IcuWillFundChoosenItems + li.Value + ", ";
            }
        }

        // Collect all check box list items from the 'Please select an invitation option'
        // check box list group into one string
        string InviteOptionChoosenItems = "";
        foreach (ListItem li in IcuWillFund.Items)
        {
            if (li.Selected)
            {
                InviteOptionChoosenItems = InviteOptionChoosenItems + li.Value + ", ";
            }
        }

        //Send request e-mail
        string emailMsgBody;
        //Format the e-mail message with a HTML table
        emailMsgBody =  "<html><header></head><body>";
        emailMsgBody = emailMsgBody + "<table width='650' border='1' cellpadding='5' cellspacing='0' >";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td width='265' valign='top'><strong>Your name:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + RequestorName.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top' width='265'><strong>Your e-mail address:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + RequestorEmail.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>Requested speaker:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + RequestedSpeaker.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>Requested speaking topic:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + RequestedSpeakingTopic.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top' width='265'><strong>Chapter and/or Association:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + ChapterAssociation.SelectedItem.Text + " " + ChapterAssociationOther.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td rowspan='2' valign='top'><strong>Chapter/Association location:</strong></td>";
        emailMsgBody = emailMsgBody + "<td>City:</td>";
        emailMsgBody = emailMsgBody + "<td width='425'>" + ChapterAssociationCity.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td width='110'>State:</td>";
        emailMsgBody = emailMsgBody + "<td>" + ChapterAssociationState.Text + "</td>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>Is this part of a local chapter or association meeting? </strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + ChapterLocalMeeting.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>Is there a table-top or exhibit opportunity?</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + ExhibitOpportunity.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td rowspan='5' valign='top'><strong>Chapter/Association contact: </strong></td>";
        emailMsgBody = emailMsgBody + "<td>Facility:</td>";
        emailMsgBody = emailMsgBody + "<td>" + AssociationContactFacility.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td>Name:</td>";
        emailMsgBody = emailMsgBody + "<td>" + AssociationContactName.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td>Title:</td>";
        emailMsgBody = emailMsgBody + "<td>" + AssociationContactTitle.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td>Phone:</td>";
        emailMsgBody = emailMsgBody + "<td>" + AssociationContactPhone.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td>E-Mail:</td>";
        emailMsgBody = emailMsgBody + "<td>" + AssociationContactEmail.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td rowspan='3' valign='top'><strong>Proposed date(s):</strong></td>";
        emailMsgBody = emailMsgBody + "<td>Date Option 1:</td>";
        emailMsgBody = emailMsgBody + "<td>" + ProposedDate1.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td>Date Option 2:</td>";
        emailMsgBody = emailMsgBody + "<td>" + ProposedDate2.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td>Date Option 3:</td>";
        emailMsgBody = emailMsgBody + "<td>" + ProposedDate3.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>Purposed time: </strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + ProposedTime.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>Number of expected attendees:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + ExpectedAttendees.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>ICU will fund the following:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + IcuWillFundChoosenItems + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>If a venue is needed, please recommend 2-3 possible locations:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + VenueRecomnd.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>Will continuing education credits be provided?</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + CEcredits.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>Please select an invitation option:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + InviteOptionChoosenItems + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "<tr>";
        emailMsgBody = emailMsgBody + "<td valign='top'><strong>Additional comments:</strong></td>";
        emailMsgBody = emailMsgBody + "<td colspan='2'>" + Comments.Text + "</td>";
        emailMsgBody = emailMsgBody + "</tr>";
        emailMsgBody = emailMsgBody + "</table>";
        emailMsgBody = emailMsgBody + "";
        emailMsgBody = emailMsgBody + "</body></html>";

        EmailService.EmailServiceClient es = new EmailService.EmailServiceClient();
        es.SendMail(ManagerEmail.Value, RequestorName.Text, RequestorEmail.Text, emailMsgBody, "KOL Speaker Request", "MarketingRequestForms");

        Response.Redirect ("submit-success.aspx");
    }
}