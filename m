Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4AD443FE7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 11:21:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220723.382098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDNt-0001UF-LK; Wed, 03 Nov 2021 10:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220723.382098; Wed, 03 Nov 2021 10:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDNt-0001Rt-I8; Wed, 03 Nov 2021 10:20:45 +0000
Received: by outflank-mailman (input) for mailman id 220723;
 Wed, 03 Nov 2021 10:20:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PtR=PW=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1miDNs-0001Rn-1v
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 10:20:44 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e137040-fc5d-475c-ae0b-8f73733c3318;
 Wed, 03 Nov 2021 10:20:40 +0000 (UTC)
Received: from DB6PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::34)
 by DBAPR08MB5813.eurprd08.prod.outlook.com (2603:10a6:10:1a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 10:20:38 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::44) by DB6PR1001CA0024.outlook.office365.com
 (2603:10a6:4:b7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 10:20:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 10:20:38 +0000
Received: ("Tessian outbound 6ebd41198c5d:v108");
 Wed, 03 Nov 2021 10:20:37 +0000
Received: from f72ae3186121.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD7A81AD-1833-439E-8496-6E0BF4B39C5C.1; 
 Wed, 03 Nov 2021 10:20:31 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f72ae3186121.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Nov 2021 10:20:31 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5707.eurprd08.prod.outlook.com (2603:10a6:102:8b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 10:20:29 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 10:20:29 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 10:20:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2e137040-fc5d-475c-ae0b-8f73733c3318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f+lu24A+UmK9KwVW1SL75nyyZvsp/IfEaGsotu9bO4=;
 b=pKRusCZhKeRwGJWoGdoAqtfaAX25w81v4qgPZ7KGOiZheFMBHN7YSkZgAbO4tj/obEyEH1mo240T9KhHcb5cb3xnuzKPxMe3+ANfK/PEzuyBH26FXpUIRzFgeEAYzZ6IQrSFKHyVJgqu/p02aiUHNb40oyjPE5AMSinfC5JJTQQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93a3bd89d4bddbcf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUw7szDfIoOZtA+EhHKTs7kuBFjcE1PwA0lLJFPDdl2vBHfvC/6vVEfbQcuwkVnuRiKLlIR+pnlhL68jQGV68RseUEpJb3Ibaj3kInWKfDSj+8qrvBD7Zpsg5++8UKa2Tw3CwG1vNM1+awi/HFTRDB9Xw/5qtLYgaNLugERXSDsrjKfO+mbP4YnmKveZZGmCCjIs4lukO0P9brfEr9NaWBx2JZBfgxoHBvLt0MV3Gor9u2mGTtZcdrNtpVfMhZSkTLYR83q0wiMwVKWle0ZFB85D4qDJI+FqRa6sOYG+nWsxa/kNoqEV7gDmaT9+X5yIRA9+Xwrw8hMYtBfEAHNxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f+lu24A+UmK9KwVW1SL75nyyZvsp/IfEaGsotu9bO4=;
 b=fGYRZAIhI0wyr2OK9uk/1un0Uu3iZFn7kPlBplmkFmkZCTeTGaS+L6uqRLdzhI/K2yZNQ4qS6SfYvmMRJPTUYvbDbzHtC8Hc9HFqTCs/qf8Yp8jysGwOOqVTorhJSOnrm7IWsofafyWTMzQWblb+eS9qxC2WhY6higzRjEqc5UKBlWj7BmI/xEpSIu6dykmTZZE8OcAj0Sz0/svcexw3OS3F/L+Dyvgmqv9QQI/zTn/OPUeVjpcS1CTUm9jVQrtOCH0Ny296wjbYXfaiAmAFnDJHXuO6ccYz0pl4pIfqX/81vujtMqi1INh1zBD6OU4pbfwMx6c0AA/MQupQPy/Q1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f+lu24A+UmK9KwVW1SL75nyyZvsp/IfEaGsotu9bO4=;
 b=pKRusCZhKeRwGJWoGdoAqtfaAX25w81v4qgPZ7KGOiZheFMBHN7YSkZgAbO4tj/obEyEH1mo240T9KhHcb5cb3xnuzKPxMe3+ANfK/PEzuyBH26FXpUIRzFgeEAYzZ6IQrSFKHyVJgqu/p02aiUHNb40oyjPE5AMSinfC5JJTQQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
Date: Wed, 3 Nov 2021 10:20:22 +0000
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <845D8368-B9DA-4A5C-8F8D-6AAE55E326A0@arm.com>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
 <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
 <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45cc4f3b-ce0b-4f69-3c1f-08d99eb394b3
X-MS-TrafficTypeDiagnostic: PR3PR08MB5707:|DBAPR08MB5813:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5813D719F440FB7E929C11E2E48C9@DBAPR08MB5813.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q4yPEoAJaxQhHDeYkc3mYfaMtUJvgB90pzNmetfD0O1zuBeTzEnLsVG3vlqSKSCXAfKQDOysiU95Na/ylx++W3MdSyDWaSSNv7hsNa97Xqec6hlj+XKp7E8AzdR4fvaVzjovvmTV1LJ6xsIiWabn0l9XBpZJa0drx+W+c1JEUfs9CqMruR998O0b0h3ti0GChnlJ6jkBEkPs/cS7H/skSe8oUfxuppuyBsLDt9f63CyMmWqEdt7B5/bwvb6EAV7oEnbI77QPjAJUXr9gDY/AKmFaPQ5sIDWQ/LyllKLkhbL1VUrPSBw5KoX8ugR2R/1OQmhBT26Gy/GUX6Dq7oZZd+0JHREMwz3MofpW9kSIE8DljsLiDUcSVxh/kOT3E+bLBgDBCzRtlYdPI1bnRqzDslA005nQzwOm28FfThv3DFBzvdzLYXl7zztsY9mXl0duIkqK6tntAzNoRNM8uBm015TEiPBHXIOvRsZcYqeMCx+t1mGVSYWH31hGDPMVi9ahmiNnGuJOnpBl2ZjX0YDjtNRdB8/TWsAJ6BYkogYg42i3ir85+QJrwnkjsKvc8soZufSq8dlySgDHEXOMQfUQB/YfuIXStqB5wReucLEVhQo0U7FsFJVW6M6UmDGiHr6Hb4xMiNFZlJg3xJPCGBPeU7VtS1LB/PJSd3FCY1/9fxnjXcW/sByXSjcK6m0Iq/o/uLTZ9S9TUFyJBSEqmH+jPJ5YWJSH2OO39GKhb8cHKLw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(2906002)(5660300002)(52116002)(38100700002)(316002)(38350700002)(66476007)(83380400001)(66946007)(54906003)(86362001)(4326008)(66556008)(6916009)(508600001)(956004)(186003)(8936002)(6506007)(53546011)(6512007)(26005)(8676002)(6486002)(2616005)(6666004)(36756003)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5707
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c80d1b6b-0944-4097-617e-08d99eb38f8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WFD5yqB7cw/9ctAvHWw3pYxNcZu9kDiRzrutFCN3PVQj4fxG0WPZxatvqsX77Yo45IH+KLiQcnFw7WHlFLWZB45xegpVytst6wznmRGdXPlsHzhGUSBkLOqFKGnw6qWd5TZuqJ5bYwUh5016dsz0qFcyAhbrzj2Q46cgVTYrJSLWUknsGrb8oNoKR8tdZJC7yz87HAM4DVuOMytq8n3n76YwEkcmM+YbcR1M2s7MgPTbkCKq6TXzY4yz/cPq2H4Tsbs/6YtmJwGwyOOSUwzu229XqXYcLkZbBpSdoiizDQCcm6Vdgv5PhhNe9sXcBlTUlut9rgXeTcHKEl4LbeN3jnw4g9DrQHmkkAK0vC3urCzVxU4zUgYIII86SRLUbudnpCpDu88jVqtsewQ2aE2ix78rBrCDEUqvr3h+6aUgKscDJ7A1zt3ZJIyjHPaxH2dUcoASvCY7cxQuObMEfBvdmrqSXbbbUhM508lDGGgrnx2VL3nCs4DQHRKN1wDZXc1t3b6+D9MWHnIeTvgzp1JOdcqo+d3+iG+ITjgqIpkAbtE/0cLMWCGQOe5qPj1bO63rqbnnNc42urD/SCjhtNdIw8CArjB6IR+3BDKO0kVPndxKA2rtMQ1M4Or32knX2f1+CAlM4cJ5KdnNcrj44EIl4zR/T7x0mJw3P3je3BuZspC/dDeqS3Rnh+zLvkOn9SQ+Ux9FLj/WPf3i1kG1t/ca+g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6862004)(6666004)(36756003)(956004)(44832011)(2616005)(26005)(508600001)(186003)(5660300002)(6512007)(47076005)(8676002)(86362001)(36860700001)(54906003)(53546011)(70586007)(6486002)(4326008)(81166007)(83380400001)(2906002)(6506007)(33656002)(316002)(336012)(8936002)(356005)(82310400003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 10:20:38.0674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cc4f3b-ce0b-4f69-3c1f-08d99eb394b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5813



> On 3 Nov 2021, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 02.11.2021 18:12, Luca Fancellu wrote:
>>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
>>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>>> introducing a problem to boot Xen using Grub2 on ARM machine using EDK=
2.
>>>>=20
>>>> The problem comes from the function get_parent_handle(...) that inside
>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>>>> is NULL, making Xen stop the UEFI boot.
>>>=20
>>> According to my reading the UEFI spec doesn't (explicitly) allow for
>>> this to be NULL. Could you clarify why this is the case? What other
>>> information may end up being invalid / absent? Is e.g. read_section()
>>> safe to use?
>>=20
>> My test on an arm machine running Grub2 on top of EDK2 showed that
>> when Xen is started, the get_parent_handle(=E2=80=A6) call was failing a=
nd stopping
>> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called with t=
he
>> loaded_image->DeviceHandle argument NULL and the call was returning
>> a EFI_INVALID_PARAMETER.
>> So the parent handle can=E2=80=99t be requested and the filesystem can=
=E2=80=99t be used,
>> but any other code that doesn=E2=80=99t use the handle provided by get_p=
arent_handle(=E2=80=A6)
>> can be used without problem like read_section(...).
>=20
> I understand this. My question was for the reason of ->DeviceHandle
> being NULL. IOW I'm wondering whether we're actually talking about a
> firmware or GrUB bug, in which case your change is a workaround for
> that rather than (primarily) a fix for the earlier Xen change.

The issue was found only when using EDK2+Grub2, no issue when booting
directly from EDK2.
This is a fix for the regression, because without the EFI changes, Grub2 wa=
s
booting successfully Xen. Using grub2 to boot Xen on arm is a very common
solution so not supporting this anymore could lead to lots of people having
issues if they update to Xen 4.16.

>=20
>>>> --- a/xen/common/efi/boot.c
>>>> +++ b/xen/common/efi/boot.c
>>>> @@ -449,6 +449,13 @@ static EFI_FILE_HANDLE __init get_parent_handle(E=
FI_LOADED_IMAGE *loaded_image,
>>>>    CHAR16 *pathend, *ptr;
>>>>    EFI_STATUS ret;
>>>>=20
>>>> +    /*
>>>> +     * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_P=
ROTOCOL
>>>> +     * to have access to the filesystem.
>>>> +     */
>>>> +    if ( !loaded_image->DeviceHandle )
>>>> +        return NULL;
>>>=20
>>> I couldn't find anything in the spec saying that NULL (a pointer with
>>> the numeric value zero) could actually not be a valid handle. Could
>>> you point me to text saying so?
>>=20
>> I am reading UEFI spec 2.8 A, section 7.3 Protocol Handler Services, whe=
n it talks about
>> EFI_BOOT_SERVICES.HandleProtocol() there is a table of =E2=80=9CStatus C=
ode Returned=E2=80=9D listing
>> the EFI_INVALID_PARAMETER when the Handle is NULL.
>=20
> Oh, okay. I guess I didn't search very well.
>=20
>>>> @@ -1333,6 +1342,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>>>            EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>>>>                                                       &file_name);
>>>>=20
>>>> +            if ( !handle )
>>>> +                blexit(L"Error retrieving image name: no filesystem a=
ccess");
>>>=20
>>> I don't think this should be fatal - see the comment ahead of the
>>> enclosing if().
>>=20
>> I=E2=80=99m not sure I get it, I put the fatal condition in part because=
 the handle was dereferenced by
>> handle->Close(handle), but also because file_name would have not being m=
odified by the call
>> and we have then *argv =3D file_name.
>=20
> Instead of you making boot fail I was trying to suggest that you insert
> a made-up name ("xen" or "xen.efi"?) alongside issuing just a warning
> message.

Oh ok now I see, yes I think I can do it

>=20
> Jan
>=20


