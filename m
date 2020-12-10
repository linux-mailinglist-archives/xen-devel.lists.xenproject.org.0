Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AEC2D60A6
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49504.87563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOKx-00072O-Il; Thu, 10 Dec 2020 15:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49504.87563; Thu, 10 Dec 2020 15:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOKx-00071z-F0; Thu, 10 Dec 2020 15:58:35 +0000
Received: by outflank-mailman (input) for mailman id 49504;
 Thu, 10 Dec 2020 15:58:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knOKw-00071t-3R
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:58:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68fa7154-7ef3-4675-bd8c-5a46dd930cbf;
 Thu, 10 Dec 2020 15:58:32 +0000 (UTC)
Received: from AM6PR10CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::15)
 by DB8PR08MB5066.eurprd08.prod.outlook.com (2603:10a6:10:e4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 15:58:30 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::8f) by AM6PR10CA0038.outlook.office365.com
 (2603:10a6:209:80::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:58:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:58:30 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Thu, 10 Dec 2020 15:58:30 +0000
Received: from 90b4cc8b37dc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 80F71FCD-B98B-462A-97A2-362275146CE2.1; 
 Thu, 10 Dec 2020 15:58:11 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90b4cc8b37dc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:58:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5605.eurprd08.prod.outlook.com (2603:10a6:10:1af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 15:58:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:58:10 +0000
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
X-Inumbo-ID: 68fa7154-7ef3-4675-bd8c-5a46dd930cbf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZSoR77VXtoS0GA3wN0FZdKwE6WOAHp9p3wsp+rJbTU=;
 b=zHbHdtZXyxO6vSBc4JOBg0tdkSLlEN28+ns1M7TWEibhymKx0OrpmNFRec7w/m0HoYM7aTsiuVm6JihJRfPRWiGd6+WUgJRD/dxt8DxXSopNXp1aN9SWvUxRhBvd7lUL6v4Vw1MXTRrNqyI8HgETuTz/Vb4ELEF0wick1tucsdc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87ee920a35308948
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D61Y1Gh3fuU5WBPQpJGEFph/dw1YeXvepCoeamyLCnHc0vxPgqDPtPlN4S66RU0myvLu5vAe2p2+VLUQKSzHEPGSrZlZnWwniHS5KCncIe3R6CLVRM+FV/dHoiaO1t0j40nBuJF7j3RCUI70KCmGMyGw3hmtwRse5YsvFr2aFzAFM9XSXyMI2oEVZL/CEyhE9ijALXJ6ATDXCfjIUscULqCbtaw2k+qvR3sXOXx9Z16jpQn4xryzPEqM38CO7pt8DbLSPWK+9g8wA+KubG3nd/WttpYgepn7d6wZ8M+x3j2Fv9NP5QQr1xw53k6lteL9GtO31Qwxs9VoC2mOPubusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZSoR77VXtoS0GA3wN0FZdKwE6WOAHp9p3wsp+rJbTU=;
 b=jqWBe9hvolprHgwOLbZfck2sfsRQruMLDtuIqMr4FAxUCdkoDka5Gb7x2puH5jTcVYoFfsFaF40SigFl29Z7ygOlLdfDTtAzd3NBzAwBoVeSQWWjHVCuMw7F3QBl8j+tsmafm7IeNimUf7uw8U2oUtZd4VcF5I6JOacXg6AyYIStxVt5cxiIlHT+xULsxlNaRTdnGI76FAkp//zWcRB0biCoqldBTWJpg5WN1p3Xs1yZ/hDC+qQFdOjM0w8xUBAXtmf2YQZ+j1ROtEFIomN3cJX+SfjfB8n/R0ZpQPo/qgmIALcfjboVFgPC8u/6em0NFFF+bja8hQKyFtLKFaQxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZSoR77VXtoS0GA3wN0FZdKwE6WOAHp9p3wsp+rJbTU=;
 b=zHbHdtZXyxO6vSBc4JOBg0tdkSLlEN28+ns1M7TWEibhymKx0OrpmNFRec7w/m0HoYM7aTsiuVm6JihJRfPRWiGd6+WUgJRD/dxt8DxXSopNXp1aN9SWvUxRhBvd7lUL6v4Vw1MXTRrNqyI8HgETuTz/Vb4ELEF0wick1tucsdc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/7] xen/arm: Add ID registers and complete cpuinfo
Thread-Topic: [PATCH v3 1/7] xen/arm: Add ID registers and complete cpuinfo
Thread-Index: AQHWzklS6YSKOBiOok+g4tPLnYP0b6nvYnQAgAEPYQCAAAiagIAAA4CA
Date: Thu, 10 Dec 2020 15:58:10 +0000
Message-ID: <BB95B1AB-C487-490C-9BF5-F7C6F4EC8268@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <aab713989bec4dc843bd513c03b305c83028851b.1607524536.git.bertrand.marquis@arm.com>
 <62484fa0-fa86-523a-12e0-54d69934d791@xen.org>
 <8D31DCB1-3529-4785-A18B-CFE69CC0E846@arm.com>
 <157559b2-7d95-ff46-204c-f875e617d464@xen.org>
In-Reply-To: <157559b2-7d95-ff46-204c-f875e617d464@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b3a99e3-2ddb-4015-1c80-08d89d24706b
x-ms-traffictypediagnostic: DBAPR08MB5605:|DB8PR08MB5066:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB506600A2336900ADBC6C57209DCB0@DB8PR08MB5066.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EfDsvbDho6urWBMt4CtT8z3gs3q9x3pgldj8QrFHWhFOrVqom5S6C5do9/eRHha6JC0By7AwKiXNJfI4dQLTek3zCd3FVkgaamu42J3tkg2/kszwOlNi92SP/yfaTAb8EPIk6d+fhWKfpQkaWTXY7jNJ4YnU14zEkQ6cGxDoKwfzjHCZBtRhERoLJ7xFgg/WHzqYNknLF/pSo52NzkZSM3wRpI4yMMWJOJe57wODRwqJVOqhCgbTvxvYeVgSbzP8F9pxxAM2cWa/0aEKeUceLTxoG/CULjqskhb3PAadCP5SRsfhWI83zP+drv/DRS9CmYL8NYmXR65Ip/AaIPCwOg1KcRlXC/3ZpCtmPAZA/dgipZltp61flCZSK+uJsHsk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(54906003)(8676002)(6916009)(66446008)(5660300002)(4326008)(6506007)(66556008)(66946007)(2616005)(64756008)(91956017)(53546011)(71200400001)(30864003)(86362001)(66476007)(26005)(6512007)(478600001)(186003)(33656002)(76116006)(316002)(8936002)(36756003)(83380400001)(2906002)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?hVmASkzLyv1Mf98bq4hne2eQRLH1KlQlea8UJ5VSVVI/HQcISI6ZAEyLUAOD?=
 =?us-ascii?Q?IbbkFYJhEocU01R0g11wYxPnOY6Nojae5UAtTJLORVn7CryDsfFLeYHy3qFc?=
 =?us-ascii?Q?pNEFDL9uvN7J0H97fdO6ZqJiCodiQDhDQiyz6F1q0VV42dBLN3fTve9mUJip?=
 =?us-ascii?Q?vsBzxfjZ1HDmrN6ipywSYaGOohzIa6YJc/8oleUF/3TN8LfS/2PPXHpQRTTo?=
 =?us-ascii?Q?5NY5tt3CJQWFJmB8KupoDS3+yVb8vIAHfUNfMWTzhHXdtTyxb/vAoL83qCuR?=
 =?us-ascii?Q?sfI5+8mkFuMmSQPlGNce0c6J+Oq5rg7KXF7q7YNhQV7b1y4/csiohO3r8pms?=
 =?us-ascii?Q?9XllPMk+pDIal8HV4cFhl4CKq12ocwLdm86tffl3DCret09RlpMr7WSW+49j?=
 =?us-ascii?Q?SquadNHtlYSlA0XDKNahgdmtH6HHHZbe9MnH9r/XFvdpMYVoBTfZtqBeDtly?=
 =?us-ascii?Q?c6NBmC4J8SfFy9qcn8yO5W7e16gnHet3W8tH/T965jf53L21KXHTJyKJOKMw?=
 =?us-ascii?Q?2Vvv3LYUQUmT0i1fx1uaKAOBbCutzUANjUTJn5BZEoZeqWFYKwOrnZE6UYsq?=
 =?us-ascii?Q?TAdUsRSzEiYXjffckNBbtysJqnBp4vd9s8CAmtY6622g/JRHcfKA+vHC3EjY?=
 =?us-ascii?Q?JzdVRNB+h48S9nIAGNvWyijAqVfF4k6xVqO7UoP1EjtW9I2MjCHi/oAGHtWG?=
 =?us-ascii?Q?f55041RYZPC5MtoSMqNER3sx48T2lp1AEhIx6HlavdAauXNsA++BCIBHpWSX?=
 =?us-ascii?Q?ckXyZW4meedDGUia2apkRHF2xWNedG9EzYF22+Pb4rnJYgN2K4RYzIluem4z?=
 =?us-ascii?Q?MziOoHQxjB3UiWjMNhu9kgEG49v3SCCsuuiCRA9mMVGocZARHuFUxMwH5Kea?=
 =?us-ascii?Q?d/Gv2dEHERBChQKiuqANAC5R+0albmg2YNS4nGaDfHZwF0mcoLMGrd+p9IGo?=
 =?us-ascii?Q?O0/hQVj5p4dVXasu9Txhgvqpv/pSJUay3oLWafBRY41gjMJgab0tf/5Pmygx?=
 =?us-ascii?Q?cHxa?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51073259578F954F842582A536E9BD3C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5605
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab593a56-9d1e-466b-bd74-08d89d246489
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ISjJnsedvT5eKi4P1zx8if3O8I449P5AGprSYlg4S9lYrSbydSNpjdBrxtBkKP/8dcYRcZYPHkZ7U3gaI0IbyI7haR17yGhINM01Gg+TD4nj4YrLyjnndPaChGNBrPHbfexpZMrd+B+j+g43hnbRrakj4Nloi+HgqTdTeshLbxkqooKwPdNvvgNeZsPuSrgirK8jlV0jWKemQM45UUyTHuYGZ2NPpyPcml5hNJLHx2E5y3SEtbth4AddRCYcn/txIavtCmyYPwyrdkvwEPosiM3wnFV77BFLW9I/LIsZQISSypdqbFJdzqCRuK5ozjPKgDDQZbTOQIQ/zcqCcburk63tjnfTX3P5LVH97eRiA6x8jq5ndQvdG42wp/LOVtiIVTCuIIvpR1U7fxBljNTCuw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(46966005)(82310400003)(54906003)(26005)(4326008)(2616005)(316002)(186003)(478600001)(36756003)(336012)(2906002)(8936002)(53546011)(36906005)(6486002)(8676002)(6512007)(6862004)(86362001)(107886003)(83380400001)(33656002)(70206006)(6506007)(70586007)(47076004)(82740400003)(356005)(81166007)(30864003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:58:30.2646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3a99e3-2ddb-4015-1c80-08d89d24706b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5066

Hi,

> On 10 Dec 2020, at 15:45, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 10/12/2020 15:14, Bertrand Marquis wrote:
>> Hi Julien,
>>> On 9 Dec 2020, at 23:03, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 09/12/2020 16:30, Bertrand Marquis wrote:
>>>> Add definition and entries in cpuinfo for ID registers introduced in
>>>> newer Arm Architecture reference manual:
>>>> - ID_PFR2: processor feature register 2
>>>> - ID_DFR1: debug feature register 1
>>>> - ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
>>>> - ID_ISA6: ISA Feature register 6
>>>> Add more bitfield definitions in PFR fields of cpuinfo.
>>>> Add MVFR2 register definition for aarch32.
>>>> Add mvfr values in cpuinfo.
>>>> Add some registers definition for arm64 in sysregs as some are not
>>>> always know by compilers.
>>>> Initialize the new values added in cpuinfo in identify_cpu during init=
.
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>> Changes in V2:
>>>>   Fix dbg32 table size and add proper initialisation of the second ent=
ry
>>>>   of the table by reading ID_DFR1 register.
>>>> Changes in V3:
>>>>   Fix typo in commit title
>>>>   Add MVFR2 definition and handling on aarch32 and remove specific cas=
e
>>>>   for mvfr field in cpuinfo (now the same on arm64 and arm32).
>>>>   Add MMFR4 definition if not known by the compiler.
>>>> ---
>>>>  xen/arch/arm/cpufeature.c           | 18 ++++++++++
>>>>  xen/include/asm-arm/arm64/sysregs.h | 28 +++++++++++++++
>>>>  xen/include/asm-arm/cpregs.h        | 12 +++++++
>>>>  xen/include/asm-arm/cpufeature.h    | 56 ++++++++++++++++++++++++----=
-
>>>>  4 files changed, 105 insertions(+), 9 deletions(-)
>>>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>>>> index 44126dbf07..bc7ee5ac95 100644
>>>> --- a/xen/arch/arm/cpufeature.c
>>>> +++ b/xen/arch/arm/cpufeature.c
>>>> @@ -114,15 +114,20 @@ void identify_cpu(struct cpuinfo_arm *c)
>>>>            c->mm64.bits[0]  =3D READ_SYSREG64(ID_AA64MMFR0_EL1);
>>>>          c->mm64.bits[1]  =3D READ_SYSREG64(ID_AA64MMFR1_EL1);
>>>> +        c->mm64.bits[2]  =3D READ_SYSREG64(ID_AA64MMFR2_EL1);
>>>>            c->isa64.bits[0] =3D READ_SYSREG64(ID_AA64ISAR0_EL1);
>>>>          c->isa64.bits[1] =3D READ_SYSREG64(ID_AA64ISAR1_EL1);
>>>> +
>>>> +        c->zfr64.bits[0] =3D READ_SYSREG64(ID_AA64ZFR0_EL1);
>>>>  #endif
>>>>            c->pfr32.bits[0] =3D READ_SYSREG32(ID_PFR0_EL1);
>>>>          c->pfr32.bits[1] =3D READ_SYSREG32(ID_PFR1_EL1);
>>>> +        c->pfr32.bits[2] =3D READ_SYSREG32(ID_PFR2_EL1);
>>>>            c->dbg32.bits[0] =3D READ_SYSREG32(ID_DFR0_EL1);
>>>> +        c->dbg32.bits[1] =3D READ_SYSREG32(ID_DFR1_EL1);
>>>>            c->aux32.bits[0] =3D READ_SYSREG32(ID_AFR0_EL1);
>>>>  @@ -130,6 +135,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>>>>          c->mm32.bits[1]  =3D READ_SYSREG32(ID_MMFR1_EL1);
>>>>          c->mm32.bits[2]  =3D READ_SYSREG32(ID_MMFR2_EL1);
>>>>          c->mm32.bits[3]  =3D READ_SYSREG32(ID_MMFR3_EL1);
>>>> +        c->mm32.bits[4]  =3D READ_SYSREG32(ID_MMFR4_EL1);
>>>> +        c->mm32.bits[5]  =3D READ_SYSREG32(ID_MMFR5_EL1);
>>>=20
>>> Please don't introduce any more use of READ_SYSREG32(), they are wrong =
on Armv8 because system registers are always 64-bit.
>> I followed the existing implementation but ...
>>>=20
>>>>            c->isa32.bits[0] =3D READ_SYSREG32(ID_ISAR0_EL1);
>>>>          c->isa32.bits[1] =3D READ_SYSREG32(ID_ISAR1_EL1);
>>>> @@ -137,6 +144,17 @@ void identify_cpu(struct cpuinfo_arm *c)
>>>>          c->isa32.bits[3] =3D READ_SYSREG32(ID_ISAR3_EL1);
>>>>          c->isa32.bits[4] =3D READ_SYSREG32(ID_ISAR4_EL1);
>>>>          c->isa32.bits[5] =3D READ_SYSREG32(ID_ISAR5_EL1);
>>>> +        c->isa32.bits[6] =3D READ_SYSREG32(ID_ISAR6_EL1);
>>>> +
>>>> +#ifdef CONFIG_ARM_64
>>>> +        c->mvfr.bits[0] =3D READ_SYSREG64(MVFR0_EL1);
>>>> +        c->mvfr.bits[1] =3D READ_SYSREG64(MVFR1_EL1);
>>>> +        c->mvfr.bits[2] =3D READ_SYSREG64(MVFR2_EL1);
>>>> +#else
>>>> +        c->mvfr.bits[0] =3D READ_CP32(MVFR0);
>>>> +        c->mvfr.bits[1] =3D READ_CP32(MVFR1);
>>>> +        c->mvfr.bits[2] =3D READ_CP32(MVFR2);
>>>> +#endif
>>>=20
>>> READ_SYSREG() will do the job to either use READ_SYSREG64() or READ_CP3=
2() depending on the arch used.
>> .. I can modify the ones I added and the existing ones to user READ_SYSR=
EG instead.
>> Please confirm if you want me to do that.
>=20
> Yes, please use READ_SYSREG() for the new ones. We can convert the others=
 separately.
>=20
>>>=20
>>>>  }
>>>>    /*
>>>> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm=
/arm64/sysregs.h
>>>> index c60029d38f..077fd95fb7 100644
>>>> --- a/xen/include/asm-arm/arm64/sysregs.h
>>>> +++ b/xen/include/asm-arm/arm64/sysregs.h
>>>> @@ -57,6 +57,34 @@
>>>>  #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>>>>  #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>>>>  +/*
>>>> + * Define ID coprocessor registers if they are not
>>>> + * already defined by the compiler.
>>>> + *
>>>> + * Values picked from linux kernel
>>>> + */
>>>> +#ifndef ID_AA64MMFR2_EL1
>>>=20
>>> I am a bit puzzled how this meant to work. Will the libc/compiler heade=
rs define ID_AA64MMFR2_EL1?
>> I tested this and if the compiler has a definition for the register, I a=
m not entering the ifndef.
>> So there is no header defining this but if the compiler has the definiti=
on for this the ifndef will
>> not be entered.
>=20
> Good to hear :).
>=20
>>>=20
>>>> +#define ID_AA64MMFR2_EL1            S3_0_C0_C7_2
>>>> +#endif
>>>> +#ifndef ID_PFR2_EL1
>>>> +#define ID_PFR2_EL1                 S3_0_C0_C3_4
>>>> +#endif
>>>> +#ifndef ID_MMFR4_EL1
>>>> +#define ID_MMFR4_EL1                S3_0_C0_C2_6
>>>> +#endif
>>>> +#ifndef ID_MMFR5_EL1
>>>> +#define ID_MMFR5_EL1                S3_0_C0_C3_6
>>>> +#endif
>>>> +#ifndef ID_ISAR6_EL1
>>>> +#define ID_ISAR6_EL1                S3_0_C0_C2_7
>>>> +#endif
>>>> +#ifndef ID_AA64ZFR0_EL1
>>>> +#define ID_AA64ZFR0_EL1             S3_0_C0_C4_4
>>>> +#endif
>>>> +#ifndef ID_DFR1_EL1
>>>> +#define ID_DFR1_EL1                 S3_0_C0_C3_5
>>>> +#endif
>>>> +
>>>>  /* Access to system registers */
>>>>    #define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
>>>> diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs=
.h
>>>> index 8fd344146e..2690ddeb7a 100644
>>>> --- a/xen/include/asm-arm/cpregs.h
>>>> +++ b/xen/include/asm-arm/cpregs.h
>>>> @@ -63,6 +63,8 @@
>>>>  #define FPSID           p10,7,c0,c0,0   /* Floating-Point System ID R=
egister */
>>>>  #define FPSCR           p10,7,c1,c0,0   /* Floating-Point Status and =
Control Register */
>>>>  #define MVFR0           p10,7,c7,c0,0   /* Media and VFP Feature Regi=
ster 0 */
>>>> +#define MVFR1           p10,7,c6,c0,0   /* Media and VFP Feature Regi=
ster 1 */
>>>> +#define MVFR2           p10,7,c5,c0,0   /* Media and VFP Feature Regi=
ster 2 */
>>>>  #define FPEXC           p10,7,c8,c0,0   /* Floating-Point Exception C=
ontrol Register */
>>>>  #define FPINST          p10,7,c9,c0,0   /* Floating-Point Instruction=
 Register */
