Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52476A91B40
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 13:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957410.1350539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Nld-00009C-Er; Thu, 17 Apr 2025 11:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957410.1350539; Thu, 17 Apr 2025 11:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Nld-00007c-By; Thu, 17 Apr 2025 11:50:53 +0000
Received: by outflank-mailman (input) for mailman id 957410;
 Thu, 17 Apr 2025 11:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5Nlc-00007W-65
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 11:50:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2415::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31d908c1-1b82-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 13:50:45 +0200 (CEST)
Received: from SJ0PR05CA0074.namprd05.prod.outlook.com (2603:10b6:a03:332::19)
 by CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Thu, 17 Apr
 2025 11:50:40 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::15) by SJ0PR05CA0074.outlook.office365.com
 (2603:10b6:a03:332::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Thu,
 17 Apr 2025 11:50:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 11:50:39 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 06:50:37 -0500
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
X-Inumbo-ID: 31d908c1-1b82-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bW09TDEsesLFj8E54VzJJBMH03X0GyVRayc23zBuLCqLJpoj/hWgVgi4g6wnoWf1bAjffqNiMH889HhhaO5pVnC99X7yOVNT+xp0+V+o7GCmWBpYYyNuiY2DG9eVYTpjU0JbS7JR5LsGGaTIkBdP84EGUEKXpvqeLBC7bOOig51FX3kP9phytbbs5PQ4/YaTqNatfcDD5nHDgg7m3Mi+B2VIa3DjtmiX+qlUKH7avJenRArpkr8UY7Od9HgEd65MA0XxBfVyNB6Kt4OE132xBkb32ZJjom2CGKu5Bc9yBCJX+etS5UHnKUUMkSuC/ey8YlN//4+nSuqJwlrp1uSRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0Yo2GLQ5z3IlxCixolTZDv8aGROSZDjeKkgq/TkwMI=;
 b=NPp2wjXpFKXX5jtoQ0LELquGk+6CxfcdxwrZMRS/wETHU6Xcx77ZqU/eJXZ+qMO/OS2mQUXfMKe4sYTaVgeZfOzP0bZFaPdg6IgeJZDtEbEeyPHW3UzoFJ7lwEwqqBMpheKP3phuwDI4vJ/tpQgSKv24ad9zikwA4jdXP4oQfLas2iTnzC84RA5gbVW8bSJ03jvq3kStkdcwdFGqYwGc+1jhMzggEY+iwIrAB8xysKSIuOEBjf1GN0TPyiSzLI23+XhC5aI/EOE1sAs7Ad5sq1cfGGiaDjpQVwFk91SUrrYZKjdLvaCycaaPxdMikjv1PaA5u1MWVxkLFHQM2iHDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0Yo2GLQ5z3IlxCixolTZDv8aGROSZDjeKkgq/TkwMI=;
 b=nMpCuaYZQ2xVDYHc/poD1NHa37N7Nf58D4YEGRTxe++Ltwnhx28nSmMGtJqL1lYkq/vuPnPKS0RFpvtqvgBFsFIPXD9ZPACEPnCKGM+c/XKTSyLah4gQ8IVUOhyTqHz/MrfCgy66yP4T+7je6BNTXCvO+Z+XeChalzQJSi/4fTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Apr 2025 12:50:36 +0100
Message-ID: <D98W3W2Z5PY1.6C434P75LNV7@amd.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, <xen-devel@lists.xenproject.org>,
	<consulting@bugseng.com>
Subject: Re: [PATCH v3 08/16] x86/hyperlaunch: Add helpers to locate
 multiboot modules
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-9-agarciav@amd.com>
 <fe282aa0-fe2d-49b8-a2aa-325c9825304b@suse.com>
 <D96EI9O4XII2.195QNQNT1T3FG@amd.com>
 <3d2aa870-a1cb-4e33-841d-aee7b6b6db83@suse.com>
 <D96K3ZYDCY4D.11Q4T2TZLNNEU@amd.com>
 <ea28d057-5fd5-4cc2-8833-5427015a4190@suse.com>
 <173f7129e82958a9737627129ac3c5be@bugseng.com>
In-Reply-To: <173f7129e82958a9737627129ac3c5be@bugseng.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 099560b4-530b-40ff-0b8a-08dd7da61320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHBMZzRBcUwzMGtEWEJjcThZQUN4d3lFbkN4WU55RmlPZUxxclZQSGx0aUlw?=
 =?utf-8?B?NkhxVFEyelY0VUpEdDVGUTVQR3pmREtnVzRmaEdJV2VyVFlDT3RQcm9hMGd1?=
 =?utf-8?B?dVlIZ3JwY3orWHljdjZUMnNJMGp1OGJsMEFtU3ljM0ZFS0xtaG9ac0VNUm1z?=
 =?utf-8?B?L0J1TVlxZ0tmZXhrMER0Z2RIUGtSaFJaRE9UbTU4QjVTc0RsdlJzUU45UnRa?=
 =?utf-8?B?bGE3dDUxeW9LNlVVdFZTTTVJckdvWUFGZkxpWGhsTXdydjI4Vkc2bXJBemx5?=
 =?utf-8?B?eFhFeUdvcDVYQ0lhVy9ZbEo1UTVVSk5Uajg4eU92dDZJcnJlTzdNdHlDYmgz?=
 =?utf-8?B?a3ZYbHAyY2NNenVpTlF3bk5KQzhOaFJhUkVuMEptK0ZFc29FWEE3dTJtZVpn?=
 =?utf-8?B?eFQ1blFFZ3RXTi9WbUtmNlhwUEFEUzJpRnpSVEoweGZvVjdCRWYvTTNYQmFz?=
 =?utf-8?B?K1dnVXRKSXNEMlQ4RHFDb2t4Y0JBK1JKYk1STm04cHVoanBwTHNmOGVFZ1RC?=
 =?utf-8?B?Z3ROMExnWXRiNit2MkNGOGNaV3R5SEwvRnpUeHYzcHJBcnZSRmRMZ0FncVZZ?=
 =?utf-8?B?Z3gwRlpiNDhxRWc0OEJ2QVNWVmx2S1ZuR2daL1ovYTNhb2ZZUjAvaVZ2U3l4?=
 =?utf-8?B?WEd4NzYyQUw1VzFmUjdUZFphMTVEbzJOZUpsdEM3YTE3WWpWeGNSVVR0NVg1?=
 =?utf-8?B?UEV5RCt3bmdxL1BUNUYyV1Z0K1NzMDJLaDlIS08rZkNPQjQyZE9FSzl2Uk8z?=
 =?utf-8?B?di8wNjRjeTE5dHZ4YUQvZE9BelcxR29CQ2hiVU9sUVMwd0d3NGZuVWpNcnRs?=
 =?utf-8?B?K01BMmxZRGtoTEQ0UEY2eU1yaDBoN3pVU0lTOUhIV2dLTlgwSVNvYWlnNDFS?=
 =?utf-8?B?SDNObkRJOCtJdmNicHhOQlRvR1VZaTdKMlBmRHJGaXJvbjVFUmJ6Q0ZzWk9v?=
 =?utf-8?B?b1pSS3BScmpoSFF0TnBweTNiOU5GbHVpOXRxd0grcGNGbVVuMHFuWGFXelFO?=
 =?utf-8?B?blJJODJlTTdTUlNCbjZhRHlXL1k5OWt5T0xmVUkwV1BqdENjYWs0M2NQUVlD?=
 =?utf-8?B?d2M5azJlZUJ6eDJtTWxGMUdWeWlESUpPaUFnSTdiTTJaclQzc2poSWZLRDRU?=
 =?utf-8?B?R3k5d3ZJYUdwZ3FUMXVEYXZJRldTa05mUFluYlRUcUpVdzlCeDIyNmVOQUtN?=
 =?utf-8?B?cjJ3bC9pZW0zMCtmNzNSa0w2RjRXOG4yRk40NE40cVoxcjZ6VUVLQ1d2azcy?=
 =?utf-8?B?SHk0b1A4VE1LZ2pSYVh0cHZoaHVybVRUVCt5YTkvNWRlK09WV2oyNXRNSlA5?=
 =?utf-8?B?WmUzWHVyL0NHYnBCSnBwYmhNRU0ydGhQZi9KL09PVGw4N0lqVDY5SWgyYzNC?=
 =?utf-8?B?Y0lpMlB6dWdnREpEYmwvNHpPRVJSZzhEeEhra1hyditFSFc5akVSd0R2WWRG?=
 =?utf-8?B?VUdZL2tURndMNnYyT3VkSUIweWZYZndMQVJkNU1yeDlhZzNlcmxKVzhyZEFI?=
 =?utf-8?B?eWZhWVZkb3M5MTNHNmUydkQ5TWV3ZjRrcTFxbEJDcno0WWdzeWdadXZEOEhP?=
 =?utf-8?B?eXFIUFd3c1hmeG9zRkFIdVBUbHArNXBLTXlPTms1bnN3eG9vblVmaWN3QTV3?=
 =?utf-8?B?ZkZsMytoOFBpbnp2a2F5bmExOHVQVWc3TnVkTzBRcHRDK2RwQVpzbDBoNDZB?=
 =?utf-8?B?L3Z1Zk90T09ZZEZmdW1YY3ovUDU0YkJJQVk3a3pRV3JLeG9UQzdJczhTeUYr?=
 =?utf-8?B?T1hET2ZmWE8xR1hOYXNOS0ZUd2o2T0EwNWdOeXRmWGJLSS8waWMyaWpNUStk?=
 =?utf-8?B?MXRDbHQybDJWMlRWbXpEVTFqZS9XemlJNVJMM0tBUFpNWkhQeitDUktLZnpG?=
 =?utf-8?B?dDJEa0VPODRmNGNXL1NwU0xkcEhnZTEwT2ZVa1pYMzk1MXQrSE04S3Yzbk95?=
 =?utf-8?B?TmIwNFY3QmZKUy9aY2RKNG5CM25sRzlBa051K2xmOWM1TkljelhXLzZubjlD?=
 =?utf-8?B?bTREaGxCb1NBNWNSdlB2dHFWcnpUYzN5Wk93TG1XSGdyQzhIVVZyNzM5bHFu?=
 =?utf-8?Q?MjWUr/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:50:39.3670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 099560b4-530b-40ff-0b8a-08dd7da61320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889

On Wed Apr 16, 2025 at 5:55 PM BST, Nicola Vetrini wrote:
> On 2025-04-15 08:05, Jan Beulich wrote:
>> On 14.04.2025 20:01, Alejandro Vallejo wrote:
>>> On Mon Apr 14, 2025 at 4:05 PM BST, Jan Beulich wrote:
>>>> On 14.04.2025 15:37, Alejandro Vallejo wrote:
>>>>> On Thu Apr 10, 2025 at 11:42 AM BST, Jan Beulich wrote:
>>>>>> Functions without callers and non-static ones without declarations=
=20
>>>>>> are
>>>>>> disliked by Misra.
>>>>>=20
>>>>> Can't do much about it if I want them to stand alone in a single=20
>>>>> patch.
>>>>> Otherwise the following ones become quite unwieldy to look at. All I=
=20
>>>>> can
>>>>> say is that this function becomes static and with a caller on the=20
>>>>> next
>>>>> patch.
>>>>=20
>>>> Which means you need to touch this again anyway. Perhaps we need a=20
>>>> Misra
>>>> deviation for __maybe_unused functions / data, in which case you=20
>>>> could
>>>> use that here and strip it along with making the function static.=20
>>>> Cc-ing
>>>> Bugseng folks.
>>>=20
>>> It's a transient violation, sure. Do we care about transient MISRA
>>> violations though? I understand the importance of bisectability, but
>>> AUIU MISRA compliance matters to the extent that that the tip is
>>> compliant rather than the intermediate steps?
>>=20
>> Thing is that quite a few rules are blocking now. I haven't checked=20
>> whether
>> the one here (already) is; if it isn't, we can't exclude it will be by=
=20
>> the
>> time this patch is committed. If then the next patch isn't committed
>> together with it, we'd face a CI failure.
>>=20
>
> It's Rule 8.4, and it is indeed blocking. To double check, a scan on a=20
> push containing this patch should trigger the failure.
> You may transitively add an inline deviation comment or just a deviation=
=20
> with a configuration (I can help if needed), justified by the subsequent=
=20
> addition of static.

Thanks for the context!

If I'm going to add something and remove it later might as well add the
missing declaration and remove it when static-ifying the function.
Particularly because I don't see a suitable x in SAFE-x-safe to use. (1
or 13 may work, but they hardly reflect what's being done.)

My bad for (mis)assuming transient states merely required bisectability
rather than full MISRA compliance.=20

Cheers,
Alejandro

