Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44765A45C19
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 11:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896332.1305021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEvx-0006X0-6k; Wed, 26 Feb 2025 10:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896332.1305021; Wed, 26 Feb 2025 10:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEvx-0006Ti-2n; Wed, 26 Feb 2025 10:46:33 +0000
Received: by outflank-mailman (input) for mailman id 896332;
 Wed, 26 Feb 2025 10:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Soix=VR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tnEvv-00063u-N3
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 10:46:31 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20610.outbound.protection.outlook.com
 [2a01:111:f403:2606::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef5f0935-f42e-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 11:46:29 +0100 (CET)
Received: from DUZPR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::12) by PAWPR08MB10209.eurprd08.prod.outlook.com
 (2603:10a6:102:365::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 10:45:19 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::2) by DUZPR01CA0010.outlook.office365.com
 (2603:10a6:10:3c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Wed,
 26 Feb 2025 10:45:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Wed, 26 Feb 2025 10:45:18 +0000
Received: ("Tessian outbound 7c48d84d1965:v585");
 Wed, 26 Feb 2025 10:45:18 +0000
Received: from Lab717d1d58ce.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C890BDE0-5DF6-4627-98AC-7CFEEEF12471.1; 
 Wed, 26 Feb 2025 10:45:07 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lab717d1d58ce.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Feb 2025 10:45:07 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PA4PR08MB7433.eurprd08.prod.outlook.com (2603:10a6:102:2a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Wed, 26 Feb
 2025 10:45:05 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 10:45:05 +0000
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
X-Inumbo-ID: ef5f0935-f42e-11ef-9aae-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ylJ877UFiF/SYrfEGiqh20lG3j1Wxpjefn96vS7HV/NfPqmpgc4yLdlWI8Gj54RJ2HA918BOED2GBcxoIMzMCurYZr67Vv0EtXL0OixX4GcH7Z34E0cnErVZ44Ti4LG3qZlD19DQzv9ufJYihqxjSzCS9kNlD9d7pHGdOocZvGPE/btUQsjmt4iJutdI44Mso/hUmRyNmq9MEiU2kaUZ0BK+XwTMIUbL0cZtP2xq5/9m1+AbQg9KQn2MJ+NlHZzb252yEuVnUl7gkHYko/Ia6jToe2MzGHZx5BmYDwxiaLnwlS4RCFr7URgIQrPyxHont1znAtybGOLgrTg9h/CICQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahkzpFp764oeABYiJpXbFCFvfI31JfSTIRsIhKibOfU=;
 b=n6hhGtOP5BeXabnjEtowwLcjYqMh0RNBpGYej3Dp3E6FoYwaWhnmi/ni+D0JYO9KKsEGkTkvqAGlt3mOIdcDZFuhYr+UcWd2J53LarYFIoRKAsmJQcHVnaN5oWAOUasEOroCGLkX9fckFJuGfwYR2vf0sDBZ+hVO2bqjFhkk4mQFQztwpXhe8YMME3ra8HShJKdDx9oFi3Kti171B/wctmaHPbTtqFQZ/H7Ad4xJFniuJjsO2qE6Qt1xY8lgKQX9VqT1o3IcqorBR1L9/vQO9Lc3+dk+PrBc9uc8EZYzF3yPRXI0kLsF8zPudrd2rwNVinc7sCj8wdK6gdbhkZ4DfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahkzpFp764oeABYiJpXbFCFvfI31JfSTIRsIhKibOfU=;
 b=ivF4Gby7ehs+VAdEPC822Dzp4lwhVW2Bbn9++Pj6Tckf5u5Wnbw2m4kHzOXi23urpRDcWeFMba9fUFlRWp9HrLBPKynfIcncpzZbrQ/foaUcotPu/X29WpP+hsjPd8f3Sv2GGR8NduGo6nYxWHHE7U7Ld5UEXf2BGv6XRwMSq14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 543016341c872a05
X-TessianGatewayMetadata: Z36juSwP1aluExLg5Z2QUGVLPd3NDZop8mq7POwcF3bZhHK8jH3Dt+HQF0w9NG+DPLmpPtw4ee0uQs14u0EnkivANjfICqsIhUU2FM8dI1A+sWJZNXaEBEzevbg95CYuaJJCJCkbOcs7FiNxobq98YuE+CWIOUYcJI0eNqvyXkI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyDLzYEbvbDAoQqMs79aVECLLUIuOQkUOqGbPTl0zm4610yOYjw16kI5VuobkY55N0JQkk4Nxfdq/51Yu5EIpsWVb+lI1IT0/T+dBzkz4o9HCza98ZtTBHdvQMNsPvKBl3xOCiG2fLR/X1/s8qiEJlXsvY2FQcfPkVUcqxejyFU6EpRHHcgjJfJDRPkWrsZCLbczRXkX8uHzhxFTgZ0J4p6bnVT7LXanvs3GzuMmQxdP0y8+qzfKrZ0yMMUgZb1dZvQM8l+3GnHm7UlXPzfNCFzsPjbMdjcdF4ZgURWEtlwOiS06rojcZRg5sVLsfD5WFf5DPXtFyV3JiUCiZyWiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahkzpFp764oeABYiJpXbFCFvfI31JfSTIRsIhKibOfU=;
 b=GiN6rgB3+q3uccTDZu7BxeVl3IEhM+1lIdR8vg6gUUb/7+E+WEze+7FdRYukGKVVybQWTN7KdztoMmNfEeSX6NPCKPt7piS5vK0w6cWLcSk6zd4Qa7lsLaG0YY4S6uhXGBbMkPaHwvD+a5wDqRB4ub3ZbuiApzcdrQFb0WY9IoeeoPBmWkN6ZfX7RHblMTCbTbCDZzIIxlOyvZTDfem3+UqZKCejzNlLRonKQm6e6aV61vmBFgfBVlHSFyLRkvswRfGWHz/SIdiKbWCuejHBaqtjYkKfJ61Wnyl4szNbddsfsLKkZdQ6E4Gkw+bP8MApijvESupsSYY4CuNNflXQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahkzpFp764oeABYiJpXbFCFvfI31JfSTIRsIhKibOfU=;
 b=ivF4Gby7ehs+VAdEPC822Dzp4lwhVW2Bbn9++Pj6Tckf5u5Wnbw2m4kHzOXi23urpRDcWeFMba9fUFlRWp9HrLBPKynfIcncpzZbrQ/foaUcotPu/X29WpP+hsjPd8f3Sv2GGR8NduGo6nYxWHHE7U7Ld5UEXf2BGv6XRwMSq14=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Don't use copy_from_paddr for DTB relocation
Thread-Topic: [PATCH] xen/arm: Don't use copy_from_paddr for DTB relocation
Thread-Index: AQHbiCmjnkyna+WuREGzHZ/umIzQ77NZZMaAgAABvwA=
Date: Wed, 26 Feb 2025 10:45:05 +0000
Message-ID: <F32D92EA-D96B-4D5B-9770-B0D73832927D@arm.com>
References: <20250226083649.2063916-1-luca.fancellu@arm.com>
 <0ee45f03-c072-4552-b446-58fd9388dd0d@amd.com>
In-Reply-To: <0ee45f03-c072-4552-b446-58fd9388dd0d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PA4PR08MB7433:EE_|DB1PEPF000509EC:EE_|PAWPR08MB10209:EE_
X-MS-Office365-Filtering-Correlation-Id: 162e7674-0f1a-42c4-2d18-08dd5652a995
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YWxjK3lqNHpwQnF4MGpCempwQkJlUU0wUngzWFM3ZUI3RE5DTHBjeFpUU0ZE?=
 =?utf-8?B?ZVhvK1FuVXd4akJ0aHRkM21VcWlLWlROUjQwZmYvcUlsMGpLZWpxNGhZak11?=
 =?utf-8?B?MUYvQnFZY04zNkNteHZGakE0bmVxRmFMcVpLMlBDYzFmZzZIVkRxVS90bG82?=
 =?utf-8?B?YUV6c3FXbTJFc3lHZk9TRFB4TkhXbzEvVWV3NkpndDlVVUVaQ2JtU280bzll?=
 =?utf-8?B?YWl4M0UrZHlaUVJ5Tm5vZmZtTnYrL2FhZXkvUm5ZZFdweTk3bVJVWjlLMEpz?=
 =?utf-8?B?c2MwQkdqT09zNEF4WkFWTGIwb0tCWElGL0tQM01WUElsSkdmaXRYYXZLWnZ1?=
 =?utf-8?B?YU5Ib1IvYUMwbjlGT29wcERaaDNObFFGcmZYNno0YjU3OWZHejBobVNPTlhV?=
 =?utf-8?B?QmIzTnh4aWhaYkwvRmtHcWhNb1JrTE41OFJabE1UeC9xd1FJL056bFc1U2tt?=
 =?utf-8?B?UDludTQ3K09FRWg5MkthSUhtZlhadHdyWHREVzF0UTkzOXdQS0FyaEtxRGFo?=
 =?utf-8?B?UjlHZ25EZU9TSDQ5NmxHOTFFZlFaWHZya0oyakxtRGFHS3JFdms0bHVqd1Mx?=
 =?utf-8?B?cDVOa1JXZ3RKQjBkWTJlbVJPTVZZM1NPbWgrbU84blQxak8yVFhNODU1TFpr?=
 =?utf-8?B?aEhwNzF6S0dsVUVJT1BDU0pzUk90cFMrMnhWaFpYeng4R2JaVTFxaGtlMHVj?=
 =?utf-8?B?YW5zZktjelNIc2ZYUXloK1BYbGZGbE1Sa1BEU3pqa3lIMGdHVk9ZbkpNTGov?=
 =?utf-8?B?Zyt0U3ZSWGFiUGEwVDlnZHVHN2hLdlNjYlFMdjdubUdJV0RQSnVYRDBhdkE1?=
 =?utf-8?B?Z2dTMTZ5anYvVDM5S3V0anowRjVLVkpCd1ZBUzhtS3AyUHlBVk1QQmZCRk9w?=
 =?utf-8?B?RmNxREtob3NFOWJmRnJMRWRLQlEvTUdRazJVR1U0ZGxYOEZJVVBKSkliMEN4?=
 =?utf-8?B?c0FtSkVOYnVDc2xMMWoyY0VmeW1YOHZnN3kvUlBVUzVGeDBScjJreTlUd2Yr?=
 =?utf-8?B?V2NBaFVZRjJVVGpYRDZzVTNXbnFUZVVabk1HakQ1QjBPUDh0aGJqZWwzNlIz?=
 =?utf-8?B?QmxhQTV5U0R0UkdtQzM3OWtMWWlFUzc1SDZiZWlKNUYxVFFXVHFrTENyNmxB?=
 =?utf-8?B?S3VDb25WdlVBM29nQVJQWHdvVW13ZW96M0w4S0lVZTF0SFFSK2t3QnpIcUlT?=
 =?utf-8?B?R2NOb1JoYmNqVUU3NTdDMGtXcVF5d0ZvRlNWUkJuLzlTUk91Z1V1cFhIWk5F?=
 =?utf-8?B?enpqQ3orelpPYzNrL1B2OUFyaXBYSEYybjR1bkVIZDlOUHFPUHdoQlhkTkFv?=
 =?utf-8?B?S2JBT0I1T0t2dElLZFlLcVlVTjJPVWVNeWltdnZkN3dOYTI5dzNlY0x1R1Iv?=
 =?utf-8?B?ekphMXgzQ2lyZzZ6c1pEU0UxY3I3YW9TZ0V2ZnhEV1BvRE9qM2Nzd2hmRHRI?=
 =?utf-8?B?UlFaQ2JOelNkTUNwWFYzeUpjY2xhelVXc2FWb3BpalVOTVo1RUZ0YXlXcXAw?=
 =?utf-8?B?azNFeUFCSUZJc2xwYUNKOFdYUFl0Mnk3NWdXZkxMRVJvN3ZWOFVKWVZuMzIx?=
 =?utf-8?B?V0ZmVjlNVEkxQUI2MmhRRURBWlpzVWZLS0E5dFNsYW5xVEV4SVdXeXlmeUI2?=
 =?utf-8?B?aE5WKzVaU2ltUTVyK3NzNk9BMlhtOVpjZXFQaDNodHdiTEF3czNlZEF1UUh3?=
 =?utf-8?B?R3d2OGcrc1Rad3JNQkQxWFFLZHdzMkJ3U2IrOXNYTXZkaUtwWUdnSHNVRHNl?=
 =?utf-8?B?Z0luRjJKL1hYVXk5NWEyY1RNbHJRUDlGZ2lQWUhUaWR2WXY0Tk5wejBXVmhM?=
 =?utf-8?B?Q2tSVzl1ckErVzhwVUtYQWhVamZxUUo0TElwYjNta2xNdGtuY0FiVFQ4RWJO?=
 =?utf-8?B?ZnBOSmdwWElqMTl3L3l6WlJxamdPUnF4WEgrNlc0Y0t3cWthQ05lQ1IwdUE0?=
 =?utf-8?Q?mGP0NUane80RhABk1HkFXmIl1Evknebv?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C44C35342C2C246A22188A59B6CA672@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7433
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e12af388-f91e-42ee-3cf9-08dd5652a176
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUxSQUdUYmFXc21DcCtxYm1oQ2hWVGcvQ3I3Q1NmSDBheDFqVURtdHg1aEJT?=
 =?utf-8?B?N09CTEhaZXVuK2M0cFNUdkRrRVVvM2lsek4rVGYvZi9jS3FTWld0WUhzdWM0?=
 =?utf-8?B?L1dDMk9ab3VSb2xpY2N1M1VDY3ZkVURSbE5nMTlIQ3YvNGpTMXVuTjhuMVpq?=
 =?utf-8?B?THBqYUp5VFZJRjdkNGVTejhpRjhPL2RCa3JsZzBQYWwwZGNLNW82eEJwK0tY?=
 =?utf-8?B?aVVFSUxRUVlsNUw3UEpHQ0UwT2EwYjIybU56SkZ1N05CZjVkRkptY2h0b0E3?=
 =?utf-8?B?cGJ2UnJybjRrbGFsYldVTU90bUdqTWl4U1pyY3YxVVVvTjYyQm5ZMklxc0FW?=
 =?utf-8?B?K2NUaUNIK2hPMEVaTDQyaW5SdTYzeEczTS9UMTFBTE5hWTd6SU1yS1lqSm9U?=
 =?utf-8?B?UXlRRHZXSldYN1R4YVhNc1dBaSs3enZWTzZ4REo1bTlaVGdhc0lNZW0zeDRr?=
 =?utf-8?B?S1cwSU0wcnN1VFU3WkxrbDVQeTRYeUFoemZSZWwvbXVNTk1vOWtiaEhMWExY?=
 =?utf-8?B?Z25rYUcrck1zd2hXOElBYWdqWTZQNDBuUk55d3JGM0MxVTlWNjUraVZFWEEr?=
 =?utf-8?B?VjhLSmdGaWhxeGZQUkx1S0RHUjluY0h0MU1DdC9qZ1h5WWNqZHY1bk1CcitT?=
 =?utf-8?B?V3ZqR21kbUc0SnpKOUtHT1M4NmY2NGYvYzJaNWF4eEcxbXFoNXovVXBNNHN6?=
 =?utf-8?B?aWhFWE9nQlBaMm0ybitIYzhFcURzVUErWEpaTzhDeUZMNDNLN0FjeEhPc1U1?=
 =?utf-8?B?V01sbDhwM1N4MnVZdkpwdEJIZk4vb2p0UnVIQ0hnR3BHUWZHckN4RHVBZ0pa?=
 =?utf-8?B?cGRIWlV6TXlXbFFZK2pzZzc0VGp2SHB0MmpIYnQ3d2JZQmN6bWVPRXJ6S3VB?=
 =?utf-8?B?R3BQV1ROMlZuRWpoUVlXa0tFSUQrOTVvWmRVSnYyT1poZ1hVdmxuWm5CRCtC?=
 =?utf-8?B?TDZ4NzVPREk0RXg0ZVRIZFNaclhPRmUyZ2dFbGJyVzZyM2JpQ2trUmpSUHBv?=
 =?utf-8?B?QndVdEdnaUZ5VkpyZmJBaXBSZXJlSGRaSGl5T1IxZFkvQzJCMkdEZjZUTXF6?=
 =?utf-8?B?dGF0RWtTOFFnbVFIYlI5MmZNdldEQzFXWkNYTm9oUEF3YTdQdnB2RXFwZDFQ?=
 =?utf-8?B?UnhUYlV5N0p1ZW90SmlRMjYzZGpSekY2dTlWMWtxRTFjV3dwTzNtbnRQc1Fn?=
 =?utf-8?B?WEJKajJFWjRhOEora09teW9RY3FtenBRNU93b1Zzdm5UVFRCQXY4SDd2bmNF?=
 =?utf-8?B?bjFkMjNlekNjUlJHdFVMdmFBTWt1ejRqVVIzMkU1d0diTERDelVFRHFLVXY5?=
 =?utf-8?B?aUxPZHFDUXNoSGdxNktGRTJxSWhxb0ZHdzVLZ21LYldoYlRON2JjLzhzaWZp?=
 =?utf-8?B?WWkvVUVNMU1mazdsNlVZbWIvaklPbkVIM0ZlYjNZcXU1b2NacVVrVjBhMzFK?=
 =?utf-8?B?SWduK3l4dGx1Y2R3SUR0QmhuNFRnblVwcFFtZi9BK09ST0JhUEtKMkxicmpI?=
 =?utf-8?B?NDBwSTZEMWVUNSthMzVZSWxvUEpjRkJaamhOQVFvaTR5U0prTi85MW82WEE1?=
 =?utf-8?B?WDhPckN4WUU3bXI1OGtMRmNlczFHaEhHWit3ZVRaMHhTZGxRTm5Oa3ZPZit0?=
 =?utf-8?B?Y2dsMXZwSHlIeDdvWjJ0QVZsbklrQWR4b1FuVTRmNHI5dFNkdE5CMDQ5Mm5D?=
 =?utf-8?B?VlhRV1JHNWF6RXcvdEpVYlpJK1d3Y3p6a21kUGYrUzZqdm5PUkRPSVNUdkQz?=
 =?utf-8?B?RkJLajNJL1VWSmFJTWNQNEVmYmhRdnZaYkxtT2orc21ZNEF1S1ZiSUxwMlZj?=
 =?utf-8?B?NXhUdU5LZ0ZCY1FjMExDZFRyQVFYSkRnM0U2V291c2JqRW90RitJNExQc2xJ?=
 =?utf-8?B?Vk5jaDNwOHU3b1VLcXZDb01RZkxTZ3pGL3BITGRRWCtPWU1uaUhLYXVlYjVM?=
 =?utf-8?B?NUNua0d1TmJYMkd3K3pYVGtZTWpKUkdKelJySUU3UndIMjlVbmJKWTJJampJ?=
 =?utf-8?Q?ivIBqdlrDT9SZoRKsaI3vxVcQquSNw=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:45:18.7661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 162e7674-0f1a-42c4-2d18-08dd5652a995
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10209

SGkgTWljaGFsLA0KDQo+IE9uIDI2IEZlYiAyMDI1LCBhdCAxMDozOCwgT3J6ZWwsIE1pY2hhbCA8
bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAyNi8wMi8yMDI1
IDA5OjM2LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IEN1cnJlbnRseSB0aGUg
ZWFybHkgc3RhZ2Ugb2YgdGhlIEFybSBib290IG1hcHMgdGhlIERUQiB1c2luZw0KPj4gZWFybHlf
ZmR0X21hcCgpIHVzaW5nIFBBR0VfSFlQRVJWSVNPUl9STyB3aGljaCBpcyBjYWNoZWFibGUNCj4+
IHJlYWQtb25seSBtZW1vcnksIGxhdGVyIGR1cmluZyBEVEIgcmVsb2NhdGlvbiB0aGUgZnVuY3Rp
b24NCj4+IGNvcHlfZnJvbV9wYWRkcigpIGlzIHVzZWQgdG8gbWFwIHBhZ2VzIGluIHRoZSBzYW1l
IHJhbmdlIG9uDQo+PiB0aGUgZml4bWFwIGJ1dCB1c2luZyBQQUdFX0hZUEVSVklTT1JfV0Mgd2hp
Y2ggaXMgbm9uLWNhY2hlYWJsZQ0KPj4gcmVhZC13cml0ZSBtZW1vcnkuDQo+PiANCj4+IFRoZSBB
cm0gc3BlY2lmaWNhdGlvbnMsIEFSTSBEREkwNDg3TC5hLCBzZWN0aW9uIEIyLjExICJNaXNtYXRj
aGVkDQo+PiBtZW1vcnkgYXR0cmlidXRlcyIgZGlzY291cmFnZSB1c2luZyBtaXNtYXRjaGVkIGF0
dHJpYnV0ZXMgZm9yDQo+PiBhbGlhc2VzIG9mIHRoZSBzYW1lIGxvY2F0aW9uLg0KPj4gDQo+PiBH
aXZlbiB0aGF0IHRoZXJlIGlzIG5vdGhpbmcgcHJldmVudGluZyB0aGUgcmVsb2NhdGlvbiBzaW5j
ZSB0aGUgcmVnaW9uDQo+PiBpcyBhbHJlYWR5IG1hcHBlZCwgZml4IHRoYXQgYnkgb3Blbi1jb2Rp
bmcgY29weV9mcm9tX3BhZGRyIGluc2lkZQ0KPj4gcmVsb2NhdGVfZmR0LCB3aXRob3V0IG1hcHBp
bmcgb24gdGhlIGZpeG1hcC4NCj4+IA0KPj4gRml4ZXM6IDFiZGM4MWRhYzgxNiAoImFybTogc2V0
dXAgTU0gdXNpbmcgaW5mb3JtYXRpb24gZnJvbSB0aGUgZGV2aWNlIHRyZWUiKQ0KPiBXaHkgRml4
ZXMgdGFnPyBJIGRvbid0IHNlZSBpdCBhcyBhIGJ1ZyBhbmQgc29tZXRoaW5nIHdlIG5lZWQgdG8g
YmFja3BvcnQuLi4NCg0Kb2sgSeKAmWxsIHJlbW92ZSBpdA0KDQo+IA0KPj4gU2lnbmVkLW9mZi1i
eTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gLS0tDQo+PiB4ZW4v
YXJjaC9hcm0vc2V0dXAuYyB8IDcgKysrKy0tLQ0KPj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4+IGluZGV4IGMxZjJkMWI4OWQ0My4u
YjFmZDRiNDRhMmUxIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+PiBAQCAtMjM3LDE0ICsyMzcsMTUgQEAgdm9pZCBf
X2luaXQgZGlzY2FyZF9pbml0aWFsX21vZHVsZXModm9pZCkNCj4+IH0NCj4+IA0KPj4gLyogUmVs
b2NhdGUgdGhlIEZEVCBpbiBYZW4gaGVhcCAqLw0KPj4gLXN0YXRpYyB2b2lkICogX19pbml0IHJl
bG9jYXRlX2ZkdChwYWRkcl90IGR0Yl9wYWRkciwgc2l6ZV90IGR0Yl9zaXplKQ0KPj4gK3N0YXRp
YyB2b2lkICogX19pbml0IHJlbG9jYXRlX2ZkdChjb25zdCB2b2lkICpkdGJfdmFkZHIsIHNpemVf
dCBkdGJfc2l6ZSkNCj4+IHsNCj4+ICAgICB2b2lkICpmZHQgPSB4bWFsbG9jX2J5dGVzKGR0Yl9z
aXplKTsNCj4+IA0KPj4gICAgIGlmICggIWZkdCApDQo+PiAgICAgICAgIHBhbmljKCJVbmFibGUg
dG8gYWxsb2NhdGUgbWVtb3J5IGZvciByZWxvY2F0aW5nIHRoZSBEZXZpY2UtVHJlZS5cbiIpOw0K
Pj4gDQo+PiAtICAgIGNvcHlfZnJvbV9wYWRkcihmZHQsIGR0Yl9wYWRkciwgZHRiX3NpemUpOw0K
Pj4gKyAgICBtZW1jcHkoZmR0LCBkdGJfdmFkZHIsIGR0Yl9zaXplKTsNCj4+ICsgICAgY2xlYW5f
ZGNhY2hlX3ZhX3JhbmdlKGR0Yl92YWRkciwgZHRiX3NpemUpOw0KPiBUaGUgcHVycG9zZSBvZiBj
bGVhbmluZyBkY2FjaGUgYWZ0ZXIgbWVtY3B5IGlzIHRvIGNsZWFuIHRoZSBuZXcgYXJlYSBpLmUu
DQo+IGRlc3RpbmF0aW9uID09IGZkdCwgbm90IHNvdXJjZSByZWdpb24uDQoNCndvb3BzLCBteSBi
YWQsIEnigJlsbCBmaXgNCg0KPiANCj4+IA0KPj4gICAgIHJldHVybiBmZHQ7DQo+PiB9DQo+PiBA
QCAtMzYyLDcgKzM2Myw3IEBAIHZvaWQgYXNtbGlua2FnZSBfX2luaXQgc3RhcnRfeGVuKHVuc2ln
bmVkIGxvbmcgZmR0X3BhZGRyKQ0KPj4gICAgIGlmICggYWNwaV9kaXNhYmxlZCApDQo+PiAgICAg
ew0KPj4gICAgICAgICBwcmludGsoIkJvb3RpbmcgdXNpbmcgRGV2aWNlIFRyZWVcbiIpOw0KPj4g
LSAgICAgICAgZGV2aWNlX3RyZWVfZmxhdHRlbmVkID0gcmVsb2NhdGVfZmR0KGZkdF9wYWRkciwg
ZmR0X3NpemUpOw0KPj4gKyAgICAgICAgZGV2aWNlX3RyZWVfZmxhdHRlbmVkID0gcmVsb2NhdGVf
ZmR0KGRldmljZV90cmVlX2ZsYXR0ZW5lZCwgZmR0X3NpemUpOw0KPiBOSVQ6IEl0IGNhbiBiZSBq
dXN0IG15IFBvViBidXQgaXQgcmVhZHMgb2RkLiBXaHkgY2FuJ3QgcmVsb2NhdGVfZmR0IG1vZGlm
eQ0KPiBkZXZpY2VfdHJlZV9mbGF0dGVuZWQgcG9pbnRlciBkaXJlY3RseSBpbiB0aGUgZnVuY3Rp
b24/DQoNCnlvdSBtZWFuIHNvbWV0aGluZyBsaWtlOiANCg0Kc3RhdGljIHZvaWQgKiBfX2luaXQg
cmVsb2NhdGVfZmR0KHNpemVfdCBkdGJfc2l6ZSkNCnsNCnZvaWQgKmZkdCA9IHhtYWxsb2NfYnl0
ZXMoZHRiX3NpemUpOw0KDQppZiAoICFmZHQgKQ0KcGFuaWMoIlVuYWJsZSB0byBhbGxvY2F0ZSBt
ZW1vcnkgZm9yIHJlbG9jYXRpbmcgdGhlIERldmljZS1UcmVlLlxuIik7DQoNCm1lbWNweShmZHQs
IGRldmljZV90cmVlX2ZsYXR0ZW5lZCwgZHRiX3NpemUpOw0KY2xlYW5fZGNhY2hlX3ZhX3Jhbmdl
KGZkdCwgZHRiX3NpemUpOw0KDQpyZXR1cm4gZmR0Ow0KfQ0KDQoNCkNoZWVycywNCkx1Y2E=

