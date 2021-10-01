Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B041EB44
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 12:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200527.355036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGDJ-00050c-9q; Fri, 01 Oct 2021 10:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200527.355036; Fri, 01 Oct 2021 10:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGDJ-0004xC-4K; Fri, 01 Oct 2021 10:56:25 +0000
Received: by outflank-mailman (input) for mailman id 200527;
 Fri, 01 Oct 2021 10:56:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRx5=OV=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mWGDH-0004x6-3H
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 10:56:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd897907-829c-4ef9-852f-a7b9cbe3c3b9;
 Fri, 01 Oct 2021 10:56:19 +0000 (UTC)
Received: from AM5PR0201CA0006.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::16) by DB7PR08MB4618.eurprd08.prod.outlook.com
 (2603:10a6:10:78::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 1 Oct
 2021 10:56:17 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::69) by AM5PR0201CA0006.outlook.office365.com
 (2603:10a6:203:3d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 10:56:17 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 10:56:16 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Fri, 01 Oct 2021 10:56:16 +0000
Received: from 16dce784b55f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F37F741-CFA7-4992-BF6B-2D002A33611F.1; 
 Fri, 01 Oct 2021 10:56:04 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 16dce784b55f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Oct 2021 10:56:04 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6231.eurprd08.prod.outlook.com (2603:10a6:20b:298::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Fri, 1 Oct
 2021 10:56:01 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.022; Fri, 1 Oct 2021
 10:56:00 +0000
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
X-Inumbo-ID: cd897907-829c-4ef9-852f-a7b9cbe3c3b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMC8C8S3srz1acfz0PVOTwhW7CYkqeFUHKm0A5iBjyc=;
 b=qNynLcZDInCB0i3NV3RTkmW8tZkWESEdgmH1oiVWeqJOgvvEdifGhf0l7xpLH/nAboebZHvBZCBkH5C+Si/zZVZ5HVsvxGoOuBcK/SNYtarWvbCP6OP42MaLxpy0r/EqwRdhQQ2MssTygbXxptsSzucztqcqoLTQtazmBSL6QVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0cb3bee530746eeb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVJARB+lxiIQ+ucnvTjhWzY3HCrpGH4mApLN1sw0v4x8/VWuKtZKuq5bmXV5euWehgyd1b/mpGsU0Gcy+n8JCHt+o/7AoW+kbrNQ3KO4zBG1acZyhsxFDfgcLlT3N0vFg1w5T3k5FBTlGwlPirEkJNKyQI/uNVvwB1SinVmjaQ3O3QOPcE/P7LXod4oWIHJXLQfI3Sbk1GuQ8KrHwNEt/X0szYIjq9oabffjvbuekbGlsZYLMv98UISFc7UpjKUuhj9piqjBLVS/fDZ2PfgqFN+lUvu3gBYdwlOpgGc2+tw+aC5IccRO6VpzHEKvYUaQuUIyKBpvRT7kzadbyYqG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMC8C8S3srz1acfz0PVOTwhW7CYkqeFUHKm0A5iBjyc=;
 b=cMJ/4X+j/fTewmAOQtXoqVQIBnH2oCl7Tmp8fQrD1P0CIXaDMuy6KG4jzb2URcf9ICDj3TcQ2AZdrwaCLkE8jL4AlMs8OWSEnrxtsOzDqyPnPKortw4m7Gmmbint8aMsbQCh30viUCURByccpAzDRxjkn5g+tLrlPyI/JM2GnISUv6/K+njHQO2LbV8azTINtBH6hsIS3jyVkSmNqqGPbgJFb7GRuRoL91Q252VNqLh22Qj0ggOiE9lfRl6CNXhXcS2/Ru74vZ3n0rUWLYjc5T2v2Ym0ICsI5FEeZEp9zKNvtczwrVcABlakzDqG+Ex22vDJEaER1Nwej+HmUCiW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMC8C8S3srz1acfz0PVOTwhW7CYkqeFUHKm0A5iBjyc=;
 b=qNynLcZDInCB0i3NV3RTkmW8tZkWESEdgmH1oiVWeqJOgvvEdifGhf0l7xpLH/nAboebZHvBZCBkH5C+Si/zZVZ5HVsvxGoOuBcK/SNYtarWvbCP6OP42MaLxpy0r/EqwRdhQQ2MssTygbXxptsSzucztqcqoLTQtazmBSL6QVE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 10/17] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
Thread-Topic: [PATCH v3 10/17] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
Thread-Index: AQHXtJXG2o5Yt51spkWvVbiV4Q7GQKu8rowAgAFOHAA=
Date: Fri, 1 Oct 2021 10:55:59 +0000
Message-ID: <6F9450F5-90D3-46A7-8461-529F8995A1CE@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <edd6689cc977292fa874059861474993e5819c14.1632847120.git.rahul.singh@arm.com>
 <8b9dc108-c20a-bce3-42cf-18a44e369776@suse.com>
In-Reply-To: <8b9dc108-c20a-bce3-42cf-18a44e369776@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7fa729fe-9a5b-43bf-e9a7-08d984ca17d6
x-ms-traffictypediagnostic: AS8PR08MB6231:|DB7PR08MB4618:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB46180C895D8B976679DFB2BCFCAB9@DB7PR08MB4618.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TCFMf4r4VCJ/Bso+P+Yi38JwS9pNUIgc6j+6yEtItjfcoLRexwjUiVs2C0r2LsF40xVfz4kTOU1NQQtLnZQFV57bQV8NVJAdcTxJE9qrfn8DrEVbm+tDOCMhOYXuFNGYPpZ3b+qL5ivVk5FOM9CyOKxuGax+MQEPP+WEdj3k/vnSusiLpqQUm6eZYM3G2iPagfShc2ECDRYRW8zM0EqMLobKOF+/fvZ6mnO9rW1VzamGm9s1pSIWUYr5BRAJKiUDcG6DtYH+lX7q/iyFKCje36o3OmR3w8MmRqceRlXIseGiMUKoIaYYmnqyGjIJR+hluwQ2ifybrBisNEHr7V3wHiPuLUH01XTHdquU2hEbUGNRLpeHs57oUpBNf6XkzmH8O5AtVf3cG+EQX0Pq2PwICcDYstDzFNNB4XG99Jb/EVxj3b3jhaTPurqfAhPdG6dp0LpRgRPgSCPkcNzR0c4i5n443ogrMRBSH70T7IpNGN4+QThe8AysasJNPxjnAboydBRchnRX9rllqtO3XN3HEMYCVkdpZAVCdrWnVnabaqX+Eem9puulY98GaPH5vHlaZmoLetQu2ZI6RNepgmWi0kU/VDmvESs8rJ5ImoSmGYLeahx+ybDj4bomr77QZHRbsPNKZ+wD2b2ryGTCUf0SazYvsxJncZ3ukgXesnlg7QvMLMNg4ftvVdTgQk0cUs257fmeeNlJfLJxujlJwR+THsuY5BHdWxKcRA5n0pxKvInvrnZO2hHEXTMkVVb8j1a4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(6512007)(508600001)(83380400001)(122000001)(6916009)(86362001)(5660300002)(2616005)(54906003)(316002)(2906002)(33656002)(8676002)(71200400001)(8936002)(66476007)(66556008)(64756008)(66446008)(26005)(7416002)(38100700002)(91956017)(76116006)(6506007)(53546011)(186003)(6486002)(4326008)(38070700005)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7E125D4F00E3E34880C860980D98FD1E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6231
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db0ce3f1-f1d1-4ae8-5313-08d984ca0de9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SnkkQlnYvJIMd1mt+5WYDQjwkSc/7ICH+EI5SsFRQ6QGLmDT8LZLX2wwBEdxqV3drHN69keiRNnEGBm0ylGNc5JvUlsvwfFYX625HdvAhGcEhf9yKBJ7pQen6vrJIVMTBRkVAd2T0x/56pB2rrUsfmyfVHSzxFvZ4zOofGhloITEaKoHYLsB994x6xjDx+yU0yHxxs+HlDvinCsLEomO6ItiLkfCVMT7hCAeat2BN+pYUCOft8+tjJJMEXHsN+dFQqJXYBAU35hb9mAJRZAfs+jqq8tGw8NuhyfM2z/WA3t4BpUQQMKryoXBtnwyCdsNFfun8sTiUYj2YwlpwVs4dtH5ePpZhpbXPcr9dxQaMopwKd9MyAlrRtu5QbNp2zV1bc/vZ2sDn06ZG923O6emOFElExyDq2gjiJy01YrozRW3Vk7iXQ69D6i0F48dwwGIAvo6Ns1RTqreM55eE0kqQ3Uci0ooZXDqx1xW5z7+hQUXRYXjr3IG6yB3HepAIKAJSVWdIOl2bDbrZz6RRb/5kBcb+PmV8w9gt0hhU84+TXGGpMUkEyOT0uKmYqIMChjl23osdlsR6OuO2Pk9cZDDWkFMJgEQbkbjzKAd80k15PRnAV6BoO85X0dtsCDr5/7oRYcczGB/hcjOpBi7EeBZ7paH13BFdrZJHtIw/GD0Pc9zSWCvvM9c/f6LvaNLdniS5vSatdmdIZ9fkWfJLNFtZA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(83380400001)(70586007)(82310400003)(8936002)(6512007)(6486002)(47076005)(86362001)(316002)(36860700001)(53546011)(336012)(4326008)(8676002)(5660300002)(2906002)(6862004)(54906003)(508600001)(26005)(6506007)(186003)(33656002)(2616005)(356005)(36756003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 10:56:16.7296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa729fe-9a5b-43bf-e9a7-08d984ca17d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4618

Hi Jan,

> On 30 Sep 2021, at 4:00 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 28.09.2021 20:18, Rahul Singh wrote:
>> @@ -62,8 +63,21 @@ static int __init acpi_pci_init(void)
>> }
>> #endif
>>=20
>> +/*
>> + * By default pci passthrough is disabled
>> + */
>=20
> Nit: This is a single line comment.
Ack.
>=20
>> +bool __read_mostly pci_passthrough_enabled =3D false;
>=20
> Nit: Unnecessary initializer.

Ack.=20
>=20
>> --- a/xen/common/physdev.c
>> +++ b/xen/common/physdev.c
>> @@ -19,6 +19,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
>>         struct pci_dev_info pdev_info;
>>         nodeid_t node;
>>=20
>> +        if ( !is_pci_passthrough_enabled() )
>> +            return -ENOSYS;
>=20
> Here and ...
>=20
>> @@ -54,6 +57,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
>>     case PHYSDEVOP_pci_device_remove: {
>>         struct physdev_pci_device dev;
>>=20
>> +        if ( !is_pci_passthrough_enabled() )
>> +            return -ENOSYS;
>=20
> ... here -EOPNOTSUPP (or any other suitable value, which -ENOSYS is not
> from all I can tell) please.

I checked all the possible errors and came to the conclusion that
 -EOPNOTSUPP is the right choice here.

>=20
>> --- a/xen/include/asm-x86/pci.h
>> +++ b/xen/include/asm-x86/pci.h
>> @@ -32,4 +32,12 @@ bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigne=
d int *seg,
>> extern int pci_mmcfg_config_num;
>> extern struct acpi_mcfg_allocation *pci_mmcfg_config;
>>=20
>> +/*
>> + * Unlike ARM, PCI passthrough is always enabled for x86.
>> + */
>=20
> Nit: This again is a single line comment.

Ack.

Regards,
Rahul
>=20
> Jan
>=20


