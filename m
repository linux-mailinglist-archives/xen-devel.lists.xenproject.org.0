Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F11EFACB077
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003441.1382997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5nc-0004Wp-4U; Mon, 02 Jun 2025 14:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003441.1382997; Mon, 02 Jun 2025 14:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5nc-0004VC-1c; Mon, 02 Jun 2025 14:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1003441;
 Mon, 02 Jun 2025 14:05:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM5nb-0004V5-D7
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:05:59 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:200a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b35a46ec-3fba-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 16:05:57 +0200 (CEST)
Received: from SA1P222CA0085.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::28)
 by CH1PR12MB9624.namprd12.prod.outlook.com (2603:10b6:610:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Mon, 2 Jun
 2025 14:05:52 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:35e:cafe::2b) by SA1P222CA0085.outlook.office365.com
 (2603:10b6:806:35e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.29 via Frontend Transport; Mon,
 2 Jun 2025 14:05:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 14:05:52 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 09:05:50 -0500
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
X-Inumbo-ID: b35a46ec-3fba-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAv4ndAwkNUQaKHDIf0oFLkoN5KOE+54FDO+JK9Hc/8+sfZd5xMGWDn73nINaeoMzx1cvRbqDlso+ELQ1l9IApvgVg+IfAP2MOeMdQLf3v51K/e5iYVeaG4xlKtsoAUCMEK+FtyVAmiAP79W+k2kXlHJRfP8AielTrRTXTpGmX6czL0xhiCtB/svHXdgTCmQbnWY8rKqzOX0yqHLML6ciTndPhBaZTpan8nwyyEWVBIEqZVwGsMKModUfar0pbPrSXb+cfaFIEGLa3V58hAQPKk2GkuFNwkp3nTribaYP2pFxwM5e2S5m6suMraeFn3KAM6VwZC1ymkEPvzt+m+3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6My3KMxVFugVEvBPx0UL+Q4+Bwlp665qYLXsuj5ZfM=;
 b=yUScKXCtfaRq4C9eVgClzv6ldWW7hWLxrBGkV5QJP0Kha8RW+iT0UCfPu15YpFOp0FG4U1A7Ndi4/35CG3Zs/ChBU3B5tMris+m/zAlU4kO8ycuDKHb8rI+6Y6cbU0eWlRdHfv5qXmj/uWQgxG2xEq69xoiXdA0uHjZl4tHY4J60CV1RqnE7VFTIhRe9ffIAMkK+x+XQVM4PjT+iVt6inH0mffHDUx6+5iF88mUTmheuTJBh9wyQm0F5R6nmhvXiEXliGT1rAOWDDFUEFHoXIpW1zrBMYLECxlL6offaPWPfEloKEmt+M29Xb95ahPwlhOUIaVC95wSRXHifVhkqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6My3KMxVFugVEvBPx0UL+Q4+Bwlp665qYLXsuj5ZfM=;
 b=PE+R0fhZxE83XVG78W6LEub3iKP1sfWJmz/cjZcAui/sbOeYnTZdiXOuBCSwdYnvUX87YNjsfJIGHrRzsOWB62pTEyqgkAOb6zNOUgu4fPprDHZfOvbSB2jMyuRwZwOCyPto0cMWPlYftmUbadBICSVhQPvxFBIhxA3E+egzsJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 16:05:47 +0200
Message-ID: <DAC3SGDTA5BH.16TH8M5EOPS6R@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 04/19] xen: Add missing forward declaration to
 btcpupools_get_domain_pool_id