>>>>  #define FPINST2         p10,7,c10,c0,0  /* Floating-point Instruction=
 Register 2 */
>>>> @@ -108,18 +110,23 @@
>>>>  #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Re=
gister */
>>>>  #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register=
 0 */
>>>>  #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register=
 1 */
>>>> +#define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register=
 2 */
>>>>  #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 *=
/
>>>> +#define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 *=
/
>>>>  #define ID_AFR0         p15,0,c0,c1,3   /* Auxiliary Feature Register=
 0 */
>>>>  #define ID_MMFR0        p15,0,c0,c1,4   /* Memory Model Feature Regis=
ter 0 */
>>>>  #define ID_MMFR1        p15,0,c0,c1,5   /* Memory Model Feature Regis=
ter 1 */
>>>>  #define ID_MMFR2        p15,0,c0,c1,6   /* Memory Model Feature Regis=
ter 2 */
>>>>  #define ID_MMFR3        p15,0,c0,c1,7   /* Memory Model Feature Regis=
ter 3 */
>>>> +#define ID_MMFR4        p15,0,c0,c2,6   /* Memory Model Feature Regis=
ter 4 */
>>>> +#define ID_MMFR5        p15,0,c0,c3,6   /* Memory Model Feature Regis=
ter 5 */
>>>>  #define ID_ISAR0        p15,0,c0,c2,0   /* ISA Feature Register 0 */
>>>>  #define ID_ISAR1        p15,0,c0,c2,1   /* ISA Feature Register 1 */
>>>>  #define ID_ISAR2        p15,0,c0,c2,2   /* ISA Feature Register 2 */
>>>>  #define ID_ISAR3        p15,0,c0,c2,3   /* ISA Feature Register 3 */
>>>>  #define ID_ISAR4        p15,0,c0,c2,4   /* ISA Feature Register 4 */
>>>>  #define ID_ISAR5        p15,0,c0,c2,5   /* ISA Feature Register 5 */
>>>> +#define ID_ISAR6        p15,0,c0,c2,7   /* ISA Feature Register 6 */
>>>>  #define CCSIDR          p15,1,c0,c0,0   /* Cache Size ID Registers */
>>>>  #define CLIDR           p15,1,c0,c0,1   /* Cache Level ID Register */
>>>>  #define CSSELR          p15,2,c0,c0,0   /* Cache Size Selection Regis=
ter */
>>>> @@ -312,18 +319,23 @@
>>>>  #define HSTR_EL2                HSTR
>>>>  #define ID_AFR0_EL1             ID_AFR0
>>>>  #define ID_DFR0_EL1             ID_DFR0
>>>> +#define ID_DFR1_EL1             ID_DFR1
>>>>  #define ID_ISAR0_EL1            ID_ISAR0
>>>>  #define ID_ISAR1_EL1            ID_ISAR1
>>>>  #define ID_ISAR2_EL1            ID_ISAR2
>>>>  #define ID_ISAR3_EL1            ID_ISAR3
>>>>  #define ID_ISAR4_EL1            ID_ISAR4
>>>>  #define ID_ISAR5_EL1            ID_ISAR5
>>>> +#define ID_ISAR6_EL1            ID_ISAR6
>>>>  #define ID_MMFR0_EL1            ID_MMFR0
>>>>  #define ID_MMFR1_EL1            ID_MMFR1
>>>>  #define ID_MMFR2_EL1            ID_MMFR2
>>>>  #define ID_MMFR3_EL1            ID_MMFR3
>>>> +#define ID_MMFR4_EL1            ID_MMFR4
>>>> +#define ID_MMFR5_EL1            ID_MMFR5
>>>>  #define ID_PFR0_EL1             ID_PFR0
>>>>  #define ID_PFR1_EL1             ID_PFR1
>>>> +#define ID_PFR2_EL1             ID_PFR2
>>>>  #define IFSR32_EL2              IFSR
>>>>  #define MDCR_EL2                HDCR
>>>>  #define MIDR_EL1                MIDR
>>>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cp=
ufeature.h
>>>> index c7b5052992..6cf83d775b 100644
>>>> --- a/xen/include/asm-arm/cpufeature.h
>>>> +++ b/xen/include/asm-arm/cpufeature.h
>>>> @@ -148,6 +148,7 @@ struct cpuinfo_arm {
>>>>      union {
>>>>          uint64_t bits[2];
>>>>          struct {
>>>> +            /* PFR0 */
>>>>              unsigned long el0:4;
>>>>              unsigned long el1:4;
>>>>              unsigned long el2:4;
>>>> @@ -155,9 +156,23 @@ struct cpuinfo_arm {
>>>>              unsigned long fp:4;   /* Floating Point */
>>>>              unsigned long simd:4; /* Advanced SIMD */
>>>>              unsigned long gic:4;  /* GIC support */
>>>> -            unsigned long __res0:28;
>>>> +            unsigned long ras:4;
>>>> +            unsigned long sve:4;
>>>> +            unsigned long sel2:4;
>>>> +            unsigned long mpam:4;
>>>> +            unsigned long amu:4;
>>>> +            unsigned long dit:4;
>>>> +            unsigned long __res0:4;
>>>>              unsigned long csv2:4;
>>>> -            unsigned long __res1:4;
>>>> +            unsigned long cvs3:4;
>>>> +
>>>> +            /* PFR1 */
>>>> +            unsigned long bt:4;
>>>> +            unsigned long ssbs:4;
>>>> +            unsigned long mte:4;
>>>> +            unsigned long ras_frac:4;
>>>> +            unsigned long mpam_frac:4;
>>>> +            unsigned long __res1:44;
>>>>          };
>>>>      } pfr64;
>>>>  @@ -170,7 +185,7 @@ struct cpuinfo_arm {
>>>>      } aux64;
>>>>        union {
>>>> -        uint64_t bits[2];
>>>> +        uint64_t bits[3];
>>>>          struct {
>>>>              unsigned long pa_range:4;
>>>>              unsigned long asid_bits:4;
>>>> @@ -190,6 +205,8 @@ struct cpuinfo_arm {
>>>>              unsigned long pan:4;
>>>>              unsigned long __res1:8;
>>>>              unsigned long __res2:32;
>>>> +
>>>> +            unsigned long __res3:64;
>>>>          };
>>>>      } mm64;
>>>>  @@ -197,6 +214,10 @@ struct cpuinfo_arm {
>>>>          uint64_t bits[2];
>>>>      } isa64;
>>>>  +    struct {
>>>> +        uint64_t bits[1];
>>>> +    } zfr64;
>>>> +
>>>>  #endif
>>>>        /*
>>>> @@ -204,25 +225,38 @@ struct cpuinfo_arm {
>>>>       * when running in 32-bit mode.
>>>>       */
>>>>      union {
>>>> -        uint32_t bits[2];
>>>> +        uint32_t bits[3];
>>>>          struct {
>>>> +            /* PFR0 */
>>>>              unsigned long arm:4;
>>>>              unsigned long thumb:4;
>>>>              unsigned long jazelle:4;
>>>>              unsigned long thumbee:4;
>>>> -            unsigned long __res0:16;
>>>> +            unsigned long csv2:4;
>>>> +            unsigned long amu:4;
>>>> +            unsigned long dit:4;
>>>> +            unsigned long ras:4;
>>>>  +            /* PFR1 */
>>>>              unsigned long progmodel:4;
>>>>              unsigned long security:4;
>>>>              unsigned long mprofile:4;
>>>>              unsigned long virt:4;
>>>>              unsigned long gentimer:4;
>>>> -            unsigned long __res1:12;
>>>> +            unsigned long sec_frac:4;
>>>> +            unsigned long virt_frac:4;
>>>> +            unsigned long gic:4;
>>>> +
>>>> +            /* PFR2 */
>>>> +            unsigned long csv3:4;
>>>> +            unsigned long ssbs:4;
>>>> +            unsigned long ras_frac:4;
>>>> +            unsigned long __res2:20;
>>>>          };
>>>>      } pfr32;
>>>>        struct {
>>>> -        uint32_t bits[1];
>>>> +        uint32_t bits[2];
>>>>      } dbg32;
>>>>        struct {
>>>> @@ -230,12 +264,16 @@ struct cpuinfo_arm {
>>>>      } aux32;
>>>>        struct {
>>>> -        uint32_t bits[4];
>>>> +        uint32_t bits[6];
>>>>      } mm32;
>>>>        struct {
>>>> -        uint32_t bits[6];
>>>> +        uint32_t bits[7];
>>>>      } isa32;
>>>> +
>>>> +    struct {
>>>> +        uint64_t bits[3];
>>>=20
>>> Shouldn't this be register_t?
>> I followed the scheme of the rest of the structure which
>> is always using uint64_t or uint32_t for bits definitions.
>=20
> Right, but I am sure you will not be surprised if I tell you this is bugg=
y ;). The historical reason is, IIRC, the original spec of Armv8.0 describe=
d them as 32-bit registers.
>=20
> The spec was updated a while ago to clarify they are 64-bit when running =
in AArch64. But a majority of them still have the top 32-bit RES0 (thankful=
ly!).
>=20
>> Why should I use register_t type for this one ?
>=20
> Because the value is 32-bit on AArch32 and 64-bit for AArch64. I am ok to=
 use 64-bit still for AArch32, but it sounds a bit of a waste of memory.
>=20
> What I care the most here is we use 64-bit for the new registers on AArch=
64. Otherwise, we are going to soon discover that a bit above 32 was alloca=
ted and not detected by Xen. I don't want to be the one doing the debugging=
!
>=20
> Admittly, this is not a new issue. However, the more offending code we ha=
d the more it will be difficul to get Xen to be fully compliant with the Ar=
mv8 spec.

I agree with that so I propose to do the following:
- create a new serie to fix those:=20
	- use READ_SYSREG in cpufeature.c
	- use register_t in cpuinfo structure
- rebase my serie on top of this one and use the proper types on it

Might require more work but seem to be the right approach.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


