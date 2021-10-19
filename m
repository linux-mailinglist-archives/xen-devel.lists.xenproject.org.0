Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C334336B6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213205.371355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoti-0006IS-Ih; Tue, 19 Oct 2021 13:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213205.371355; Tue, 19 Oct 2021 13:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoti-0006GQ-Fd; Tue, 19 Oct 2021 13:11:18 +0000
Received: by outflank-mailman (input) for mailman id 213205;
 Tue, 19 Oct 2021 13:11:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJzt=PH=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mcotg-0006GK-BG
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:11:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1705fb75-e4f2-4088-a77c-05c733c85c3d;
 Tue, 19 Oct 2021 13:11:14 +0000 (UTC)
Received: from DU2PR04CA0335.eurprd04.prod.outlook.com (2603:10a6:10:2b4::11)
 by AS8PR08MB7338.eurprd08.prod.outlook.com (2603:10a6:20b:445::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 13:11:13 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::ea) by DU2PR04CA0335.outlook.office365.com
 (2603:10a6:10:2b4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Tue, 19 Oct 2021 13:11:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 13:11:12 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Tue, 19 Oct 2021 13:11:12 +0000
Received: from fc37a889b8b2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 154B152E-3614-4AC1-899E-7745CE50D28B.1; 
 Tue, 19 Oct 2021 13:11:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc37a889b8b2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Oct 2021 13:11:06 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0801MB1863.eurprd08.prod.outlook.com (2603:10a6:4:76::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 13:11:03 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 13:11:03 +0000
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
X-Inumbo-ID: 1705fb75-e4f2-4088-a77c-05c733c85c3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRcSlt9I9aogKe+yx/QllPguBBDfVQPMojSfJPX5o/A=;
 b=T5cRfDBgtgDBHJyYX5Ly+OR1LVS2aB7sGxzekET02Y+c1O+vRszw0zhtp35ewYRq6yNTZAAlfrfBSfwWudLE/HXXZbOfBq+abYkZW8/GAdbG8uX6u4E/8mPR3jihaPt2i93jekPYoS7vxbGAg5cvi2W1KlZ2Yr++KgCpGQJHlY8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dcee0aca3fbe1fe4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE9r7RqdcZoKYCZGTSgMnH4AKick3v2qtPJ5zmUNpSsoRhMfwd98L/1hc4YxVucySPRfMtQS8l0IzZ/pa6uOrtjnYV0nYeHlDFEayU6vmZANB5LolCjp6FAJcVBPsbK36whgjOAKI0GlIz8sfVh9IPkKQ2xpifBDfnMXplGkXWqRClvEcBRNeJjCE+FR4pNrc4x0XmbBQxYdfBdaPWkhFkY6uH52QL5hA7PuX39tqlLJryHwAtBqcAuK2Zd0gQMctMpejK7Co2Csfb/xUeeTMG1fAz9L1VsYwlM5SXpPILN/GNlnsnm91eeybsunCdFWNvbHufI+XwVwReNQIzlEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRcSlt9I9aogKe+yx/QllPguBBDfVQPMojSfJPX5o/A=;
 b=j0HTqyR2+vHl7AF35FwZffLhL8exVrDehj7ZN0TqBnwwB6j/k8VXiII7rKm8Zb7qvd5SaHPzVkjYhHB+wzRfzi5xeyR0ZjR50NUnKpMUqS8Qt7Ir5okBdeujYlCrjIxm03oFrCedPRfC01IJGtNg1b//mcBf5CA7x5VYHPIAzHAC/eVVnAlKwdxBQaQHFNUxe3YABWkSyVJzsByHzRXWVgN3SWs/yXFA/+EFcUCES4uaSlolOya5P3pKsj/UwL4G9zweivpWGQel/3LPwRsUqJO//lrhJh9tSPUv3Nu7UDZ+6iC0ztB8hWMAFo4toJqNZvaTgiJtx8o+ofm/wLPdoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRcSlt9I9aogKe+yx/QllPguBBDfVQPMojSfJPX5o/A=;
 b=T5cRfDBgtgDBHJyYX5Ly+OR1LVS2aB7sGxzekET02Y+c1O+vRszw0zhtp35ewYRq6yNTZAAlfrfBSfwWudLE/HXXZbOfBq+abYkZW8/GAdbG8uX6u4E/8mPR3jihaPt2i93jekPYoS7vxbGAg5cvi2W1KlZ2Yr++KgCpGQJHlY8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "iwj@xenproject.org" <iwj@xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "Oleksandr_Andrushchenko@epam.com"
	<Oleksandr_Andrushchenko@epam.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/3] Fixes: PCI devices passthrough on Arm
Thread-Topic: [PATCH 0/3] Fixes: PCI devices passthrough on Arm
Thread-Index: AQHXxNXsWVtDOu3dTEyPepRQ+pXuJKvaP3CAgAAMbYA=
Date: Tue, 19 Oct 2021 13:11:03 +0000
Message-ID: <BEDBA4C6-CAA4-403B-88D4-06AC428DD83D@arm.com>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
 <e22e85d1-2c57-29a3-9f4b-b2754069026b@suse.com>
In-Reply-To: <e22e85d1-2c57-29a3-9f4b-b2754069026b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c7f4278d-6151-4d50-cad2-08d99301ecfc
x-ms-traffictypediagnostic: DB6PR0801MB1863:|AS8PR08MB7338:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB7338A10414E54DF48EC7DED59DBD9@AS8PR08MB7338.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eAbmwK6BAFnR9Q9aD93JOry1lBJiiILohR7yF0xHxxsL6VisVrib3YMX0bNjAlzjzfNYHiaqJIeSp+sGGGSzS3fhrA2xSatf8kH742Td+n0ZDRR4hIKeUOW84aTJ0xNhpB7ANIoSs1If3qkRZMiUXYEK+oZ7ZMlmsIbuqT/bdJ7aFzBglGL+oWvT4aYU6IOV+Vmigx7E2A9QPxrXH1+w9jl3wUIqaJP9rYMaxK7parJs3Ilpop1FtCGpCcGMmtW5P6EWmO2oknz2USkzd2KT8bZawbNnagNWLZQGrJCOQnvHjnKduCVXt01r3wYfbmT7rB5rSxbUquwQw/VPpqJ+8JCDFJIZzbAO+P0Mq4ZH2YGg+U1k3wSE8JwZkTYAuONJCq0YWGgO43DPpn4z1O2ZHTnMOd18Byccu7f0BVL4PkMKfatpPdz0QmrVHW6dbLrhyZ82w66vJEforx0lpYXtCkuMmyK2SN/+kCgRHqXRt9EHpuERLebjHlbZyHIedTKRC+1Li8gmrvLEfcT709niNLH+ectwe4zNH5ZV6YnRExBouFYhLMIUI9htfHgfSl7KzV3hTeEWSzSoLUnSXjE838JWeHQ/zcl8Z4FIT75ZGj1A9D9YI0wHVA/kf+PlxDVGVT7PvGuTfh/y68Gjj1927iWQAIROJvOmZloiP17Bo6F4AjwbtX203AHF89FnFoLBw1R7UiFbY2fJiePkgam8x11Cmj278hEF0tGgWLFQUr26vxjE7DV7ip+6xUZcE8wNCnPfLp1R0eQwUkVHsUsyLWg1Eg7r+nQYvBiT5rwOawNSl3TUzHy1uzuaoZ1rLPye
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(2616005)(2906002)(53546011)(4326008)(6916009)(6506007)(186003)(71200400001)(26005)(6512007)(33656002)(508600001)(6486002)(966005)(86362001)(91956017)(76116006)(66446008)(64756008)(66556008)(66476007)(5660300002)(316002)(8936002)(66946007)(8676002)(38100700002)(36756003)(83380400001)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3A00A48F40ADFB448688BF390B8CC8F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1863
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	38302698-1d98-4e4f-2df5-08d99301e776
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Widic5yuAOTdCvlbVJTuFZ8WJG6q9NuJ5OeLtosXp2nKIh24zYjNTHjY7jQISQ2swke75ptyFp0JxJ77b/syiOpHhlcBi35eg51TbcmHndmroMK6ascej+6R/NJJEqvNoNpEtNhpi4B+ifkyVeYJHWnRKiGfUQtZH9xyU3nlu6hhR3hs8Qec1ONaGcWe4q7uvRHeRMTIbya0MUuXe6KRYz065Jy/QeF6UROI0Y4O9ebjAmtHfYeEZMknZqZDZ0ryu6/OYybDGpHHf0SXGNBmoNEIDohhYhH4uHA5+wZLzvzvJ/2X4VoVK25jx3cmkTi8bCjKhUNqMODWME/Ruv+RcwZ9TY2mpgFwV3VnbVxacTWHMZJ8rq2jiVaQEPTcqzNzWo541KNZEakbIlgo5AYLcL5JATD6o3qdif3qU4KLODZr2qQK2M5CHgJ6Bfp4z6NC2YicEZK9tJTtIkdg6kFF1BcC2O0oI9nChHmz0v8mrMDLfx/E4PdRohNZRpOVVUBefQFnMotmCEp2mGbNTkMN+v+p+DLsf2YRxGb1cyhptlgNXQ1sLq9blLklkew48p2NJGkLpEmUnlEz/7r8pjU9r0n0btov9A5CENUO9PCZbqCLXhmnzIl334hiOieRiEiFarMgWK9dUz8nq4pZhkDtnyOFIUJuwrSMsexAQxmL3XZIdFxp4I2F2KHdeq2DZUgXMoVDuucVhI1lA5wPgMxz6iv2Nv0e/2f5ffiLOHMYjlX2f1MD4Zkc5/5Fosx9PTpxR94NpqOl2brM9pCwBPj6L3oKlU2w4KlYjhFyVsyrNVE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6512007)(36756003)(36860700001)(508600001)(70206006)(5660300002)(966005)(8676002)(6486002)(70586007)(186003)(26005)(6506007)(53546011)(336012)(33656002)(8936002)(2616005)(4326008)(54906003)(316002)(86362001)(356005)(47076005)(81166007)(2906002)(83380400001)(82310400003)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 13:11:12.9806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f4278d-6151-4d50-cad2-08d99301ecfc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7338



