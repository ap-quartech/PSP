﻿using OpenQA.Selenium;
using PIMS.Tests.Automation.Classes;

namespace PIMS.Tests.Automation.PageObjects
{
    public class AcquisitionStakeholders : PageObjectBase
    {
        private By stakeholderLinkTab = By.XPath("//a[contains(text(),'Stakeholders')]");

        private By stakeholderInterestsSubtitle = By.XPath("//h2/div/div[contains(text(),'Interests')]");
        private By stakeholderInterestsEditBttn = By.CssSelector("button[title = 'Edit Interests']");
        private By stakeholderInterestInitP1 = By.XPath("//p[contains(text(),'There are no interest holders associated with this file.')]");
        private By stakeholderInterestInitP2 = By.XPath("//p[contains(text(),'To add an interest holder, click the edit button.')]");

        private By stakeholderNonInterestsSubtitle = By.XPath("//h2/div/div[contains(text(),'Non-interest Payees')]");
        private By stakeholderNonInterestsEditBttn = By.CssSelector("button[title = 'Edit Non-interest payees']");
        private By stakeholderNonInterestInitP1 = By.XPath("//p[contains(text(),'There are no non-interest payees associated with this file.')]");
        private By stakeholderNonInterestInitP2 = By.XPath("//p[contains(text(),'To add a non-interest payee, click the edit button.')]");

        private By stakeholderInterestsEditP1 = By.XPath("//p[contains(text(),'Interests will need to be in the')]");
        private By stakeholderInterestsEditP2 = By.XPath("//i[contains(text(),'No Interest holders to display')]");
        private By stakeholderInterestAddInterestHolderLink = By.XPath("//button/div[contains(text(),'Interest holder')]");

        private By stakeholderNonInterestsEditP1 = By.XPath("//p[contains(text(),'These are additional payees for the file who are not interest holders. (ex: construction for fences). Payees will need to be in the')]");
        private By stakeholderNonInterestsEditP2 = By.XPath("//i[contains(text(),'No Non-interest payees to display')]");
        private By stakeholderInterestAddNonInterestHolderLink = By.XPath("//button/div[contains(text(),'Add a Non-interest payee')]");

        private By stakeholderInterestTable = By.XPath("//div[contains(text(),'Interests')]/parent::div/parent::h2/following-sibling::div/div[@data-testid='interest-holders-by-property-table']");
        private By stakeholderInterestTotalCount = By.XPath("//div[contains(text(),'Interests')]/parent::div/parent::h2/following-sibling::div/div[@data-testid='interest-holders-by-property-table']/div[@class='tbody']/div[@class='tr-wrapper']");

        private By stakeholderNonInterestTable = By.XPath("//div[contains(text(),'Non-interest Payees')]/parent::div/parent::h2/following-sibling::div/div[@data-testid='interest-holders-by-property-table']");
        private By stakeholderNonInterestTotalCount = By.XPath("//div[contains(text(),'Non-interest Payees')]/parent::div/parent::h2/following-sibling::div/div[@data-testid='interest-holders-by-property-table']/div[@class='tbody']/div[@class='tr-wrapper']");

        //Acquisition File Confirmation Modal Elements
        private By acquisitionFileConfirmationModal = By.CssSelector("div[class='modal-content']");

        private SharedSelectContact sharedSelectContact;
        private SharedModals sharedModals;

        public AcquisitionStakeholders(IWebDriver webDriver) : base(webDriver)
        {
            sharedSelectContact = new SharedSelectContact(webDriver);
            sharedModals = new SharedModals(webDriver);
        }

        public void NavigateStakeholderTab()
        {
            WaitUntilClickable(stakeholderLinkTab);
            webDriver.FindElement(stakeholderLinkTab).Click();
        }

        public void EditStakeholderInterestsButton()
        {
            WaitUntilClickable(stakeholderInterestsEditBttn);
            webDriver.FindElement(stakeholderInterestsEditBttn).Click();
        }

        public void EditStakeholderNonInterestsButton()
        {
            WaitUntilClickable(stakeholderNonInterestsEditBttn);
            webDriver.FindElement(stakeholderNonInterestsEditBttn).Click();
        }

        public void AddInterestStakeholderButton()
        {
            WaitUntilClickable(stakeholderInterestAddInterestHolderLink);
            webDriver.FindElement(stakeholderInterestAddInterestHolderLink).Click();
        }

