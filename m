Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA38B0283
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711152.1110898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWVX-0002cd-Gf; Wed, 24 Apr 2024 06:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711152.1110898; Wed, 24 Apr 2024 06:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWVX-0002Zw-DK; Wed, 24 Apr 2024 06:53:31 +0000
Received: by outflank-mailman (input) for mailman id 711152;
 Wed, 24 Apr 2024 06:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5nam=L5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rzWVW-0002Zo-Jf
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:53:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260d::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5acabd0b-0207-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 08:53:28 +0200 (CEST)
Received: from AS4P195CA0037.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::26)
 by PA4PR08MB6176.eurprd08.prod.outlook.com (2603:10a6:102:ea::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 06:53:24 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::a3) by AS4P195CA0037.outlook.office365.com
 (2603:10a6:20b:65a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Wed, 24 Apr 2024 06:53:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Wed, 24 Apr 2024 06:53:22 +0000
Received: ("Tessian outbound 9fd7e4b543e6:v313");
 Wed, 24 Apr 2024 06:53:22 +0000
Received: from 2949516410dd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F5438F42-C954-4C54-BAAD-5E9D41EE615E.1; 
 Wed, 24 Apr 2024 06:53:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2949516410dd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Apr 2024 06:53:15 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB8112.eurprd08.prod.outlook.com (2603:10a6:20b:54e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 06:53:13 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 06:53:13 +0000
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
X-Inumbo-ID: 5acabd0b-0207-11ef-909a-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ADrwTqmmi0mnSQ0RHWQ6rGI8WYXe6R55ARLhtDPI/+1tkFGp1OwC3YcCoUrFblByTYcMw2WE1abdvX52buRROK6PozFykPOlmdorhwPZmBL0x8EOOl/RFiCPaMisM2UE4hGB7laRL+Es/MtXuCN9hotww+pDJbLgJDIw90knlsAzwAUh5PBLOUDf4VRCH44tr5nPdmo7lj5ebIRZF+P1PPtTpL3ZXMo1SJJ8BrLjKFKlCU1qaMZhwdrj8FROiZfFz8p5IHmwW5QlwVvORPTDwnluSPP0Lu7gA40cuc4ThFpLkc9vMP7K06hXxGSgiQOqMttD9K9s/mH1AefpItEvjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=busXdq8d8KV/Yc0JReB5EjRj9EKJWpdU8Z/D+7EtEDc=;
 b=ChqupjQau7P8QfEeP0PjgvbnFmbEzJzDMjxBlm1QcD8W4IW8PkoVTCO7Jhptu4gBk/z1DvvnA48l3m806OsZ4IMxGAxYPNpGLh/CxIBgiF3wcppt3S8Yi95T7gPwCY+BDIwxPfkHWBXw/6L6KRRByXrawc5OA5cfi7XIE39vRDRpQ2lQaxXRjBLgkjLocqU818E4/r00CzeaTc7ho0Z+nwC20gZo+FHDhHZ5gb1jK4RVo5zklUfudttdnELn2x58hLGknIcTnTYRbwQXBYRZsA/HQpdfNlzHgTpssZLlGc6U5zTcobc64bEM0IgwF7lmi2tdr8xurOKbS5KR9j2IKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=busXdq8d8KV/Yc0JReB5EjRj9EKJWpdU8Z/D+7EtEDc=;
 b=XBIZCqNRUGsttTyAWxQ8p9abiW+pXlJ3GdxvvmKlGctsvyAuByLWlyz8/UdL7NyFibsdw8WznM9BbHNGrK3Rc/pUU/mC6QvJlVIfFLFGzyg8TcsYt9BM5s+lXza51w5z8BUETvSyb0UuhJ62AWkoI6x9OMOKB0YA4tBjHUQkn4w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d760aefda1187f74
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5GprrQX4ScppzV3T5MrEZvWDE5QwStuqm/IX4tKaxG/7cHvx46tVLPEq199phziXPjZak9s0ORkePfJv7VXPr0HT7R/gNDLiN2PIe1e+R8iHSttoVj17rn0dfj1/SZZ1wp0ZajGUpF0nRiAQMJkbox7W2ndiZGfTxHCCITQNUXRxF9JYG1K7yujByFLTyYV7/VgbqiajJfa30sKfyrWLnLNIlzYchGuz+nSe/GoCScioZukd5fCPcHbJz5THv6+LpS47+rpTcNzQSwUImiQxqGWoziy71Bb3BEU6gES+yGFZqar8Y04PbTnhTIi1UTGUZaqNnqVBSnCyIDC/GyZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=busXdq8d8KV/Yc0JReB5EjRj9EKJWpdU8Z/D+7EtEDc=;
 b=YZ7oA6pj7VxTKlJMCVk8kpzgfgBbD0X3dOWH2H9yHjFL2m/dOMty+05rskFTwArplXUDNitd7w4X9dXGAVyLOy1EEp9eiCXITmc3liFnvkRLQaldT8ibFlXBDYcq/i9IRbzXrK4sw94YEPfaqmelJ1me5+OYc9XQErpdtECIUqRfO9q5SVYnM+e/X7AqBXxe84tSrBLHUbFfLkrM0gZD3vql/037YsDaecbWUKERTRUpxH/Tbm4+dGpCPyz16vwt+FFSIZjriYJQyHOCIi06sRY6p0HhutIEfwKpmXHP3EK3gvUT2GtrL3iYAK5UQFmcf681Ulp4gEznoHOu4Ka9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=busXdq8d8KV/Yc0JReB5EjRj9EKJWpdU8Z/D+7EtEDc=;
 b=XBIZCqNRUGsttTyAWxQ8p9abiW+pXlJ3GdxvvmKlGctsvyAuByLWlyz8/UdL7NyFibsdw8WznM9BbHNGrK3Rc/pUU/mC6QvJlVIfFLFGzyg8TcsYt9BM5s+lXza51w5z8BUETvSyb0UuhJ62AWkoI6x9OMOKB0YA4tBjHUQkn4w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
Thread-Index: AQHalIgAe9tsdsjGFU69yRnUHUkm77F0KqiAgAHRoQCAAQLAAA==
Date: Wed, 24 Apr 2024 06:53:13 +0000
Message-ID: <931F0F76-3A3F-43D9-84F3-5AF9CDDB7708@arm.com>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-6-jens.wiklander@linaro.org>
 <e2ffe445-9355-45c9-bbfb-669455df4ea0@xen.org>
 <CAHUa44FMsdn8LVc782EYno7fiFDBe7RSaiNgEnnzoc-Bozt05A@mail.gmail.com>
In-Reply-To:
 <CAHUa44FMsdn8LVc782EYno7fiFDBe7RSaiNgEnnzoc-Bozt05A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB8112:EE_|AMS0EPF000001A5:EE_|PA4PR08MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fa5d65-b2a1-4fea-69e1-08dc642b3bde
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Rnl0dFc1T3FwOW81K09ranE5QTdqeVcxRGJYNnd4N1EyclV0NHNEc21JM28w?=
 =?utf-8?B?a1pjaW5HWnRZVWtjZUc4UndIU25XTTQ5RDk0MXgvREJXOUthU0xTR2djQUJN?=
 =?utf-8?B?bWNSMW1DQjVjR0lQRFZtSkE2MlRGa2pCS0laYzNVSVRaTzlxN09kYk4rZGFk?=
 =?utf-8?B?MEt2OWptbWN0VzdENTNOSjJZeGIrb2hhQWlVM2JVT3pQeFQ5eEJoeXFHb3lI?=
 =?utf-8?B?dG5laGJXM2o2VUFKc28zQmhvQnhSWjZQY1pMR05RbWJsd29pV09nTUViL2xI?=
 =?utf-8?B?b0tZYmJaUjFRK0ZQSVVaaGNEMi9GakkvbEN3ajBZU3ltdTN3NU0vM1pvK2tE?=
 =?utf-8?B?NHB4cElJcXN1MWJ0NXZVK0ZqMTJKUXAyeDZhSWJjc2NKNzVlUGczZzJDVEZV?=
 =?utf-8?B?djVROC8rSzM1bmx6T2xxS09UWC9BSkxmSDJBc0JpZ3ZJS1lMaHBMOU5ET2tU?=
 =?utf-8?B?dFlRMUxUTG42SkZiWDlFQVU5eWtMc2lTN2NXMStXME1CWXZCVzZzQmRHOCtD?=
 =?utf-8?B?ZW9TdDdQa0NQdytWRm4yR3o2MFhZU2ZVQTAwOWY1ZUFGTmc3WHk4Z1pDOW1v?=
 =?utf-8?B?UDN6NlNxSEgxTVkyak9VWnRoZmlYMVMyMFV1VFFyb1hqbTJ5Q29NWXRQQ3Bv?=
 =?utf-8?B?NFJFNjhZMitvVnV0cUp4YmVxMk5qNmJGc3pmQUE3ZU1nTEhhTWhibklJVzlT?=
 =?utf-8?B?Q3VMNFVvQmlNM2hWdTFvajJKR0JCYVVWekJzZkt3SU9hU2wzUXpRZEUzeWFr?=
 =?utf-8?B?eDJoQjVaUVpYZEt6QTFiWW42L0trMmNLWThSQStGUzUyN3ZEWHp1R1NESU50?=
 =?utf-8?B?cHdpS0ZaUE1pY1lEbHNRTDFxSlJsbWJGcW5pWVNZYjZjcVVHMWF3cDBNbUg4?=
 =?utf-8?B?Z3RZa0FkNGlHanU4Z2t6ZXVJTWFEbnp6aGJpRWNxVFVIbzhYL2NwN0Z1Nkhm?=
 =?utf-8?B?VW9rekg0UHI5WjBtMWhHOXlRUGxOOGkwMjU0NGJVN3AyUTc2ZGxHOU1tV1Fv?=
 =?utf-8?B?MWZ4aDhRR2lMcXM4U1RvaENYTzF0dzI2b3p5KzJpQXpPTGZ0SlNwV1NYdXNi?=
 =?utf-8?B?ZGViUkVoeXhjdU5NbzdCVzdoT1IydnY2TFZtOU9Kd3dFOGlWM3BUV1hISmR2?=
 =?utf-8?B?Um52MlFKK0dhekxVUmx2RStuZDdTWmNnQUlyTjFQYVZhQm1yZ21vY0o0N0E3?=
 =?utf-8?B?Rm93aVdMQWV4NzRsc1NQeTB4WTdnZkx1T242cTg2cEJUNmpyMFVFZ0lsSGRX?=
 =?utf-8?B?bHU4TXoxSlNKSnk0QUNnaWtxbXNLc0x6U0EwU3hmQ0F4bHlKVE1ueGJkMVJx?=
 =?utf-8?B?MktORTRWeEV4R1FrQit0bkhvOE50V3EwMm9TQWNvajN5WkNVNGwrV1ZoOHZQ?=
 =?utf-8?B?M3NuODhTa3c1eDhDOWgyT3JjdmVUS3dwMTUrVTg0RXJEb1ZhQXppSUdPN2Fy?=
 =?utf-8?B?dDBoL2NOa2EzWHptNm9COHJzeXZ0YUo5bXI5T1NxTy95QTNjYXQxaWhIQStW?=
 =?utf-8?B?T01oQWxkSFBxOXVEZXFYK3lncnlwMTlqNWdWYnBWTWRLV2ZPR3BZZXY0K2ll?=
 =?utf-8?B?a0g3Q21hazBKdmk1ZkpWSUMvTTFOV0dXMEdMYldVQ0dYb2ZkdXRHTy82SFdP?=
 =?utf-8?B?UmdBaHJIakpwRnJJMmJkdDVTNzU2YUVLdUxGOWNKOXR0aSs2WjFQbjhJS1BT?=
 =?utf-8?B?L0g0cHd0UytKZ0M5RWl6SmYvWnljR1IrUWhQV1crOGdNb2VzYmFvc2R6bWEw?=
 =?utf-8?B?Uk9FeU40OWhhb2hhbjVmVVZ5dTJpNmFyOWwrSTlDay83Y01Xa0NnejRsbVJs?=
 =?utf-8?B?UmhuL1pncjBpeUIwS0xOUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <71F03CD163318A4E92E162B1126DF706@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8112
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35014211-36c6-4f0a-0a8e-08dc642b3616
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400014|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnVFbGxaaWJLTmlmZVdXcEs1emhLY3FYeDBZekYxOXg0R3hmck14bXlTQ3N3?=
 =?utf-8?B?MW4waFFrSFFObXMrYThja0FvWVdUMDlFTFJ1d0FQT01sVG1mWGFaRDgyTDhS?=
 =?utf-8?B?a1YyeUNJWmVwOFJIdXNlRTVNWHNXWDNudGlqQzhRYVF0RFV2M29vSzBIZkJX?=
 =?utf-8?B?Rnl2TktDdGtXaXRBRkx6SUQwdGF5QWZhblVQRCtMZWcxM28wckswWENSK3hY?=
 =?utf-8?B?V3FJNFFmMjdUUTJiY1g3Nmk3Lzl5NkdNUkErblF6WnNWazl2emlhRFFkZHEr?=
 =?utf-8?B?aTdrWUhSZ3lYa21VeDY3cWc1OWVNUWRNRHpBc1BxMEpOQU9NTnB6UUFydUs0?=
 =?utf-8?B?bFRzekxwN0xERlEvMEVObXdwS3lZWFQ4YWlacjNWb3lpY1gwc3FmcmtIQmFV?=
 =?utf-8?B?dnowSUh4VERxVzFvSTV6UUZKRWszVmYvT3Q0SGY1VFNXV3RIOVFCbEdMZWRp?=
 =?utf-8?B?MTl5QjlLNXBXb2U3MHE1UzNITXNuOS8yOVRubjJzdGpQTXBCaTlsYTMxWEdY?=
 =?utf-8?B?TWhydFpYN1JHZ3dPVXJvSXhNQWtTVno0VUNWeHlzMVF2dFdMWEdwRTRIRGoz?=
 =?utf-8?B?YXNVRDA3QVErc2xBTlM5Y1Z5MVJkbFQ1YklZRGF3bU5LbUNWKzgraWpIN2JD?=
 =?utf-8?B?Z1pWYlZMRzQ1bDlLaWlWQllFelg3QUtweU1qbmxtYkNjakpuWVdNNm9Dc1RV?=
 =?utf-8?B?NGV2SzlPc3RKb3FJRjhnSU5KZWd5V1dzTCtpNmVBbFBwSUJkK3FPbGxUUnY4?=
 =?utf-8?B?U1JYL2kvWEphNlY5UURuRTNMUWMrZHBsODQ2N1Q4bHorRVJJeEVLVDBDOHZH?=
 =?utf-8?B?N1R5VHZlem5RbHZxTW5odXc5UmR3S0ZKNTNrNk9VbmdWRXE0ZjBPaFR2YTlC?=
 =?utf-8?B?QWVLS0gzZDhKQ3lQYlQyRDlobTY5b1hjWUhDcnF2SnU4WmFwSWpZbHVuQzk1?=
 =?utf-8?B?RThkL1VLNFhYRytZeXJORmFiMWh1ZitnK3F6QnY4cVI0SHlqUnpwUE1UQTZ4?=
 =?utf-8?B?elMyOHBXWnNtTHpvTjZuWFNvdklNM0c0cXJ3dEZKS2FDd3RhbDhQYUcydnh3?=
 =?utf-8?B?TVZEd1lSYTBzd2JxM0tnemNGQ1FRTzVIaGEzdFdFd1QwcXpvWVUvVnFRdGlV?=
 =?utf-8?B?eTJVT2FLVXc3V0dEaklwd2hNVWlQVHRLS0FWclk4NFR4ZTEySUJUZHV0dXds?=
 =?utf-8?B?cTBDUDlnS0cyKzRDazBBVHZ2NkFlSnpvbEUxeHE3VG9uaDY3MHNOM05ITWNw?=
 =?utf-8?B?OGhMQytPc2hQeHJMem0vSTNicEhoQVAxTjVTcEwvRjFDSzRxVkcrUTBGaG9S?=
 =?utf-8?B?THBqSmg2T2tRWTRJaFN4a3lPOUtOZzJKSWlUZCtWRCs3RW4zZ2U3WmxKYm9p?=
 =?utf-8?B?R3RCMlZYbkN6RWQ1ZGxvamw4NVFFdlNNcVRaMWcxWnd0dUxXUjdlNFhwWHc2?=
 =?utf-8?B?Wk91SDNDeWUxTzVReVBnanRiOFZOK1FkR1JNYWM5VndZbE1meWo4Y1UyeS9F?=
 =?utf-8?B?aGc5dW5tN2hDbHpiRVdHR3ZUN0owZWxqVjg5MW9ObXdtSWhHbDluUTBWS0Jp?=
 =?utf-8?B?QTVCYnhoNlBFWU1DNzJDRjNRc3doU2NJaVRkYTdqanlMbzNWNjV4UzdxU3R0?=
 =?utf-8?B?Ums1S3NqNXdGSHdndTBIRjZMYlpGZmhlSHVidjRpb0NNVFVRWENPKzdKT1dX?=
 =?utf-8?B?S0tMN3pIMHkvV1loeVBudktCMXBod01BdW5BOE1qT0FMUFJ3SlBMQkxjRHlz?=
 =?utf-8?B?b3JkRG9YS3F6a3pFT0owbEhYdlFkVmVUN3Npdys1VGJjSXN6UkR5KzA1cUxD?=
 =?utf-8?B?MU4rYW85bUozMjRnVTJSdGlXWGk1bEozcmtlb0UwV0JybEVlVWhkaGxWNm1Z?=
 =?utf-8?Q?RHWE5iWwSOITc?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 06:53:22.9945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fa5d65-b2a1-4fea-69e1-08dc642b3bde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6176

SGkgSmVucywNCg0KPiBPbiAyMyBBcHIgMjAyNCwgYXQgMTc6MjYsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEp1bGllbiwNCj4gDQo+
IE9uIE1vbiwgQXByIDIyLCAyMDI0IGF0IDE6NDDigK9QTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4+IA0KPj4gSGkgSmVucywNCj4+IA0KPj4gVGhpcyBpcyBub3QgYSBm
dWxsIHJldmlldyBvZiB0aGUgY29kZS4gSSB3aWxsIGxldCBCZXJ0cmFuZCBkb2luZyBpdC4NCj4+
IA0KPj4gT24gMjIvMDQvMjAyNCAwODozNywgSmVucyBXaWtsYW5kZXIgd3JvdGU6DQo+Pj4gK3Zv
aWQgZmZhX25vdGlmX2luaXQodm9pZCkNCj4+PiArew0KPj4+ICsgICAgY29uc3Qgc3RydWN0IGFy
bV9zbWNjY18xXzJfcmVncyBhcmcgPSB7DQo+Pj4gKyAgICAgICAgLmEwID0gRkZBX0ZFQVRVUkVT
LA0KPj4+ICsgICAgICAgIC5hMSA9IEZGQV9GRUFUVVJFX1NDSEVEVUxFX1JFQ1ZfSU5UUiwNCj4+
PiArICAgIH07DQo+Pj4gKyAgICBzdHJ1Y3QgYXJtX3NtY2NjXzFfMl9yZWdzIHJlc3A7DQo+Pj4g
KyAgICB1bnNpZ25lZCBpbnQgaXJxOw0KPj4+ICsgICAgaW50IHJldDsNCj4+PiArDQo+Pj4gKyAg
ICBhcm1fc21jY2NfMV8yX3NtYygmYXJnLCAmcmVzcCk7DQo+Pj4gKyAgICBpZiAoIHJlc3AuYTAg
IT0gRkZBX1NVQ0NFU1NfMzIgKQ0KPj4+ICsgICAgICAgIHJldHVybjsNCj4+PiArDQo+Pj4gKyAg
ICBpcnEgPSByZXNwLmEyOw0KPj4+ICsgICAgaWYgKCBpcnEgPj0gTlJfR0lDX1NHSSApDQo+Pj4g
KyAgICAgICAgaXJxX3NldF90eXBlKGlycSwgSVJRX1RZUEVfRURHRV9SSVNJTkcpOw0KPj4+ICsg
ICAgcmV0ID0gcmVxdWVzdF9pcnEoaXJxLCAwLCBub3RpZl9pcnFfaGFuZGxlciwgIkZGLUEgbm90
aWYiLCBOVUxMKTsNCj4+IA0KPj4gSWYgSSBhbSBub3QgbWlzdGFrZW4sIGZmYV9ub3RpZl9pbml0
KCkgaXMgb25seSBjYWxsZWQgb25jZSBvbiB0aGUgYm9vdA0KPj4gQ1BVLiBIb3dldmVyLCByZXF1
ZXN0X2lycSgpIG5lZWRzIHRvIGJlIGNhbGxlZCBvbiBldmVyeSBDUFUgc28gdGhlDQo+PiBjYWxs
YmFjayBpcyByZWdpc3RlcmVkIGV2ZXJ5IHdoZXJlIGFuZCB0aGUgaW50ZXJydXB0IGVuYWJsZWQu
DQo+PiANCj4+IEkga25vdyB0aGUgbmFtZSBvZiB0aGUgZnVuY3Rpb24gaXMgcmF0aGVyIGNvbmZ1
c2luZy4gU28gY2FuIHlvdSBjb25maXJtDQo+PiB0aGlzIGlzIHdoYXQgeW91IGV4cGVjdGVkPw0K
PiANCj4gR29vZCBjYXRjaCwgbm8gdGhpcyB3YXNuJ3Qgd2hhdCBJIGV4cGVjdGVkLiBJJ2xsIG5l
ZWQgdG8gY2hhbmdlIHRoaXMuDQo+IA0KPj4gDQo+PiBbLi4uXQ0KPj4gDQo+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaCBiL3hlbi9hcmNoL2FybS90ZWUvZmZh
X3ByaXZhdGUuaA0KPj4+IGluZGV4IDk4MjM2Y2JmMTRhMy4uZWY4ZmZkNDUyNmJkIDEwMDY0NA0K
Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4+ICsrKyBiL3hlbi9h
cmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4+IEBAIC0yNSw2ICsyNSw3IEBADQo+Pj4gICNk
ZWZpbmUgRkZBX1JFVF9ERU5JRUQgICAgICAgICAgICAgICAgICAtNg0KPj4+ICAjZGVmaW5lIEZG
QV9SRVRfUkVUUlkgICAgICAgICAgICAgICAgICAgLTcNCj4+PiAgI2RlZmluZSBGRkFfUkVUX0FC
T1JURUQgICAgICAgICAgICAgICAgIC04DQo+Pj4gKyNkZWZpbmUgRkZBX1JFVF9OT19EQVRBICAg
ICAgICAgICAgICAgICAtOQ0KPj4+IA0KPj4+ICAvKiBGRkFfVkVSU0lPTiBoZWxwZXJzICovDQo+
Pj4gICNkZWZpbmUgRkZBX1ZFUlNJT05fTUFKT1JfU0hJRlQgICAgICAgICAxNlUNCj4+PiBAQCAt
OTcsNiArOTgsMTggQEANCj4+PiAgICovDQo+Pj4gICNkZWZpbmUgRkZBX01BWF9TSE1fQ09VTlQg
ICAgICAgICAgICAgICAzMg0KPj4+IA0KPj4+ICsvKg0KPj4+ICsgKiBUT0RPIEhvdyB0byBtYW5h
Z2UgdGhlIGF2YWlsYWJsZSBTR0lzPyBTR0kgOC0xNSBzZWVtIHRvIGJlIGVudGlyZWx5DQo+Pj4g
KyAqIHVudXNlZCwgYnV0IHRoYXQgbWF5IGNoYW5nZS4NCj4+IA0KPj4gQXJlIHRoZSB2YWx1ZSBi
ZWxvdyBpbnRlbmRlZCBmb3IgdGhlIGd1ZXN0cz8gSWYgc28sIGNhbiB0aGV5IGJlIG1vdmVkIGlu
DQo+PiBwdWJsaWMvYXJjaC1hcm0uaCBhbG9uZyB3aXRoIHRoZSBvdGhlcnMgZ3Vlc3QgaW50ZXJy
dXB0cz8NCj4gDQo+IFllcywgSSdsbCBtb3ZlIGl0Lg0KPiANCj4+IA0KPj4+ICsgKg0KPj4+ICsg
KiBTR0kgaXMgdGhlIHByZWZlcnJlZCBkZWxpdmVyeSBtZWNoYW5pc20uIFNHSXMgOC0xNSBhcmUg
bm9ybWFsbHkgbm90IHVzZWQNCj4+PiArICogYnkgYSBndWVzdCBhcyB0aGV5IGluIGEgbm9uLXZp
cnR1YWxpemVkIHN5c3RlbSB0eXBpY2FsbHkgYXJlIGFzc2lnbmVkIHRvDQo+Pj4gKyAqIHRoZSBz
ZWN1cmUgd29ybGQuIEhlcmUgd2UncmUgZnJlZSB0byB1c2UgU0dJIDgtMTUgc2luY2UgdGhleSBh
cmUgdmlydHVhbA0KPj4+ICsgKiBhbmQgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIHNlY3Vy
ZSB3b3JsZC4NCj4+IA0KPj4gRG8geW91IGhhdmUgYSBwb2ludGVyIHRvIHRoZSBzcGVjaWZpY2F0
aW9uPw0KPiANCj4gVGhlcmUncyBvbmUgYXQgdGhlIHRvcCBvZiBhcmNoL2FybS90ZWUvZmZhLmMs
DQo+IGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vZG9jdW1lbnRhdGlvbi9kZW4wMDc3L2UNCj4g
RG8geW91IHdhbnQgdGhlIGxpbmsgY2xvc2UgdG8gdGhlIGRlZmluZXMgd2hlbiBJJ3ZlIG1vdmVk
IHRoZW0gdG8NCj4gcHVibGljL2FyY2gtYXJtLmg/DQo+IE9yIGlzIGl0IHBlcmhhcHMgYmV0dGVy
IHRvIGdpdmUgYSBsaW5rIHRvICJBcm0gQmFzZSBTeXN0ZW0NCj4gQXJjaGl0ZWN0dXJlIHYxLjBD
IiwgaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uL2RlbjAwOTQvDQo+IGlu
c3RlYWQ/DQoNCkkgd291bGQgc2F5IHdlIG5lZWQgdGhlIGxpbmsgdG8gQXJtIEJhc2UgU3lzdGVt
IEFyY2hpdGVjdHVyZSBpbiBhcmNoLWFybS4NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KPiANCj4g
VGhhbmtzLA0KPiBKZW5zDQoNCg0K