From: Alejandro Vallejo <agarciav@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-5-agarciav@amd.com>
 <alpine.DEB.2.22.394.2505301744040.1147082@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505301744040.1147082@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|CH1PR12MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f11e099-663e-4c02-d36d-08dda1de95c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q283aCs3UmJCK1VlOGgrQzl3M2tvN0ptQVVFWWFMdnpmVFpRK1lzbWZUdi9B?=
 =?utf-8?B?MHJxQm1ON0RBZE1jeHp3MXNkQXlOWkpET01LbitnVTJuaXZjazRxdVRtRDBp?=
 =?utf-8?B?ZWc3TDJyQkI5U1RZTWdQczBpeUorVkVHRXhQaHZyYytSN1VYQjEyVWd1QVRZ?=
 =?utf-8?B?QkZNeG5kdGlSbzZkSURMTGQ4ZkxDRnRELzhabkFiNUUvcTE5K252bHNCeFhn?=
 =?utf-8?B?ZllSOEpvemRsRXZFbVhhZEJFSVVKa0czYzQ1SmRUNi8wTXRpeW1nQThsa0Rv?=
 =?utf-8?B?TUxWUGN0L2FuV25OdlF1dXo5bjl0c1JFM1hGU1BlM3dkeXE1eEFLWlpDMnJj?=
 =?utf-8?B?Wmd6VVNjWTFrZDE4dUo1WmFZRWR5NkQvUnMrc3FzeG8rZHArMDUvdXZFeXhV?=
 =?utf-8?B?TUVSby9XbmwrNXdkK082V2w5NFU1VHpMWHc3ZnNhaURGb1N1d2JvQjhFRG5y?=
 =?utf-8?B?OUtJNGtITmQ3U014YXYvcDc5bWxMdTRad2Zha3ZENWFzL1o4S0xON3EwZ2tZ?=
 =?utf-8?B?dnBUdjFvbXBMV0xPZTJkUUxWSUs5dERsRHdTTG1lWjE0M04vVjE4TFd5Rms4?=
 =?utf-8?B?b0d4dU9ySFlpaDF1OXgvK3dTWDlKejl5MUFEMlFPL1kyclNqZHpqVDBzR2l0?=
 =?utf-8?B?aVZoRzhxSEp1VXA0RWZCWndDenlVVjBKRmFxMTVhWXZ1ZjR5aWpZUnZpcFR2?=
 =?utf-8?B?UVc2bFhuamdlSzdGbHlUVmptMlZyNmFyRUtXQWFkTzNodlJYejcrclhIcHJh?=
 =?utf-8?B?QTJ0d01jYi9vT2NET25OMUZ4dlM2eTlnZFRDSDhvU1JCck1wT3M2ektYelpN?=
 =?utf-8?B?TVpnNlNsaFJKa09zT0EvNDBjOEd0U3BxcHd4ak5XV1JhRVVIdUYxamdEVHZM?=
 =?utf-8?B?WlNPaEN4cUZteEtRcG1UU1BiSnV1YWFnWkZjRmZXRTJCTm1lMmhMRFQxeXds?=
 =?utf-8?B?NVRmNlVPc3VWL3NSSUgyNjZmT3gvajNkd2tYRHdiaGZlSTlPY3hsazQ2WnNk?=
 =?utf-8?B?Ky9WNmVTdzFNVGV4S043SXdocWt3c2R1UHljSmpORnZ2aDEwaGRoWTJqeFJN?=
 =?utf-8?B?U3ZCV3psUDRzUjcrSzFCd1ZiS3h4ZWNrZ0ZmaVFNd0FEWFg0cE12bk5qRlRJ?=
 =?utf-8?B?UUkvSTZ2em9SdjNNTFVUUEI4R2FWZXdqSGtxTUwrOE9ubnVpcjIvWk5DMUhl?=
 =?utf-8?B?elpkbi9jTEtFanNUQUFrZ2o5ekVkT21HN3NpQkVJOTZRY3haNkVJT0s1cEFt?=
 =?utf-8?B?ZEJNTFNna2kvbkxqaGpRSS94anBtQk9hQTQxZWRwRUU3cmdLN1ViZytMRTVy?=
 =?utf-8?B?eW9MVUl1VlFHVDdhRGRUaFBuRjdPRGdTTzRxa0xQbW42YUxPUkYxVVAvNVkx?=
 =?utf-8?B?VE9aK1RkNis0VVNZbGZycldZOCtwV2Z6ai9RK2w4dW53ZHBBVmxSMk84Q0ZZ?=
 =?utf-8?B?a01oSjBZUzN6Z1k2U2xYdldDN2Uydm9HVWEvL3hkc21OVHN2QlRCZnRMa2hC?=
 =?utf-8?B?bVlxNWwzQ1JqeFZ4R0VPWWF3SEtYUnFmeUhKQTM4Tko3MlV1TUYxMVNzTE9n?=
 =?utf-8?B?dmJLU2wzR1hzTVlyMm90L1lQcHN3SlJGTFNlZXlXYlF2UVZabTY2L1lQU0lh?=
 =?utf-8?B?c09nOEwvVGdmZGNPV1I5MENxWWVwQ0E3MzArSkFKeVJiZzNpWllpbXJJazZ1?=
 =?utf-8?B?Ym1qNjlCL2dUa0FHRFZwYlNrSW03N3ZpU211VUtQaWg2cnhtWXVaM3ZMRURv?=
 =?utf-8?B?RTUvY1FqdzhSTmo4THFYZyswM2I1ZFRScHBBZm9wOGZnamp5YWM3WTN3VEJy?=
 =?utf-8?B?aDBYcEJRQXdyT1M3cDBNaFJWVkQ1dVVyZGEzc0ZOVFU1MEoyYW9zdFBoZDFY?=
 =?utf-8?B?azgwQWREbkJyWFNmTjA4UmJTN0V0MVBLT0J4QXF4d1pGNVRlenR4bjk3eVF1?=
 =?utf-8?B?N2xPRUN5aXYxMlpCWmtXSEtHNnJQdHVnM1ZXTkROaXQ3Wnpua1Q0TzgwM3N1?=
 =?utf-8?B?aElzenB2emlIU0NPdWo1aVhkWlo0L0h0Zk9zVkQwRmZzTEYzQnFzN2VWcTBy?=
 =?utf-8?Q?JKAh5A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:05:52.3080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f11e099-663e-4c02-d36d-08dda1de95c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9624

On Sat May 31, 2025 at 2:46 AM CEST, Stefano Stabellini wrote:
> On Fri, 30 May 2025, Alejandro Vallejo wrote:
>> And remove the ifdef guard, as it's inconsequential.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/include/xen/sched.h | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 559d201e0c..b5a6a22c7f 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1291,15 +1291,15 @@ static inline unsigned int btcpupools_get_cpupoo=
l_id(unsigned int cpu)
>>  {
>>      return 0;
>>  }
>> -#ifdef CONFIG_HAS_DEVICE_TREE
>> +
>> +struct dt_device_node;
>> +
>>  static inline int
>>  btcpupools_get_domain_pool_id(const struct dt_device_node *node)
>>  {
>>      return 0;
>>  }
>> -#endif
>> -
>> -#endif
>> +#endif /* !CONFIG_BOOT_TIME_CPUPOOLS */
>
> Usually the commend would just be /* CONFIG_BOOT_TIME_CPUPOOLS */
> without the !

True, my bad. I think I've seen both styles around (e.g: arm/include/asm/pc=
i.h),
but it's true this one is more prevalent.

>
> Other than that:
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!

Cheers,
Alejandro

