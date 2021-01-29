Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB330897F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 15:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78182.142113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ucj-0000mt-DP; Fri, 29 Jan 2021 14:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78182.142113; Fri, 29 Jan 2021 14:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ucj-0000mU-AD; Fri, 29 Jan 2021 14:19:45 +0000
Received: by outflank-mailman (input) for mailman id 78182;
 Fri, 29 Jan 2021 14:19:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqUO=HA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l5Uch-0000mP-Gj
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:19:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60fd6a76-e82f-479a-8872-5140aae2550f;
 Fri, 29 Jan 2021 14:19:41 +0000 (UTC)
Received: from AM6P191CA0075.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::16)
 by AM0PR08MB3235.eurprd08.prod.outlook.com (2603:10a6:208:57::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 29 Jan
 2021 14:19:39 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::37) by AM6P191CA0075.outlook.office365.com
 (2603:10a6:209:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Fri, 29 Jan 2021 14:19:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Fri, 29 Jan 2021 14:19:38 +0000
Received: ("Tessian outbound f362b81824dc:v71");
 Fri, 29 Jan 2021 14:19:37 +0000
Received: from 1b2e893b3627.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 628A6830-7CF9-4FA9-A064-7C96E039A7A6.1; 
 Fri, 29 Jan 2021 14:19:32 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b2e893b3627.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Jan 2021 14:19:32 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4160.eurprd08.prod.outlook.com (2603:10a6:803:ea::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 14:19:29 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3805.017; Fri, 29 Jan 2021
 14:19:29 +0000
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
X-Inumbo-ID: 60fd6a76-e82f-479a-8872-5140aae2550f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0/O7CXBWfgMaKY78SQLsp5ColsjSNly8FHLlKoZyF8=;
 b=8f6sBkMd+LiLduhPaZLcRSF6/XeJc8BHB9IrGauanxwotXC3LbY/H2vHyHsjvIuQvYRizWgCU0ziGl7iwMGccdGbEO9zvTiFf3yJ0LiGMTuCEMTu8Z+OB+6ejoGYvGAt1QcmHhXOVpFkImSayLpiSH51fEymw/W3QFpSM/JVK30=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1dbf5eb4250e18f2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4tN+5nK6WCGZIWzWTUlvwgliOWzLG6xxrqdX78PdaU0QPJZ4dF/8WMoaql4BSzVFqHD+8E04JxJeh4M6t4/xKJTY/iPC9jNNrZLxEZM5AQTY4XpjKSES/ZX0GwZFcAonSOcoorc3epSuIksHM0NCuoq13kiXNl1uodAHw2pQgcPuxdgIb6xal95E+ERQ38AOyUF4CGYGnvQk2MBj4KcA/LSqwKW9vIIsL2bT8Puzl0dbtvOYgekTn5VlmJ5rZJYix+8Q0TbRa4eW28naPRCSMEEztdrlyCJpTxaUwcNbXfxqpmFFCA0x7/gRbgiM/C8WZaCJMqt+xWURXJh8s+jRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0/O7CXBWfgMaKY78SQLsp5ColsjSNly8FHLlKoZyF8=;
 b=E+FdrwKM5OkOAN7/W821k25JcAsLyeeiSW7VbxCRiWj5FpeTkvacOCngkkNePTk399l9Ray+uXUiJWiBVgJFRXPhC6d8/rIw5pptQwxPExixPzdK7VRY1eDEZp8CMTwvgNFhfDhV5A/6L/Ocm1LpbLuqFPj5gkiG6DhEm0dJSTxNfnKw2vxBA+unHqOYXEjQMqqVbuFBWi+5+OcnU3uBdXk5lmZ1nqo9S4nGzNKhgIAB89Q53zWc1n/jJnUdmVdDBj8i2VXrLNBNKZFO6ujAKdaF/xEI6ZjNojhNpq6o7LhMS9gUSp9cJkARYPp7VKFf3VVydIn3CKy1Ea+f0iBw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0/O7CXBWfgMaKY78SQLsp5ColsjSNly8FHLlKoZyF8=;
 b=8f6sBkMd+LiLduhPaZLcRSF6/XeJc8BHB9IrGauanxwotXC3LbY/H2vHyHsjvIuQvYRizWgCU0ziGl7iwMGccdGbEO9zvTiFf3yJ0LiGMTuCEMTu8Z+OB+6ejoGYvGAt1QcmHhXOVpFkImSayLpiSH51fEymw/W3QFpSM/JVK30=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH] xen/arm: smmuv3: Disable the SMMUv3 driver when ACPI is
 enabled.
Thread-Topic: [PATCH] xen/arm: smmuv3: Disable the SMMUv3 driver when ACPI is
 enabled.
Thread-Index: AQHW9iw1gBNQivQN7kOKh7vm+7p7cqo+pygA
Date: Fri, 29 Jan 2021 14:19:29 +0000
Message-ID: <57F5188D-2151-4790-9DEA-FC88C487692B@arm.com>
References:
 <1a228e438f405c376d6fc36e4625c6c09f9d78f3.1611916545.git.rahul.singh@arm.com>
In-Reply-To:
 <1a228e438f405c376d6fc36e4625c6c09f9d78f3.1611916545.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 124a6657-f583-4bd5-9878-08d8c460e962
x-ms-traffictypediagnostic: VI1PR08MB4160:|AM0PR08MB3235:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB32351AB517D1DA7E5E8D50AF9DB99@AM0PR08MB3235.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A0o1M/7ZKijkCVGOk1OPH0iNnH0w5iwRb7NPQRa4F8H5hRXIIzPfUOaiSYYYuZK3xWPBaN3mMq44wh4fCcGbg/APWCXpN1WGiEZP2Yq5eeGRsII/++QRx18ftw1L9T0td2HO3oXqxObQSMv00ncqL7JEASagh0+HXw/NYofexAQBDPOFZ9tiA5WKGQMN0e9n2Zg3bD0KIgOAl8OuVNm5hXHhiad3E2hZxdl/iyMD2Gd9XdGEVROh2ecKNwzy+vDNGBWwA+rNJL7Va8AP94QAxvY7/rW1XziyakbNsePolWV1Cmfch6O4WbVV5sUMdvJdRKfteggtIXOPTLQl2b+626EUrtfNgooRluibXd3PAJjnqef8L5Dp3AYK67zujKS3eZmLgu0d7DMxWMZbLqH68DhgVb9KPFiSRhgkKmSAJWMJZYVbbI7hPs/7kXbQ6TP8ZgEkdZTCzxoFhJ9XqQ6hEOqWSa2bydkn6roHYLYo8Q8dvLlU9F7ejunn8q8v92ZGOng33pT/aNSc83mQLig2zvq0fjs8OgmkK/FwUXI2GM7xoMfxOiqWeq8v6c3A0vGrdoHbcrwxS0pqIiOc3AtYiw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(64756008)(66476007)(66946007)(55236004)(2616005)(8676002)(66556008)(53546011)(4744005)(5660300002)(37006003)(54906003)(26005)(36756003)(66446008)(83380400001)(186003)(6506007)(76116006)(91956017)(6862004)(2906002)(4326008)(478600001)(86362001)(6636002)(71200400001)(6512007)(33656002)(316002)(6486002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?qU66BwiAjMkRJRM1imEPlmSh/U+vgZeOtCbeoMPlvUcERqzbU6OeGaabJJkd?=
 =?us-ascii?Q?8FTHwOTcNtTFp9KZWJ5bwnGMMNBi6t6DtP8HzAEkFfcPk+j6zkwJTgi6+nhf?=
 =?us-ascii?Q?krwf6b5sP8EyaniQuUyBRWSzyER4OhHDLUNUzQnowhsb19w6B+4gyRCZDNCF?=
 =?us-ascii?Q?n8OldPkDgaM2ODEBFCrXdruB/G/1uzB8zHqnCrEKeZilOXvbXaOA+nlSkvPS?=
 =?us-ascii?Q?GzoAXlJ2/+8+UKq9lBMQVna/Gfu3jNNsoTTAWzxGZeiUW19PnqjGyUcwf5Iy?=
 =?us-ascii?Q?MRqmZaGZSy1mwk5M6kc8T/O2mBGVkk9C03vOMh7Upv2VAfos7C+4a9akv2Ws?=
 =?us-ascii?Q?JmLoqGMwreDkYH1J+8pFAwpDOynk7UqJX1R9e0vaLO75K/JE+Mf9XYo6WMzJ?=
 =?us-ascii?Q?wRtRKiXLV85ONWjvUvuk6fFiyGdbO/C8iDZsxF0+Cpo8wu7CxK3f8V4I8D0v?=
 =?us-ascii?Q?qldidbejjqnK3eJzrBphBIWmHBBC1vyD1vyyEPl9rS5xp2PYHL0W6ZHCTd+7?=
 =?us-ascii?Q?20nQR223mnDn0EhimkMtSdT3uuocp62pKakY5XYdzSz8K15X+OU8E9QGNOl2?=
 =?us-ascii?Q?Ya3A6g+2Uzld/xNPS86pcnm5dfKTnHWbEpYVH3mPnUThtGW0Cc0zulCfxgGD?=
 =?us-ascii?Q?NfBMM1POckAvRrbHoatVyoAeFzVoHDLNLRTxHpq1/vD4sx5HKPD4Y9B8UnLj?=
 =?us-ascii?Q?2TxESoMaBH9qZkU//TrfXveDuiMH1IstrlrngSowWejaRHWwgMVwngC5Eywi?=
 =?us-ascii?Q?Qzb6VdWSYuZazeRiG77Atrzvdn2U9QgcN23h6cHCB70SuP1C4FjFTATF/qFn?=
 =?us-ascii?Q?0xqBb2UFXKUy2ju4/aoE11vLSlq+JXFANBT4YIheCKxDiVGe+w0eojDhXoyB?=
 =?us-ascii?Q?apox826fWkEoabzTUptig1VwaYGi4J4N4nzSYDZalBA07Ts/XY12OtEIc1es?=
 =?us-ascii?Q?aBR/OPkdgSAMDKHhllBsl2XBUliaxd2l3F4UpbijNeA7SaVorVGSaIySTnxn?=
 =?us-ascii?Q?BLQ6upUFKIeI4yRxW9CTr3hEa7uFECGNATD+S/0jzjqbpaQiW22G4lE9ye02?=
 =?us-ascii?Q?MrtOHQHT?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0E52AE0D7644064F85FE40096622A159@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4160
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b42440d-7b0b-4727-8854-08d8c460e3dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XH7+J64G/O32T7H9g1hkrn9+GbKzdEwnC/N7lbRe3+rmROThgFsmnmq0vNRT+wFe31artj+iKgGQJpuvWwxOtEmr/JH5T4BlfDVZhTKX9RniJ9NcUEwS54JSzpY1D95b4WunAkxypeAJ4hMD9JT+FBP9S1gWX/Ig2YJA1q3RPyIPnR29jhpc1piu+HaU+90CrYHkjhCwdWxBmM5iotZpDUgyd1/zwcjbwGkN4Ykhq+tvdpD7YWjl2ae3QagYW7R9cGww/9o/PYhvnh1OcaqiSWmtTNcb8FTfB2r0vAUEeGHXNk7cnYgp3tDmX6yYJG0gyDg9v8AaiDOg21FE/2W1XQ17Az9mXaGKNCzZSAPOKSpT6W/fyObmljk/wfK28z4zshwJote2bGry/TbsqcOO+VEYG8pWQYQAkxhq++SfgKO8BHwonbhVy4cW2M1VAE8Tko4z957gIQGT03XMRQe3v/x1bWwRAEnCn8j/LWZM3n+wxj2OcqMz34P9/qM596CrvxPIVkEa2OpJB/oXvV5K1ZP9/9KlW+9GR18gZwpMe5ueKcpj28vGHPrG2xUM+1QaVXkNdmddRj6mSD4vhJv5RRh1iJgYi4pFwcz6y3G4NLg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(26005)(83380400001)(2616005)(55236004)(6636002)(53546011)(54906003)(33656002)(70206006)(4326008)(316002)(478600001)(8936002)(6506007)(47076005)(6862004)(6486002)(81166007)(86362001)(70586007)(8676002)(356005)(82310400003)(186003)(6512007)(336012)(82740400003)(37006003)(2906002)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 14:19:38.3053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 124a6657-f583-4bd5-9878-08d8c460e962
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3235

Hi Rahul,

> On 29 Jan 2021, at 10:47, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> SMMUv3 driver does not support ACPI device probe.If APCI is enabled with
> SMMUv3 driver compiler will throw an error.
>=20
> Disable SMMUv3 driver when ACPI is enabled in kconfig to fix compilation
> error.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> xen/drivers/passthrough/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kc=
onfig
> index 341ba92b30..82f02f56af 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -15,7 +15,7 @@ config ARM_SMMU
>=20
> config ARM_SMMU_V3
> 	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
> -	depends on ARM_64
> +	depends on ARM_64 && (!ACPI || BROKEN)
> 	---help---
> 	 Support for implementations of the ARM System MMU architecture
> 	 version 3. Driver is in experimental stage and should not be used in
> --=20
> 2.17.1
>=20