        public void AddNonInterestStakeholderButton()
        {
            WaitUntilClickable(stakeholderInterestAddNonInterestHolderLink);
            webDriver.FindElement(stakeholderInterestAddNonInterestHolderLink).Click();
        }

        public void AcquisitionFileSaveStakeholder()
        {
            Wait();
            ButtonElement("Save");

            AssertTrueIsDisplayed(stakeholderInterestsEditBttn);
        }

        public void CancelAcquisitionFileStakeholder()
        {
            Wait();
            ButtonElement("Cancel");

            if (webDriver.FindElements(acquisitionFileConfirmationModal).Count() > 0)
            {
                Assert.True(sharedModals.ModalHeader().Equals("Confirm changes"));
                Assert.True(sharedModals.ConfirmationModalText1().Equals("If you cancel now, this form will not be saved."));
                Assert.True(sharedModals.ConfirmationModalText2().Equals("Are you sure you want to Cancel?"));
                sharedModals.ModalClickOKBttn();
            }

            AssertTrueIsDisplayed(stakeholderNonInterestsEditBttn);
        }

        public void CreateInterestsStakeholder(AcquisitionStakeholder interest, int index)
        {
            AssertTrueIsDisplayed(By.XPath("//input[@id='input-interestHolders."+ index +".contact.id']/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/preceding-sibling::div/label[contains(text(),'Interest holder')]"));
            AssertTrueIsDisplayed(By.Id("input[id='input-interestHolders."+ index +".contact.id']"));
            webDriver.FindElement(By.XPath("//input[@id='input-interestHolders."+ index +".contact.id']/parent::div/parent::div/following-sibling::div/button[@title='Select Contact']")).Click();
            sharedSelectContact.SelectContact(interest.InterestHolder);

            AssertTrueIsDisplayed(By.XPath("//select[@id='input-interestHolders."+ index +".propertyInterestTypeCode']/parent::div/parent::div/preceding-sibling::div/label[contains(text(),'Interest type')]"));
            ChooseSpecificSelectOption(By.Id("input-interestHolders."+ index +".propertyInterestTypeCode"), interest.InterestType);

            AssertTrueIsDisplayed(By.XPath("//select[@id='input-interestHolders."+ index +".propertyInterestTypeCode']/parent::div/parent::div/parent::div/following-sibling::div/div/label[contains(text(),'Impacted properties')]"));
            webDriver.FindElement(By.XPath("//select[@id='input-interestHolders."+ index +".propertyInterestTypeCode']/parent::div/parent::div/parent::div/following-sibling::div/div/div/div[@class='tbody']/div[@class='tr-wrapper'][1]/div/div/div/input")).Click();
            
        }

        public void CreateNonInterestsStakeholder(AcquisitionStakeholder noninterest, int index)
        {
            AssertTrueIsDisplayed(By.XPath("//input[@id='input-nonInterestPayees."+ index +".contact.id']/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/preceding-sibling::div/label[contains(text(),'Payee name')]"));
            AssertTrueIsDisplayed(By.Id("input[id='input-nonInterestPayees."+ index +".contact.id']"));
            webDriver.FindElement(By.XPath("//input[@id='input-nonInterestPayees."+ index +".contact.id']/parent::div/parent::div/following-sibling::div/button[@title='Select Contact']")).Click();
            sharedSelectContact.SelectContact(noninterest.PayeeName);

            AssertTrueIsDisplayed(By.XPath("//input[@id='input-nonInterestPayees."+ index +".contact.id']/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/following-sibling::div//div/label[contains(text(),'Impacted properties')]"));
            webDriver.FindElement(By.XPath("//input[@id='input-nonInterestPayees."+ index +".contact.id']/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/following-sibling::div//div/div/div[@class='tbody']/div[@class='tr-wrapper'][1]/div/div/div/input")).Click();
        }

        public void DeleteLastInterestHolder()
        {
            Wait();
            var lastInterestHoldersIndex = webDriver.FindElements(stakeholderInterestTotalCount).Count -1;
            FocusAndClick(By.XPath("//input[@id='input-interestHolders."+ lastInterestHoldersIndex +".contact.id']/parent::div/parent::div/parent::div/parent::div/parent::div/following-sibling::div/button[@title='Remove Interest']"));
        }

        public void DeleteLastNonInterestHolder()
        {
            Wait();
            var lastNonInterestHoldersIndex = webDriver.FindElements(stakeholderNonInterestTotalCount).Count -1;
            FocusAndClick(By.XPath("//input[@id='input-nonInterestPayees."+ lastNonInterestHoldersIndex +".contact.id']/parent::div/parent::div/parent::div/parent::div/parent::div/following-sibling::div/button[@title='Remove Interest']"));
        }

