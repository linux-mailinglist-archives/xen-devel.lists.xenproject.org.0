Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FAAACFFF6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008326.1387603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTu7-0001yi-Om; Fri, 06 Jun 2025 10:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008326.1387603; Fri, 06 Jun 2025 10:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTu7-0001ww-LJ; Fri, 06 Jun 2025 10:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1008326;
 Fri, 06 Jun 2025 10:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Tda=YV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNTu5-0001wq-Pv
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:02:25 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20631.outbound.protection.outlook.com
 [2a01:111:f403:2409::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5772767f-42bd-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 12:02:24 +0200 (CEST)
Received: from SJ0PR03CA0132.namprd03.prod.outlook.com (2603:10b6:a03:33c::17)
 by BL4PR12MB9484.namprd12.prod.outlook.com (2603:10b6:208:58e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Fri, 6 Jun
 2025 10:02:21 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::24) by SJ0PR03CA0132.outlook.office365.com
 (2603:10b6:a03:33c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 6 Jun 2025 10:02:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 10:02:20 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 05:02:17 -0500
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
X-Inumbo-ID: 5772767f-42bd-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyZnNCqeWhSFYgtKcPaffar21qUXvNsmh2Y3bgiA52cFj7HWP4MlidB+SPbZF463Ww8/HpJpLCUfWnkL+JQnzD+Cli7CbtGKiYJBy0R4M8HRmJKOgOl/SXaxlW6kQtR/oy+5JLJoc9luN6np1omNNjldpbg7Fw5E6RiC+Avrkrw0lj4nlh8HYByXa4SFY6ERiWKnwannuD3AKozjfTwpiUmFd0PGHP3nfzJcO3qdTrPMDtxGjl5xhNgJ+lBmE/wfE9NUC6Jb4fnhLv+eBR9QYZ1kpHeFYpS/0D0WPTm0IfBnQYffrRQ7L0Ry3sZr1DdRCXFmeEE+TDwKRyDdM6KZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfChG2vv9hSuddW3XR6SAVF6w9YZVG42YBzF3FgoU2w=;
 b=PmMC1VYDz/RUo1zUmkN/p44IBFKyll8BTeSKjFmunxf4BKWZkMU2wyQ9GzOwNtufJx6UQt+QS+l6dHWtIpSQreH2IlADGcJyKcLdKG9WL5J2bBvXcnfKoYhljU+4MIGUSXtgTbLKfvdQKpI6966HIni7q9pwoZx8gmCeHBGOH7ORWT9Cr5SlO7BaXzE8E2KE6XDOduUJ/gR43MrgL5z6MWVN9tsc2g43Ufxdfe6FjVES8q7FBexpaaI22CvZzZaHJ8u/LFnvyRnWJrqI076/kL5CMHXxndXRguw4CYpC4HpoLHD7EQElBBDjkXYoOe0FBD6vB8w4ahOFRXPUiFMB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfChG2vv9hSuddW3XR6SAVF6w9YZVG42YBzF3FgoU2w=;
 b=XLZSaRXLXonju4VhTdR6oYoHpQ0G9ArAODlCSkwyr7B0Yh4/VIX4yq1VrL2ojyx6pa7MHpJuM6YfjfY4IkDUgD1rv3q5n6Xi1+Esyc/o1QYmUqYCRrNK+kRhjEiE+Oj1IHxK8ND6xOh1cqz6rn4zx7myVoe6DQIxD1eHlHtp3/Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Jun 2025 12:02:16 +0200
Message-ID: <DAFD46XOYPG8.3V37FNPAPPT3T@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 02/15] arm/gnttab: Break links between
 asm/grant_table.h and xen/grant_table.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-3-agarciav@amd.com>
 <765d42ec-a421-4b8c-80bd-30c909e81e8d@suse.com>
In-Reply-To: <765d42ec-a421-4b8c-80bd-30c909e81e8d@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|BL4PR12MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: f318c788-fcb4-4571-c629-08dda4e13a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UW5WVkRjZksxaTVCZkhlSm1iMmlNMWRrWlVZV2Q5bVkzRUJyNUV5a3RrTGtQ?=
 =?utf-8?B?azR3Z1J5ZlNnODM3bXdCS0tWU0JuMVl1bStoUitvUGo4cjdZc25VcTdvWURS?=
 =?utf-8?B?SWQvVjR0VmhhZlJ1R2owQU9PQUs2MDlINlhxWGpHaGkvdnpjdk42NVROU0Rx?=
 =?utf-8?B?ZDFDSGgwNmVtOTJQYkovd2JXcEs5SHZyUG8rM1lXTFhhZDZhaVYrN2VtNGlu?=
 =?utf-8?B?MzUxSXQ1OCtMMU52Z2lwYktPU3QvSkdnQmN6MEFZR3NHcWlUZUhWS1JvM0pP?=
 =?utf-8?B?M08xajNUMU42NFZvb2JwaEdNQ3QyTVpEa2dEV3AzR1JjaG9xVzdEUCtra3lS?=
 =?utf-8?B?SFhRbW5FNHh6eE4wajBsZmhSTTMxN2Q5aUlOV2d0K2RERmdxU05rdXM2M0VF?=
 =?utf-8?B?Qm9lVjNMcXBWbUtER2pvOUxxWEFrdnVBbVpOUzVvOFpFMzA2dXQ5M2FXYWd5?=
 =?utf-8?B?WDgrbjNDSkFiWFNJZ2ZiMG9aY2pQenFrbG9KVjdHdEJobmpkSjgyUnZKWkJi?=
 =?utf-8?B?dG10VXlxK0ZnZkl4MFlNZEVMa2IwVWJKZEtpcU0xb1VFVGYrU2pJQWg0Uytq?=
 =?utf-8?B?ZWZLQlhJY0ppVXJ5UkJLNGFJNVBYUW11czhLeHVIMFc5SWFFaFJKNzhZb0xT?=
 =?utf-8?B?TnNGVzFsZHY5Z0lEa3AwYTl0R1cyZERRdFRVeHkyUHdSakpwZlUrTGkxNFpE?=
 =?utf-8?B?RmFEd2QxSEJsL0I5RURsUUk0YTZUUGNTOE9QaGxWNGtXeVBSYXlsS3FUNUpT?=
 =?utf-8?B?anlnc3FYenR1azZMeDdjM205NzlMS2F5R0xiUzh6ZXZLd1dSSHVwSG1vQ0J3?=
 =?utf-8?B?cy9jNEpsSW5rMzJRL3pwMVNPQTIvcXJSMFdVdlhEdG9mRnNjanpPbHNsM2tZ?=
 =?utf-8?B?MlNFcTlDM0VvSUFpdDhPYTNHUnViNUUxS0pGcU11Mmx3a0R1QWlzYTM0TGV6?=
 =?utf-8?B?dEhicU1LNzVkMXhhdGZ3Y2xqYi82RGdKM1ZhY1doeXhNQkVlOTlDcGNQMWYr?=
 =?utf-8?B?ZmdNd21XekxyTldTS3NGRDc2d3pIK1JsTndzcFRPVDI4M0VrVy9Vd21jMm5a?=
 =?utf-8?B?OTRMcGR5Q00xOUdoaW1CdEc0Q3dKNmptSmdoNUZGUkVvNmg0TzdsQ2QvUW1o?=
 =?utf-8?B?MmdjUldLOUhYeUZMQ3YvUnAvMi9RR09XQTVzeG5hRkZwS0hqOWprZm5qVkNa?=
 =?utf-8?B?OTVyYXB1MkZJSWEyQXowRFU2bEYzQ0c3R1lwL3hPYitzZFAwNGdvUS9ibzR5?=
 =?utf-8?B?YkNKSitQNWQwVmFmUnpkQVRXajVzK3lsTlBPaGZRd3FZS1d3RE53bERTYlcw?=
 =?utf-8?B?NXZPTWdsRWhBdEgzK1l0Z0RsK3RLajl6QjFmRkhhdEJTMk1pUzhKRldlMWVU?=
 =?utf-8?B?WFNvbUV6ODhWd2RBTmg0amZMMnZOOWV3L3pHamxBNlJ2YkdtOWJrSTNrS3lJ?=
 =?utf-8?B?eFFGWUdzOHc0OE04dkFuSGViYzg1MXpiWWxMaTRFUXUwUXBIWUsxczhIbGRR?=
 =?utf-8?B?emxxL213YTNYU3k1QllpVmpONmZIK08zK3M4TXlxTTZWTGpYNGhCOVZsUm1X?=
 =?utf-8?B?dGJQdGFVd290eDhIZ1RET3QvcUJXS1BpTjgra1I3bWV1a3YwbHB6azU5RTZO?=
 =?utf-8?B?aFNlazd4ZkdBd05qTnM4NDMxWGxUT2Y0WjRqRUo0VW1scllNN2dPYVVibEc1?=
 =?utf-8?B?cUpjSDBSUTdzZ05iR3d1UjVZNlJLSXYybW9hVGlhTFUzK0JXRTdrSmFrb1Zt?=
 =?utf-8?B?N2NDTWs0ZUZPcTNuekZaeWh0dUp0NkVpMjBEaVhYcFpkZTJyS0xMZWJFd05x?=
 =?utf-8?B?MXMwWEFGazRROHVkdnVFNEVkSVllVG5jTmdlc0prQnpMeFVFMFZjMVRHbXMz?=
 =?utf-8?B?UVdzeDB4MmdOaTdIdFlnWmxrZVVZWU5hMjRSVkhyS3U0Y2RIWS9KTGErM0tB?=
 =?utf-8?B?c2NUVysxV3ZkVncyK1ArTXFiekd4aTdUNi9zVkRIYUtBL1dpaW9Hbk1GV1Yr?=
 =?utf-8?B?UHhlQmUzcHVvV01QTXFsQlYzUmVGVTJ4bHptb0c0MDlBajdxQUU2UWd0enJZ?=
 =?utf-8?Q?57y5Ii?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:02:20.7160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f318c788-fcb4-4571-c629-08dda4e13a42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9484

On Fri Jun 6, 2025 at 8:52 AM CEST, Jan Beulich wrote:
> On 05.06.2025 21:47, Alejandro Vallejo wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -42,8 +42,10 @@
>>  #include <xen/xvmalloc.h>
>>  #include <xen/nospec.h>
>>  #include <xsm/xsm.h>
>> +
>>  #include <asm/flushtlb.h>
>>  #include <asm/guest_atomics.h>
>> +#include <asm/grant_table.h>
>> =20
>>  #ifdef CONFIG_PV_SHIM
>>  #include <asm/guest.h>
>> --- a/xen/include/xen/grant_table.h
>> +++ b/xen/include/xen/grant_table.h
>> @@ -27,10 +27,6 @@
>>  #include <xen/rwlock.h>
>>  #include <public/grant_table.h>
>> =20
>> -#ifdef CONFIG_GRANT_TABLE
>> -#include <asm/grant_table.h>
>> -#endif
>> -
>>  struct grant_table;
>> =20
>>  /* Seed a gnttab entry for Hyperlaunch/dom0less. */
>
> The description doesn't make clear why these two files need changing.
>
> Jan

What sort of description? I removed a conditional include  and added it to =
one
of the few places it didn't include it already along with xen/grant_table.h=
.

The title does say the patch removes the crossed includes in asm/grant_tabl=
e.h
and xen/grant_table.h.

It's, I hope, self-explanatory regular spring cleanup.

Cheers,
Alejandro