> On 19 Oct 2021, at 13:26, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.10.2021 12:40, Bertrand Marquis wrote:
>> This patch serie is a follow-up after various findings on d59168dc05
>> ("xen/arm: Enable the existing x86 virtual PCI support for ARM") as of
>> agreed in [1].
>>=20
>> It does the following:
>> - enable vpci_add_handlers on x86 and not only on arm
>> - remove __hwdom_init flag for vpci_add_handlers
>> - add missing vpci handler cleanup in error path during pci_device_add
>>  and pci_device_remove
>>=20
>> [1] https://marc.info/?l=3Dxen-devel&m=3D163455502020100&w=3D2
>>=20
>> Bertrand Marquis (3):
>>  xen/arm: call vpci_add_handlers on x86
>>  xen/vpci: Remove __hwdom_init for vpci_add_handlers
>>  xen/pci: Add missing vpci handler cleanup
>=20
> Imo all three changes need to be in a single patch.

I will merge all changes in one patch.

> An option might be
> to have first what is now patch 3, with CONFIG_ARM conditionals, which
> the subsequent patch would then delete. But what is now patch 1 cannot
> come before patch 2, and patch 2 alone would unduly impact x86 by
> moving code from .init.text to .text for no reason. (Still it could
> technically be done that way.)
>=20
> But let me also comment patches 1 and 2 individually (patch 3 looks
> okay, apart from the ordering issue).

Thanks
Bertrand

>=20
> Jan