        public void VerifyStakeholdersInitView()
        {
            AssertTrueIsDisplayed(stakeholderInterestsSubtitle);
            AssertTrueIsDisplayed(stakeholderInterestsEditBttn);
            AssertTrueIsDisplayed(stakeholderInterestInitP1);
            AssertTrueIsDisplayed(stakeholderInterestInitP2);

            AssertTrueIsDisplayed(stakeholderNonInterestsSubtitle);
            AssertTrueIsDisplayed(stakeholderNonInterestsEditBttn);
            AssertTrueIsDisplayed(stakeholderNonInterestInitP1);
            AssertTrueIsDisplayed(stakeholderNonInterestInitP2);
        }

        public void VerifyStakeholderInitEditForm()
        {
            AssertTrueIsDisplayed(stakeholderInterestsSubtitle);
            AssertTrueIsDisplayed(stakeholderInterestsEditP1);
            AssertTrueIsDisplayed(stakeholderInterestsEditP2);
            AssertTrueIsDisplayed(stakeholderInterestAddInterestHolderLink);

            AssertTrueIsDisplayed(stakeholderNonInterestsSubtitle);
            AssertTrueIsDisplayed(stakeholderNonInterestsEditP1);
            AssertTrueIsDisplayed(stakeholderNonInterestsEditP2);
            AssertTrueIsDisplayed(stakeholderInterestAddNonInterestHolderLink);
        }

        public void VerifyInterestStakeholderViewForm(AcquisitionStakeholder interest)
        {
            AssertTrueIsDisplayed(stakeholderInterestsSubtitle);
            AssertTrueIsDisplayed(stakeholderInterestsEditBttn);
            AssertTrueIsDisplayed(stakeholderInterestTable);

            var lastStakeholder = webDriver.FindElements(stakeholderInterestTotalCount).Count();
            AssertTrueContentEquals(By.XPath("//div[contains(text(),'Interests')]/parent::div/parent::h2/following-sibling::div/div[@data-testid='interest-holders-by-property-table']/div[@class='tbody']/div[@class='tr-wrapper']["+ lastStakeholder +"]/div/div[1]/a"), interest.InterestHolder);
            AssertTrueContentEquals(By.XPath("//div[contains(text(),'Interests')]/parent::div/parent::h2/following-sibling::div/div[@data-testid='interest-holders-by-property-table']/div[@class='tbody']/div[@class='tr-wrapper']["+ lastStakeholder +"]/div/div[2]"), interest.PrimaryContact);
            AssertTrueContentEquals(By.XPath("//div[contains(text(),'Interests')]/parent::div/parent::h2/following-sibling::div/div[@data-testid='interest-holders-by-property-table']/div[@class='tbody']/div[@class='tr-wrapper']["+ lastStakeholder +"]/div/div[3]"), interest.InterestType);
        }

        public void VerifyNonInterestStakeholderViewForm(AcquisitionStakeholder interest)
        {
            AssertTrueIsDisplayed(stakeholderNonInterestsSubtitle);
            AssertTrueIsDisplayed(stakeholderNonInterestsEditBttn);
            AssertTrueIsDisplayed(stakeholderNonInterestTable);

            var lastStakeholder = webDriver.FindElements(stakeholderNonInterestTotalCount).Count();
            AssertTrueContentEquals(By.XPath("//div[contains(text(),'Non-interest Payee')]/parent::div/parent::h2/following-sibling::div/div[@data-testid='interest-holders-by-property-table']/div[@class='tbody']/div[@class='tr-wrapper']["+ lastStakeholder +"]/div/div[1]/a"), interest.PayeeName);
            AssertTrueContentEquals(By.XPath("//div[contains(text(),'Non-interest Payee')]/parent::div/parent::h2/following-sibling::div/div[@data-testid='interest-holders-by-property-table']/div[@class='tbody']/div[@class='tr-wrapper']["+ lastStakeholder +"]/div/div[2]"), interest.StakeholderType);
        }

        public int TotalInterestHolders()
        {
            Wait();
            return webDriver.FindElements(stakeholderInterestTotalCount).Count();
        }

        public int TotalNonInterestHolders()
        {
            Wait();
            return webDriver.FindElements(stakeholderNonInterestTotalCount).Count();
        }
    }
}