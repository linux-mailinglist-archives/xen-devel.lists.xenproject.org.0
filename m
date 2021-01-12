Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4C2F3059
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 14:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65675.116389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzJTa-0007zL-Fx; Tue, 12 Jan 2021 13:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65675.116389; Tue, 12 Jan 2021 13:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzJTa-0007yw-Bg; Tue, 12 Jan 2021 13:12:46 +0000
Received: by outflank-mailman (input) for mailman id 65675;
 Tue, 12 Jan 2021 13:12:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMwe=GP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzJTY-0007yr-Nr
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 13:12:44 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00ae6764-a35c-4a67-a752-d79824d205ba;
 Tue, 12 Jan 2021 13:12:42 +0000 (UTC)
Received: from MR2P264CA0160.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::23) by
 VI1PR0801MB1888.eurprd08.prod.outlook.com (2603:10a6:800:89::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 13:12:40 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::cf) by MR2P264CA0160.outlook.office365.com
 (2603:10a6:501:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12 via Frontend
 Transport; Tue, 12 Jan 2021 13:12:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 13:12:39 +0000
Received: ("Tessian outbound 4d8113405d55:v71");
 Tue, 12 Jan 2021 13:12:39 +0000
Received: from 0115da92e716.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77745B7B-1646-4B44-A14D-1315BF835702.1; 
 Tue, 12 Jan 2021 13:12:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0115da92e716.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 13:12:33 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0801MB1661.eurprd08.prod.outlook.com (2603:10a6:800:56::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 13:12:32 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 13:12:31 +0000
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
X-Inumbo-ID: 00ae6764-a35c-4a67-a752-d79824d205ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLY4aT2BgS14cLhRBVGJGuPk2m/jHHNLkX62JkX8/Gw=;
 b=HlPv0RK2SnLCik8EozmXdkv0VL0arl9VUecRr3zUYJdA0bAzQ1XtaLf7sidZ6N4FrBFnSo/S2vjnIFSQ+2g40D7/g2NMcYf6L4LxznGqOQ9AhX8eCrOB2QRrTfJbEJEAcGvwZorUJo8RhNh+6jWgJoMgvYY3uQzJ5ev4YHQIqL4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a38243b28af98beb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHdP5eYJk6SOEaBOVllcrFUQ4l6gixvF1EnNKM1Rj1nFFMMEsR4Alx2n/Z2x7BUmDA9N4d+lYthWTHPMREWVY/JcjMVHSzGtJcsrjoEaP+XJ44Meh/S0BFsFkOv+KaZVm8CuFAqjdIWozKqSRguyhtZbUAmDsJ7fRoS+HIAGGqtMe1PCY/3aEgNnT0XB0Rn1ZxIBbPyLOEfazGG73jRy419tH5xpPpZhlNELK0mh4hQnB4kJndyN3EtBXKDFm4xlNZ1TnpfI1HtDWEu59He32h6CCsvEHgdfs1y+gRo3Fsk+LkvaHawAzfoYET+la807L8xUJDgrC72H48yby5g1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLY4aT2BgS14cLhRBVGJGuPk2m/jHHNLkX62JkX8/Gw=;
 b=adpxShX4XOGKlESghkqkdmpY1Xdw87hRGG/y5MrYRO/14j+jSk/EiOJ5QvbH/slq+DpsrpHzkLs2kC8nbOG5tzCdCDMIqHAiUiJWpzGSxPHmTkAhk4xUTuR+9uKbUq/Kw1kQ+tuEUPMe7OVls/O51aUVd6YAOyDPyiLdj8jyFmF0VfeQOzRJr5O9w94hLHsWnDGTsGpgcDp9Q5/byM9/aGh+4pmcXfouJct/Fu+0Y2PwPvlzbCKRvy5ItXDYwnPawJCQxh2ADrjRpdRFPAcWcGUGYtslqU9ru6z4hoVV5Xc/7dNXmlOvCzecg96YGhHab4dinTjnL4UWkJjlYRGuvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLY4aT2BgS14cLhRBVGJGuPk2m/jHHNLkX62JkX8/Gw=;
 b=HlPv0RK2SnLCik8EozmXdkv0VL0arl9VUecRr3zUYJdA0bAzQ1XtaLf7sidZ6N4FrBFnSo/S2vjnIFSQ+2g40D7/g2NMcYf6L4LxznGqOQ9AhX8eCrOB2QRrTfJbEJEAcGvwZorUJo8RhNh+6jWgJoMgvYY3uQzJ5ev4YHQIqL4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Topic: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Index: AQHW6HhLZe62+lKsX0KJMppOaCzey6oj0IcAgAAgdoCAAAc7AA==
Date: Tue, 12 Jan 2021 13:12:31 +0000
Message-ID: <68C8F51E-EF40-470C-B0D6-6D2E688C718B@arm.com>
References: <20210112001623.28421-1-sstabellini@kernel.org>
 <05DC1229-9A51-421F-8BBB-73D719CD0F93@arm.com>
 <acc5c206-ae0c-8671-beae-c890c50f04ca@xen.org>
In-Reply-To: <acc5c206-ae0c-8671-beae-c890c50f04ca@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 39180560-968c-4599-695e-08d8b6fbbd06
x-ms-traffictypediagnostic: VI1PR0801MB1661:|VI1PR0801MB1888:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB188880ECCD56D8296939E0709DAA0@VI1PR0801MB1888.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iHOvwqXGFDwBRbnASNN4SEOte3OmH3tx2Mqyxy/1sS48Jt59zxkpbiLHebcQiMZoxpTrMYUFzWKanLaXPdwdQEVD5mPshV2FUA+qKjikizcgyEOteKSdZZWDDtCCLpEjJ9hvZGjnaXJOsyTBLgvZ39fATQ5Qkn7OZlnXy/dTvsO+tLcuNOpGJjzJh/DaRrzWxdmdNWcEF6RFKJCwgffvKjLMFTdnqBmVdXJKfMAcx244aZqlTi+2p0fpFnz9KO9A0NEsCWMVKlCZdnmy1KeQIYhO9Pa6XQ/19oq/5Kt53fFQUc55tKnrk7lYlNs4PlU4bEKUgImUc2o/mJ6YEY1YMY71thBQaM3eA96WuQAsiZPnWJR08tbBj+BV/Oonu5gAL+x/At4+08vKSkgol9POFmEHmuftKevRiFnVDMgS2rdBH4z2vX/LEphEjrr1IfLkbpVVYbmjLtLeM40AThKZPrlfU1uR5vaXOG6ZtScLzJCL6hJnyCJjGMvM0MNZHoElzCr2gGjcikBufrMEIS6iGZlLAHozjpV4K1wovOniXDQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(71200400001)(478600001)(83380400001)(64756008)(53546011)(76116006)(5660300002)(91956017)(66476007)(66446008)(66556008)(6486002)(26005)(186003)(66946007)(6916009)(4326008)(36756003)(86362001)(2616005)(54906003)(8936002)(966005)(6512007)(6506007)(8676002)(316002)(55236004)(2906002)(33656002)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?yDmtWRTlJ2DxBU9vcFMDAI8QxuvCVsnTtWD89/FW1Tdmu97TWYjAsQ+gdf2w?=
 =?us-ascii?Q?oFIY5NJ9VtTgnPGcOwE3iOJiyX+CtuPtH7D+VqxMBMcIB8RCksqj5AESfQ0r?=
 =?us-ascii?Q?CJJ84mOLMtydyc7APPNBKWo+UECsrcjcRywwwUVKWDgnXonX7R1xeTJcDF4G?=
 =?us-ascii?Q?/zIzX90hZMYZaCimhrVGFLMVQMawLuS3lJVoKrjU+B3IRa3ZH4X7QpnWj60h?=
 =?us-ascii?Q?Po4K/rFecdvOmljvftpzycui8JmfVa3dxTubIyN6gvW9y7LBLxXPOq1ncOn0?=
 =?us-ascii?Q?pCyLNbcuFH9gXnKbf/BwJqqQ9kbaxI6NYXDCicLC2SphWl83LTS1y352hAGx?=
 =?us-ascii?Q?W4jPKn9hVSh7WWMztwhv+Qgh7H0fLEflG3rs7CVnK5kE48XqT37Wj1dZ+JmV?=
 =?us-ascii?Q?1yhW41qzQAfkj73khtRz+B5n8ipV6+UWXc2SqfbhCrGLxMWVNCvvKrq0aaTU?=
 =?us-ascii?Q?iNj6THFyhFwI2rTcRLJ2br40fbIEeP/MGEZIqgyFMUR4Lhoqtm85l7KzSgbO?=
 =?us-ascii?Q?SzRgDjfCHR/+fxLt32AaW520nR1+gqCykr00c5GWKSnutf5rMteBYfhSaInw?=
 =?us-ascii?Q?Dl9T7ugD1MnbgvIk2UTTqPXWY2u8+3JqiyiftIyfJWjZpf/SY6EM81/MLX0b?=
 =?us-ascii?Q?MX30O5vBQeAClkhiv1P8/litlQ0tEXhv5og6lJhTwHhECld6cC1EmuWdfD+c?=
 =?us-ascii?Q?U4ZcrFURBxRAeLs9KC4lJRb/23vyhejORQ1gmu0/0HNxEcLmiyXpZGUU5VaM?=
 =?us-ascii?Q?oWtQvOvoSBizSsbv2coFjL5Doi3MfdNfVlG4DPhMDvpVTE5ItqRY0jyWC/w+?=
 =?us-ascii?Q?7TJHZMp4xHZawU080+3sZaJmvmmS8exp9yBqjXXvHd41v6y24Lnxr7PjHt1S?=
 =?us-ascii?Q?x9mWs+axC6icanAutQxp1N3lHWyeRh1vHigqb0KMh8jcNVTefadzBG7v1eUG?=
 =?us-ascii?Q?Ob7i768Cye/cnejmkd4mzhuroRi+0EI7KCePk7PboC8fCFI+9ROpYexZlP25?=
 =?us-ascii?Q?h4YC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27B6DC1E9857E143A9878039B4B548F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1661
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8861fbe2-827f-40a8-0f26-08d8b6fbb86b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IccYr2Ybrdp4IoXteBtCiGVM2CFFd7eFQqc86xqXL0jxKclyW7YGTQIgNoL+v+6+Q92UI25j0XfgkGC3e0RddV8zOTSrLQ9ub9OvWtmBML4yrkDo4gjHTU9Q2fcFT6R+G4bLPYV6t1g9Qm913AKjevVi6Xd+qCpY2oki1PJl3Zz3eNutR2HESziBHS45JeUo4p6yHz2WjVPbF2viXRE1W0g9DcQ/cRK+H5TGixJZvI4e7VnzLLM6ysUVnbrFIcJn1IzSOJUhpP/Y8CbeATqlrT5MYkowiz9EZwDrO63SEmA7eoo/l9YXPeegBUCsYBXBih4VRapXla9AuzVAR9PVxkQ7dv/DO01Xy948tZqOVn3rroN1olluIlgWl8SWg1pq0K4V6Qq8rtvvZ2MwU8xGaqQmyglm2/bhcC8UVzeKFqjZFbYwX0xbgSDJuMg1TACMHEBgrDHllhCwJVmL3fvDreHlt1aM6GV9T3ViKe1jtjf4BZGahRnNxcdaUs8J4wgr+l27FnOXshnwxOh/sAmjHmpniOKT+m28inC0hRuMZG6px2mmME9nN1gl0mnahgmFi+PY/O6R3jwJG0QEpwsTzpjnkIQVSwxbyJPWWwk0flA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(5660300002)(83380400001)(81166007)(186003)(54906003)(4326008)(478600001)(34020700004)(36756003)(8676002)(86362001)(47076005)(82310400003)(26005)(8936002)(6486002)(2616005)(6512007)(966005)(70206006)(2906002)(55236004)(70586007)(356005)(33656002)(6506007)(6862004)(316002)(107886003)(82740400003)(53546011)(336012)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 13:12:39.5948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39180560-968c-4599-695e-08d8b6fbbd06
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1888

Hi Julien,

> On 12 Jan 2021, at 12:46, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 12/01/2021 10:50, Bertrand Marquis wrote:
>> Hi Stefano,
>>> On 12 Jan 2021, at 00:16, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> Don't read aarch32 system registers at boot time when the aarch32 state
>>> is not available. They are UNKNOWN, so it is not useful to read them.
>>> Moreover, on Cavium ThunderX reading ID_PFR2_EL1 causes a Xen crash.
>>> Instead, only read them when aarch32 is available.
>>>=20
>>> Leave the corresponding fields in struct cpuinfo_arm so that they
>>> are read-as-zero from a guest.
>> I agree with the fact that all users of identify_cpu are currently using=
 spaces
>> which are 0 but to make the core a bit more robust we could do a memset(=
0)
>> of the structure at the beginning of the function.
>>>=20
>>> Since we are editing identify_cpu, also fix the indentation: 4 spaces
>>> instead of 8.
>>>=20
>>> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
>>> Link: https://marc.info/?l=3Dxen-devel&m=3D161035501118086
>>> Link: http://logs.test-lab.xenproject.org/osstest/logs/158293/test-arm6=
4-arm64-xl-xsm/info.html
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> ---
>>> xen/arch/arm/cpufeature.c | 35 +++++++++++++++++++++--------------
>>> 1 file changed, 21 insertions(+), 14 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>>> index 698bfa0201..b1c82ade49 100644
>>> --- a/xen/arch/arm/cpufeature.c
>>> +++ b/xen/arch/arm/cpufeature.c
>>> @@ -101,29 +101,35 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_=
capabilities *caps)
>>>=20
>>> void identify_cpu(struct cpuinfo_arm *c)
>>> {
>>> -        c->midr.bits =3D READ_SYSREG(MIDR_EL1);
>>> -        c->mpidr.bits =3D READ_SYSREG(MPIDR_EL1);
>>> +    bool aarch32 =3D true;
>>> +
>>> +    c->midr.bits =3D READ_SYSREG(MIDR_EL1);
>>> +    c->mpidr.bits =3D READ_SYSREG(MPIDR_EL1);
>>>=20
>>> #ifdef CONFIG_ARM_64
>>> -        c->pfr64.bits[0] =3D READ_SYSREG(ID_AA64PFR0_EL1);
>>> -        c->pfr64.bits[1] =3D READ_SYSREG(ID_AA64PFR1_EL1);
>>> +    c->pfr64.bits[0] =3D READ_SYSREG(ID_AA64PFR0_EL1);
>>> +    c->pfr64.bits[1] =3D READ_SYSREG(ID_AA64PFR1_EL1);
>>> +
>>> +    c->dbg64.bits[0] =3D READ_SYSREG(ID_AA64DFR0_EL1);
>>> +    c->dbg64.bits[1] =3D READ_SYSREG(ID_AA64DFR1_EL1);
>>>=20
>>> -        c->dbg64.bits[0] =3D READ_SYSREG(ID_AA64DFR0_EL1);
>>> -        c->dbg64.bits[1] =3D READ_SYSREG(ID_AA64DFR1_EL1);
>>> +    c->aux64.bits[0] =3D READ_SYSREG(ID_AA64AFR0_EL1);
>>> +    c->aux64.bits[1] =3D READ_SYSREG(ID_AA64AFR1_EL1);
>>>=20
>>> -        c->aux64.bits[0] =3D READ_SYSREG(ID_AA64AFR0_EL1);
>>> -        c->aux64.bits[1] =3D READ_SYSREG(ID_AA64AFR1_EL1);
>>> +    c->mm64.bits[0]  =3D READ_SYSREG(ID_AA64MMFR0_EL1);
>>> +    c->mm64.bits[1]  =3D READ_SYSREG(ID_AA64MMFR1_EL1);
>>> +    c->mm64.bits[2]  =3D READ_SYSREG(ID_AA64MMFR2_EL1);
>>>=20
>>> -        c->mm64.bits[0]  =3D READ_SYSREG(ID_AA64MMFR0_EL1);
>>> -        c->mm64.bits[1]  =3D READ_SYSREG(ID_AA64MMFR1_EL1);
>>> -        c->mm64.bits[2]  =3D READ_SYSREG(ID_AA64MMFR2_EL1);
>>> +    c->isa64.bits[0] =3D READ_SYSREG(ID_AA64ISAR0_EL1);
>>> +    c->isa64.bits[1] =3D READ_SYSREG(ID_AA64ISAR1_EL1);
>>>=20
>>> -        c->isa64.bits[0] =3D READ_SYSREG(ID_AA64ISAR0_EL1);
>>> -        c->isa64.bits[1] =3D READ_SYSREG(ID_AA64ISAR1_EL1);
>>> +    c->zfr64.bits[0] =3D READ_SYSREG(ID_AA64ZFR0_EL1);
>>>=20
>>> -        c->zfr64.bits[0] =3D READ_SYSREG(ID_AA64ZFR0_EL1);
>>> +    aarch32 =3D c->pfr64.el1 =3D=3D 2;
>> I would put some () around the test.
>>> #endif
>>>=20
>>> +    if ( aarch32 )
>>> +    {
>>>         c->pfr32.bits[0] =3D READ_SYSREG(ID_PFR0_EL1);
>>>         c->pfr32.bits[1] =3D READ_SYSREG(ID_PFR1_EL1);
>>>         c->pfr32.bits[2] =3D READ_SYSREG(ID_PFR2_EL1);
>>> @@ -153,6 +159,7 @@ void identify_cpu(struct cpuinfo_arm *c)
>>> #ifndef MVFR2_MAYBE_UNDEFINED
>>>         c->mvfr.bits[2] =3D READ_SYSREG(MVFR2_EL1);
>>> #endif
>> If we test for aarch32, the ifndef here should not be needed anymore.
>> > Is your previous patch really still needed if we go with the aarch32=20
> path ?
>=20
> There were two undefs discovered:
>   1) On Armv7 when accessing MVFR2_EL1
>   2) On Cavium Thunder-X (Armv8) when accessing ID_PFR2_EL1
>=20
> If you remove the #ifdef, then you will re-introduce the UNDEF on Armv7.

Right sorry missed that one.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


