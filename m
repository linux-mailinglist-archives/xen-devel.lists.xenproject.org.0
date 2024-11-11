Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A845E9C3CB7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:09:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833550.1248719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASI1-00021g-Dr; Mon, 11 Nov 2024 11:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833550.1248719; Mon, 11 Nov 2024 11:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASI1-0001yz-AN; Mon, 11 Nov 2024 11:09:01 +0000
Received: by outflank-mailman (input) for mailman id 833550;
 Mon, 11 Nov 2024 11:08:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNBq=SG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tASHz-0001ya-FG
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:08:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2612::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57d4b853-a01d-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 12:08:56 +0100 (CET)
Received: from AS9PR06CA0584.eurprd06.prod.outlook.com (2603:10a6:20b:486::9)
 by DU4PR08MB11173.eurprd08.prod.outlook.com (2603:10a6:10:576::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 11:08:53 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:486:cafe::7) by AS9PR06CA0584.outlook.office365.com
 (2603:10a6:20b:486::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 11:08:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 11 Nov 2024 11:08:52 +0000
Received: ("Tessian outbound c60e9fd8cfde:v490");
 Mon, 11 Nov 2024 11:08:52 +0000
Received: from L5463eda49388.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A80FDAE-340E-412E-AAD1-3583A08F881B.1; 
 Mon, 11 Nov 2024 11:08:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5463eda49388.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Nov 2024 11:08:42 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM9PR08MB6145.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 11:08:39 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 11:08:39 +0000
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
X-Inumbo-ID: 57d4b853-a01d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjAyIiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU3ZDRiODUzLWEwMWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzIzMzM2LjMxNzUzLCJzZW5kZXIiOiJsdWNhLmZhbmNlbGx1QGFybS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Lrs+vbSY7i47m2lo0Id5B6bN3b9QCgcl0pGhurL4hfpyKEVrvdgoHwvQgC4r+JhXYlX2VJT5dbcwDdyEVaJ7aiY0DCnQvalijVQ8+nzqMD8Rm/P+aTHkPEzjhwsuiI/Aen8/zRWB1wC8AxGL+mWOSuudcF4Ay8aIO1xVK9tw7m/OWV4Xizn1TB0BC42RDpQ4iIOL+Hgxef1BvjjO1VFei+U3DbJE/QcYj8M/EVTpWKoWe0WjWgKYIk7AahVtMKhITLaxxzHEhBf4CTInW7pZTtAcOGHbPecgIHE+V3YsanoI4HXz50eFXCQdSEkWSsXDdoEmF9PFCmP7zGqUAb+u8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tvJ3wZCu57GuE7FjFF0+jw/N6saqEDFrCd7BXEPxRQ=;
 b=mrK5QKg2eFk1fYqrYKdRW6GkcRRmG7lye4Qx43ClKkiGfi+mAinSd1zQ5+xNm6EG5OfGPLQWYZQkUnjOoHiO5tNv7eNEVPC2jIa18t9FrEQ597FBs58mSrupwEHb0Ga+aw4bZHOH/wcMUtVoPIKWNjCv1Ah9DZ6YlQxxZ69EmGi+YRGH8XXyyghw/GJbEKYWgCiBt0xvlavCdzdudTTJdVI4irGVaoiCWMXiRIMOhRrOONTbdIdgKT+4bokClHUVNl5zAUrzJ/QCuMqRXmJydGTX+yXHFR1yuTcbWtzncHU+lbytCNsCp5T6zxY6gCwN+l22jEwfA1QlQYzMXE0sBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tvJ3wZCu57GuE7FjFF0+jw/N6saqEDFrCd7BXEPxRQ=;
 b=TdnaPG2EV2AnXLJB1549GeS9JUgNgssNxcaindNFMU5XiOQRqnlhFv5r95Q5oZF9n5AIeyE8VDECW6xGfEBxypip0QoNudJAOMDBR3BgRUbkWKZN9lEFNchfOHXfvB9Pj6/FgfiLZWVgI/V96oKQd87GYF3dfUVR1e/+6zDI8IE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c25bb76f7e868e7b
X-TessianGatewayMetadata: uGXOuZaS+snHEYL05eupWMaFuhx5DVTS3cj8J3wcw0jBOZ0cniWqQ3lmARmT6mbmB0HejcALqtpCP9ZQuuhHX5MbVFvJR3QyzlkcNEq7oFb/6He/adiTO3MrV5KPOIC2bCYvu1xO4JXfgDuhnfqqi9Izd3WRVpBbkw1iyTdUnhc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYvU4LmJPG6SDzhL+yMreOQ4hECAe52M7cjDBW/pxmKvjJuvUsNC4/OaFbPAHat9pzm34XmAnX6PVDEGFSOMWidn98ItGdie3X0uXxbcy5AmzsyzoGoUpgIVQ8BbbxB2nzOUeA5MrTN/95pI7EMamwKnwfHC1hwIe7t0PC18Mbm5qcfk+7QGwVss0LhaCICCXMemkarYMCCiU8b8JZGS3qBKDBnzvPfR77kFFcOcjITUjCLsMs5QZIClDDTNx3bQXnNzdD770+VehJlfdhVJlcpGZBmI1tOn9mJSsVK561+nyQxUbsUwn3KiK2AB2F5VXeDD4yKsuzqA33W7mp1gcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tvJ3wZCu57GuE7FjFF0+jw/N6saqEDFrCd7BXEPxRQ=;
 b=tz+CqX+MeEt/xwuS0MoeMpwfiInqubvoyCL8vCzCDx4ITZ6qWyDn8L8J/gt/Cn21M7jD3/QFdFxRGUE9PWrQNdl03uHkvtdzvTN7weYATq54gBJVGFqmrDut9mtN62T7t1jPB3BeKIN0LRbh46x0J8Ryi5SCjahgDQHdKJqmZgGqUjmIQfs3uguNb/Or9VR+LvSqA21zfiGwiEdi+vUeNXpsUYG3qxEc218c+p2sm/6I+rb6cGjDLwJLDQuQ2epyiQkGDmvdI9ZTivayOWjniCa5yd1dZ29rR+Y/ZXA4jdKSt7t9TiEex4pmSRYhtzUzpNK6Gbx1XP7hkmlx6zSN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tvJ3wZCu57GuE7FjFF0+jw/N6saqEDFrCd7BXEPxRQ=;
 b=TdnaPG2EV2AnXLJB1549GeS9JUgNgssNxcaindNFMU5XiOQRqnlhFv5r95Q5oZF9n5AIeyE8VDECW6xGfEBxypip0QoNudJAOMDBR3BgRUbkWKZN9lEFNchfOHXfvB9Pj6/FgfiLZWVgI/V96oKQd87GYF3dfUVR1e/+6zDI8IE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
Thread-Topic: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
Thread-Index: AQHbMhnBgSbSnEnP3kCeg3Nc76pTWrKx794A
Date: Mon, 11 Nov 2024 11:08:39 +0000
Message-ID: <64D316F1-F28A-4469-9E61-16699296615E@arm.com>
References: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM9PR08MB6145:EE_|AM4PEPF00027A6B:EE_|DU4PR08MB11173:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f95025-2a20-4b55-307b-08dd02413a15
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QXlhQVJSTGNhb2dMT1IyWkNSSFMzdGNSVFlsbnJTU0ZvRm5Xa2YrcXhhN3Fn?=
 =?utf-8?B?bUJVZC90S2NscTVUQ0kzUXlkM3cva3BqMTRCaFBoNjg1akNaQks0VDZjZVRz?=
 =?utf-8?B?THFEVDlRWnZFcjV1QzJxSWxENHhFOWNiZzFlNVl0R0YyR0ZNR2g1SFB0bWpx?=
 =?utf-8?B?aGlvMGhUNy9hNUV5Z2dSU29xTEhQc2pCamdqZFl3YWd3RGxYcFpBWXBQOU1K?=
 =?utf-8?B?bG8yOVhpaW5MQlEzblRreWg0TjdTblVDZnBCT2pwWEwzSEpWdDlNZm1sRDZ3?=
 =?utf-8?B?NmRUQjEyWnh1RCtGYk1XaVdjeHF1RVdacjBjdGluR3hqTGFmaWhnd3FmVEc4?=
 =?utf-8?B?dkFjT0lxTUQ1Nm95bXFYRFlZWmR5SFo2Rm1zQlRUaG5JanVDWUlWUVg3WFFr?=
 =?utf-8?B?WWY3bUJNbmt6UU5oR1djZU5NTjVZZGhjZVdGNUFDd3hJU0d1bllHdFBLK1gw?=
 =?utf-8?B?QWIyamd2U2NCOHRvL0U3UjE3RU5EWEhlTWsyTkljTDNrMGMxRjR5a2RJRlQy?=
 =?utf-8?B?RWE2TVlFUXJhQWFYOTlSbGVVTGxmZjJpZVpnUVc0OU8vYmVvSUtoSG05Um11?=
 =?utf-8?B?Q1ZhWWdjMDFITHU5bzJmLzNQZFNEZTl4NmtaUURqZ2RrVlZFZUlVWC9jSXNL?=
 =?utf-8?B?U09Yc052Q2llL05kNEVaTmJoYUNSVVIwT29BNi9vc1B3dmR3VUtVSzJwUGx1?=
 =?utf-8?B?Z0NlUE5uaTJCUWxNR21YWUpmZUdyaVZxL2QyV1YybXFWdEZtbkdPNGhUY3Bp?=
 =?utf-8?B?S3VHcVJ5bkU3ZHY1N2lxbmROMWw2aVdVQ3VyMXZBTWVYNVlGM0hSU1IwbkR6?=
 =?utf-8?B?MGFtSitCZytRK21leDdiZ3pGcWFoeEtvSHMwOTNiRHYwajBBS2VlWTFJc2pG?=
 =?utf-8?B?WHRPMnRlNFhWa3lOZ0REQm9iamc4RGRSeEFZUk5OSlhXbE9YVVYvczlPS3Zw?=
 =?utf-8?B?emJTdUJCNFZCaFNybVV6WmFGalZYSDlBU0JzY1Z1dkl6VE02STk1QkRScVZm?=
 =?utf-8?B?V1lxcUVSQmhYWXRCRnM4YjhiUUMxazgySTdYMGJ4VFJyR1MraVMrVHhDSHNm?=
 =?utf-8?B?V3Z5NjlNdzV2SWZwV2hVNmRUMkFTYU9zRUt0UXhRQXk4L3V3b2hpTUdNMmV2?=
 =?utf-8?B?MHcycVpjcVBMY3hVT0lBWHZaRnRLMzBnMjZzckQxdXF5SHBURlAvbVUxL0V5?=
 =?utf-8?B?ekp2Um5MSjIxNk43Ny9KZ1c4WGdZS1NiYjBWK3VaZSt3WWwxKzZXR1ExcU9l?=
 =?utf-8?B?TzNDRnFXaGtaVG1UZnpKQ3NCZ1k5YytOZlRCSFg0cmpVQTRiVzFSU1JYTEJn?=
 =?utf-8?B?WmoycnBsSXV2Y2VGSUpzWVRKSlRtMVV0alJTNzhlZ3kxUzRzbkFFT0N1a3RO?=
 =?utf-8?B?MHplcklQakszQk4zL0ErUG93WEhJV3FGYXZ3SUhzY3hwZ3Z1UWNqTnlETmps?=
 =?utf-8?B?RDA4RityOWNERUdYYVZMUEVMWXVIdGcwdzJadmdYUUEyTlVCM0tmUkpzSnE0?=
 =?utf-8?B?eUcxb3Z5amJRNDJibHprL3FSbitONFcyUkJZYUJOM2NRVFJBZm1SZXIyZnJv?=
 =?utf-8?B?TzYvZmdpL3FWUlZHcHBLQ2lNUzkzVWVNelA3TUNrd2VPekQ3eWpiaW9zZXE3?=
 =?utf-8?B?N0NINGJxNjVrY3c1cGlUbTZIaTdlNHYvbW9uTklQSzRBS2pCZjl3bFY5OUhq?=
 =?utf-8?B?K1dUK1NOS1lOVlRzVEwyWTVISFAwR0hJbUxjOSs5bVZ0ZVV4YitQL2M3R3lh?=
 =?utf-8?B?UFRQNnpTVVR3YWpSVGtQQTZKVGNnUGdaS1hjUUk1blZ4Q2pSUGdjeFZueGFi?=
 =?utf-8?Q?kQ4RV+cbIcD3k/3JEX6zQNgtvGyM4xBaITaUc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <126CCCE84F345049BC1C2760C7C80FEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6145
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a6349cc-3656-4b9f-88ec-08dd02413216
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTBlZzlESGoySVV1dG5YN1FBMXoySWh2VkNDenJMc3lZL2VrZzQyTlhqZU9l?=
 =?utf-8?B?SkVGcVNkUU8wMkxRQnJYMGowTC8yRFNpWDlhTFREUksvUlA0ZVJWMW5pWVI5?=
 =?utf-8?B?b0h3cW5wT1RuQ25NMVJ3MDA0b2JWQU5aZCtiemkvOTRmdFZZdDh2SHRxckRw?=
 =?utf-8?B?OHZCSk80aTZxb2NUM1ljNUJtQTlIVVhVV3F4L1JXaXRGS1ppSzZmRVFpUXMr?=
 =?utf-8?B?Z3BJSnVYTFBLZlp6UjNDT3BNN2tlRjhYd2ROY0NsTlF1aS8vT2RJV0tFcU1z?=
 =?utf-8?B?eEpiQWRpeVZqU0ZNVzVVQzdvZ2djL0NUNmczeDZndGpoSFhIRzVKUndYUVhD?=
 =?utf-8?B?bmhPNHhPV2RsNzBRWUNsMmtwY3NTSEE3eEZwTHNlemt0SCtDWUR5N25pRDB5?=
 =?utf-8?B?TTJRbERNNzJJTkhPTXgzaDQ0WnFqTUpCMis4cVBFVXpENVBQWUdRWDh1aEU1?=
 =?utf-8?B?UlU1UDdha1RLZWgwbE1tR3RjcnpEazN5N2NNSFdxVFFSaktzNjFHTHJYcG5h?=
 =?utf-8?B?bG1mYWt5S1VrR3hzZWFnQ1hoaWJxekJ1V3VINzFsdDYrc2lHbSsyamZKSEE1?=
 =?utf-8?B?d0lhTnl0QUIwQ1ZCbGpOaFZMenMwZ2tPUVQvbU5BQ0RKaTVWWG9pR0VBM25k?=
 =?utf-8?B?SkFFdUNib3ZSUXI1MXFBZ1d1QWlBTmQweEJYWmh5OWx3cGpJNExHakZ3ZXRp?=
 =?utf-8?B?SENPbVVmcWNrcWI4eXJZWHEwMnZiZ1V6TXR4YmZ3NWdqOTlIV0xjVkJpeXBy?=
 =?utf-8?B?S3QzMDB5WXJLSVYyTTh1b3ZoQU1oSjA4U2ZRbUdqRmJxSDlnbURGakEzOGov?=
 =?utf-8?B?WmU4c3JNSzR0RnZaZHRkOHRkb2d1T0c5allVZDkwM29LUzUzVHVYNTIvNExQ?=
 =?utf-8?B?R1hVMit4UGRDVFVnYUxHOG4wOXAwbkpOL2xwLzllM1FvRXVlK3pOZjc5QVZ5?=
 =?utf-8?B?dThvaTMxUXNKQ0MwY2ViTzhSalh3LzJrNDBuNkpGdTR1Z1M4S0VyMm5hbzE5?=
 =?utf-8?B?MERFQlZDd2lCbTdxdnZ5NEpqcmVwQzg3S2hXNC8zR0ZaLzQrc0ovVXhRWFdB?=
 =?utf-8?B?cFM3R3RZcUllblBUNmh5eWxsbHNlZkZBeXkwcUNoRGtHT3VRdVY5bmJYRzh0?=
 =?utf-8?B?ZUR3MjVjTzc5aVlPL1p3Wmhhc0RDbUIrMzZwNlEvcGkrRkRxNUNyNDZ2T2tB?=
 =?utf-8?B?cWxaM00xODFVSWdUbmdONlVESStzWHBaM05UaXQzcW4waVNWSVUxZkcvZFBt?=
 =?utf-8?B?aHNEN3lQVkNKTGR3QmViUVNFZ2Y5TVNsc2pJOE05bkRRVXI3Z3ZVbGZ6ZzJu?=
 =?utf-8?B?TzBSbmZuT0E5ay9EaFJvTFdOTzB1dHh4ODRWclIySUtWUllrZG1BOHUyUnU5?=
 =?utf-8?B?MHhwcWpFaE9TdGFYaWQrZHZUS3ZFWnBLcDE1TXA5TDhxNDhGN0FCNExKUTR0?=
 =?utf-8?B?QTRNdkFQRCtNMGNmdHdTYTY5WHRuTjNWMTRIaEhlNHd4QUUyWURCWUs5OXlh?=
 =?utf-8?B?MU5BTTdVWnRmanJCSUl4elJwdFRYZXlFZFh3eUE5NEZBRHc5VEh3U2pzZEI5?=
 =?utf-8?B?REpLVjEwY0ZpRm5rbTNlRWg3QlVjQk1WbEFWOUVSYnVxYTh5MWhKWGZ3WDR0?=
 =?utf-8?B?alZxbkFoR2Fza3RRZEFrd2hUSTJlU0lzVkxUNnlFbHlCVG5GVXJVbmRta1BJ?=
 =?utf-8?B?RHpMLy9ROVRXeGZZK0ViQWh4cDVjRE1EclBFeFZZZEUzWGdvRWZvTWY5anNs?=
 =?utf-8?B?NjZXNStoQ2ZROGZTTzZwb0g0THNXMVZ1bXBBMUNhQ1g1NUp6ejBneVgzM0Jp?=
 =?utf-8?B?SkxJTkF4UUhiSFA5QkhQR0J3QnFBUEFaVlNSKzRMRlpZR3FzQkI2TVVDeHVa?=
 =?utf-8?B?RmxpTi8vaE52QzdydEhlQmpJMUFyKzJDVGdSemxVUE1xTEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 11:08:52.6606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f95025-2a20-4b55-307b-08dd02413a15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11173

DQoNCj4gT24gOCBOb3YgMjAyNCwgYXQgMTk6NTksIEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmt1
bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEZyb206IFBlbm55IFpoZW5nIDxQZW5u
eS5aaGVuZ0Bhcm0uY29tPg0KPiANCj4gSW4gWGVuLCBTTU1VIHN1YnN5c3RlbSBpcyBzdXBwb3J0
ZWQgZm9yIE1NVSBzeXN0ZW0gb25seS4gVGhlIHJlYXNvbiBiZWluZyBTTU1VDQo+IGRyaXZlciB1
c2VzIHRoZSBzYW1lIHBhZ2UgdGFibGVzIGFzIE1NVS4NCj4gVGh1cywgd2UgbWFrZSBpdCBkZXBl
bmRlbnQgb24gQ09ORklHX01NVS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxQ
ZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8
YXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbT4NCj4g4oCUDQoNClJldmlld2VkLWJ5OiBMdWNhIEZh
bmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0KDQo=

