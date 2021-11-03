Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7344431C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 15:10:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220909.382355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miGxd-0000NF-8g; Wed, 03 Nov 2021 14:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220909.382355; Wed, 03 Nov 2021 14:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miGxd-0000LG-4f; Wed, 03 Nov 2021 14:09:53 +0000
Received: by outflank-mailman (input) for mailman id 220909;
 Wed, 03 Nov 2021 14:09:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PtR=PW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1miGxb-0000LA-Pi
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 14:09:52 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe09::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2fcd418-3caf-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 15:09:49 +0100 (CET)
Received: from DB8PR06CA0008.eurprd06.prod.outlook.com (2603:10a6:10:100::21)
 by AM4PR0802MB2177.eurprd08.prod.outlook.com (2603:10a6:200:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 14:09:43 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::e2) by DB8PR06CA0008.outlook.office365.com
 (2603:10a6:10:100::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 14:09:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 14:09:42 +0000
Received: ("Tessian outbound 7b0bcc4a550a:v108");
 Wed, 03 Nov 2021 14:09:42 +0000
Received: from 17d468b5d284.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 080A894E-F9E8-406D-9309-5E9E4FD544C1.1; 
 Wed, 03 Nov 2021 14:09:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 17d468b5d284.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Nov 2021 14:09:34 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6972.eurprd08.prod.outlook.com (2603:10a6:102:1dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 14:09:32 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 14:09:31 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0209.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 3 Nov 2021 14:09:30 +0000
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
X-Inumbo-ID: b2fcd418-3caf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dYgUg7d63m2iBJ+XArd9kOVG29rPtTAgO0RXVt7Wl4=;
 b=3GBZdVUgmmdqztG4zyDaO3Ces0DnKYvU9E7veAMWJpHmGBRoCD/rKre+3PRbIOdg7x2flAzY530lkWtZd3RAMYFJ2LHjbQZJkBFRzeGCmOgEk6QHhvACWRpj6HDZuaGMai//Pet8Ydp01Js+AtncDmsN+QVNBRxl/xSCaKigtoE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4377d06c8c371cc3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dARUct/sL1Haa89C4wRCwcrFwVNlHstZYxfbTzi+TTDVM6DDLVHDFxHCCU26Dae7uLxy4FgRq7dmCmhXaTlgHZ46Mx1pmhYmHCiX/uwSXx+RzTZ7syaNA4TNcyADKYHStDVzy52j4deUfdsZgDmIY7g5OqVwWE3HxYsf8ODUlSJHJzuQ/HqsEqgprWqyduBs1armI14Nm2CPQSUJzaxz0jJJgObzZ0N5hevHpBJKPbI7wawJ9MWCjFDfOAoaU2lDgMsKv11Pn/wqvOM+nOPUVp9Ma3LBy4bGfgEx2A8X11IgrtTbsafPVwdrt502wVnaJtihZTWxPriHnHEqXWJg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dYgUg7d63m2iBJ+XArd9kOVG29rPtTAgO0RXVt7Wl4=;
 b=W6URkwjVLyDvlB0sldnMr0UJOUj7f+37JzSVafy/OBiTIhyWwMdt/794F+6gKwgiOUXZNagsRvB2IehyPc3Lf2gZ3r+3QSgwg05+sE7ASlLvFQR79U+1wS1Bg4Z03nbuyHnO0MSj4fmDr8bYqrpX1RCxaw63aHFJDHyMPDd0/bIqykor6CIp00uuZkMtjIxByeapriKR6zXFkLNnz8KN2tMK1+kUmmr7kCVbZ6foxMX28kZXc9ZuBZv73BProMXDZK/5UzDUULbAQhkrPOLo1xKXuFDkC650f0F24s4zkHU7guSROgz9v5K35Q/lqsEun34qgyz3DzYHbqatTD7USw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dYgUg7d63m2iBJ+XArd9kOVG29rPtTAgO0RXVt7Wl4=;
 b=3GBZdVUgmmdqztG4zyDaO3Ces0DnKYvU9E7veAMWJpHmGBRoCD/rKre+3PRbIOdg7x2flAzY530lkWtZd3RAMYFJ2LHjbQZJkBFRzeGCmOgEk6QHhvACWRpj6HDZuaGMai//Pet8Ydp01Js+AtncDmsN+QVNBRxl/xSCaKigtoE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <16c6757d-1bb3-361f-a41f-26b9bc89a2b4@suse.com>
Date: Wed, 3 Nov 2021 14:09:23 +0000
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <83E4F969-892C-4AA2-829D-67C02B4B5885@arm.com>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
 <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
 <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
 <845D8368-B9DA-4A5C-8F8D-6AAE55E326A0@arm.com>
 <16c6757d-1bb3-361f-a41f-26b9bc89a2b4@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::29) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb4d2673-d3f2-420c-d2ef-08d99ed3951b
X-MS-TrafficTypeDiagnostic: PAXPR08MB6972:|AM4PR0802MB2177:
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB2177BDD90E84C7FCE939C5C2E48C9@AM4PR0802MB2177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DnypR2FybNyLzvB0pWtDJtbIwwpNBo2uCum5z+rcafGdHgIrGZdXaZzgxuvdUBfPDAVbGMNqp2ELcsrQBXcJXUNXgTlPpGjsIkZsVYhOIHjWeO/ZeaYmBQy7IIGnGDqsO4zsnwcIjicg5Iigf8lDUR2gLETqU/BUCqppylJhRN9nxTH7lhIhZ9kuoZ0e+OgPtELPfK5OfjnsnOs9lIps+kKCpojf3zXIUHbdT3HQpNt1dC+wGvAk0CkiPA+2/qstmraOPDoOhboU/M8TAZinYYI6xcIajrGse3hAmnR8kjd7590rgAVGzXnpbhzyTGGrBcaEoOxOSGANRDytikGulFLllhfBOCKdbwCbqDXixWjdAHhiWJzwVcg0yex0AtxMEjVgaRma08eH9FgL8/UepGEgW/KiXM0ZCGbI+QrC12YmXUWxscC5b0GOqCRYZVEIQrsQ/G1nZJ7ppl3cAjdstwJM4u3fh+WMIRM+aTP0kIYTx9VFy4F+bf2nwS/dkf0sdhRGwPlH3lo1wC9APS1Ssf0YEqBXqMx4JyBd8nH23wR7qD7gGyHWVNvyQe9CBNAFIJZVgoZeyVwu1tnSgOei5s5OPV6rcyXqBmAMmT3m0Ym9wfS95/chMg0/FKZSimNrwxZGoL7FoD2xMQd0v59H3m3QhXWYE+zF7GL0fufHyGHvVPZ1GgR/wymguNsB0qUsdiK0PBrE7vU27OoiUaH25SPEulUsZ9d1uktUqg/TNOM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(4326008)(26005)(316002)(6486002)(33656002)(8676002)(8936002)(52116002)(83380400001)(54906003)(53546011)(6506007)(956004)(66556008)(2616005)(36756003)(6916009)(2906002)(6666004)(186003)(5660300002)(508600001)(66476007)(66946007)(38350700002)(38100700002)(86362001)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6972
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fcc88f47-9437-49c1-9cb7-08d99ed38e0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wphJLANvf3gk9NYbRUDXmFUWF6ymej9tZQlyw8dvtf7WtTDz/IwhOJN4moWdtjQKeo9bgTybw3qweZlc9QNB3tVkf8CQ8OZcCotzGj08PlckY143nWCoA3a5VneYUnQjw0I+e0eaudkHyomXBZgFqaErcyy/b+8/IHyjpB9YaNMZC7hW4/LZwbbe8xrdxMoqCX8wAit6ZoTYSjlyFQxHU/0V6/jBBPMqPE7LiBF7t7MMNsE3cXw++lUTjXnEiVTL9pwd0kpPQWsaCQrTq95fJpqKR1Ga3H+Vd8KPLiktjQPnOghXa26pQClp31JaXTWr7YDTP4m0zmEto5lttrFgrzLTWA1Wl4smbWD67j9zh2Bt5ptSVL5hqlEi7LQdsH3TVLv7qDD9fNd0+bO4n+/+tVDO3zE+ij2uZk9+57bud2wucQS64yBivMk4vOjLpGgsyxU7EBcnT3k9eApRy2IZCwS9OiM+d0yxgWZO7qlLVXiO37DQgiXpp1qyXHSNhaqmPZKewrhVib0xvBVj9xLyQSCq0w+iqPMJ0svu2j7LtEkPy830SfH5i9FkioIMPe2e+RCIlWutSGTanvgfjEfHwN6/Fy99zl22E+EnYBvecfMihZt5SYuycF2ez5m2+rRjZyeRtRQIrob1nG1B/2EcHM1xoDX8u7Lvg1bxrGLtuCfvdaQw7v69TN6e/xkUhm+F3H3M6wWK33V7j/0AyzBNyQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(956004)(2616005)(8936002)(186003)(36756003)(33656002)(26005)(36860700001)(316002)(6512007)(54906003)(336012)(6862004)(47076005)(508600001)(6666004)(70206006)(4326008)(6486002)(6506007)(83380400001)(81166007)(70586007)(86362001)(82310400003)(2906002)(5660300002)(53546011)(44832011)(8676002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:09:42.6482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4d2673-d3f2-420c-d2ef-08d99ed3951b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2177



> On 3 Nov 2021, at 11:28, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.11.2021 11:20, Luca Fancellu wrote:
>>=20
>>=20
>>> On 3 Nov 2021, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 02.11.2021 18:12, Luca Fancellu wrote:
>>>>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>>>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b8=
82
>>>>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>>>>> introducing a problem to boot Xen using Grub2 on ARM machine using E=
DK2.
>>>>>>=20
>>>>>> The problem comes from the function get_parent_handle(...) that insi=
de
>>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>>>>>> is NULL, making Xen stop the UEFI boot.
>>>>>=20
>>>>> According to my reading the UEFI spec doesn't (explicitly) allow for
>>>>> this to be NULL. Could you clarify why this is the case? What other
>>>>> information may end up being invalid / absent? Is e.g. read_section()
>>>>> safe to use?
>>>>=20
>>>> My test on an arm machine running Grub2 on top of EDK2 showed that
>>>> when Xen is started, the get_parent_handle(=E2=80=A6) call was failing=
 and stopping
>>>> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called with=
 the
>>>> loaded_image->DeviceHandle argument NULL and the call was returning
>>>> a EFI_INVALID_PARAMETER.
>>>> So the parent handle can=E2=80=99t be requested and the filesystem can=
=E2=80=99t be used,
>>>> but any other code that doesn=E2=80=99t use the handle provided by get=
_parent_handle(=E2=80=A6)
>>>> can be used without problem like read_section(...).
>>>=20
>>> I understand this. My question was for the reason of ->DeviceHandle
>>> being NULL. IOW I'm wondering whether we're actually talking about a
>>> firmware or GrUB bug, in which case your change is a workaround for
>>> that rather than (primarily) a fix for the earlier Xen change.
>>=20
>> The issue was found only when using EDK2+Grub2, no issue when booting
>> directly from EDK2.
>> This is a fix for the regression, because without the EFI changes, Grub2=
 was
>> booting successfully Xen. Using grub2 to boot Xen on arm is a very commo=
n
>> solution so not supporting this anymore could lead to lots of people hav=
ing
>> issues if they update to Xen 4.16.
>=20
> I'm not objecting to addressing the issue. But the description needs
> to make clear where the origin of the problem lies, and afaict that's
> not the earlier Xen change. That one merely uncovered what, according
> to your reply, might then be a GrUB bug. Unless, as said earlier, I
> merely haven't been able to spot provisions in the spec for the field
> in question to be NULL.

Maybe I can rephrase to be more specific from:

The problem comes from the function get_parent_handle(...) that inside
uses the HandleProtocol on loaded_image->DeviceHandle, but the last
is NULL, making Xen stop the UEFI boot.

To:

Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle,
that is used by efi_bs->HandleProtocol(=E2=80=A6) inside get_parent_handle(=
=E2=80=A6),
causing Xen to stop the boot getting an EFI_INVALID_PARAMETER error.

Do you think it can be ok like this?

Cheers,
Luca

>=20
> Jan


